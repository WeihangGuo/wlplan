import logging
import time
from heapq import heappop, heappush

import numpy as np
import pymimir
from ipc23lt import get_dataset, get_domain_benchmark_dir, get_mimir_problem, get_predicates
from sklearn.gaussian_process import GaussianProcessRegressor
from sklearn.gaussian_process.kernels import DotProduct

import wlplan
from wlplan.feature_generation import WLFeatures

LOGGER = logging.getLogger(__name__)

PROBLEM = "p1_01"
EXPANSION_LIMIT = 300


class Node(object):
    def __init__(self, state: pymimir.State):
        self.state = state

    def __lt__(self, other):
        return hash(self.state) < hash(other.state)


def test_train_eval_blocks():
    """ Not optimised at all as the GBFS queue is implemented in Python """

    ### Train
    ## collect features
    wlplan_domain, dataset, y = get_dataset("blocksworld", keep_statics=False)
    feature_generator = WLFeatures(
        domain=wlplan_domain,
        graph_representation="ilg",
        iterations=4,
        prune_features=None,
        multiset_hash=False,
    )
    feature_generator.collect(dataset)
    X = feature_generator.embed(dataset).astype(float)
    y = np.array(y)
    LOGGER.info(f"{X.shape=}")
    LOGGER.info(f"{y.shape=}")

    ## train a simple linear kernel GP
    linear_kernel = DotProduct(sigma_0=0, sigma_0_bounds="fixed")
    model = GaussianProcessRegressor(kernel=linear_kernel, alpha=1e-7, random_state=0)
    model.fit(X, y)
    y_pred = model.predict(X)
    mse_loss = np.mean((y - y_pred) ** 2)
    LOGGER.info(f"{mse_loss=}")
    w = model.alpha_ @ model.X_train_  # linear weights from GP
    y_pred_fast = X @ w.T
    mse_loss_fast = np.mean((y - y_pred_fast) ** 2)
    LOGGER.info(f"{mse_loss_fast=}")
    assert np.isclose(mse_loss, mse_loss_fast)

    ## initialise testing problem
    LOGGER.info(f"Constructing mimir problem...")
    domain_dir = get_domain_benchmark_dir("blocksworld")
    domain_pddl = f"{domain_dir}/domain.pddl"
    problem_pddl = f"{domain_dir}/testing/{PROBLEM}.pddl"
    mimir_domain, mimir_problem = get_mimir_problem(domain_pddl, problem_pddl)
    LOGGER.info("Constructing mimir succ generator...")
    succ_generator = pymimir.LiftedSuccessorGenerator(mimir_problem)
    # succ_generator = pymimir.GroundedSuccessorGenerator(mimir_problem)
    name_to_predicate = get_predicates(mimir_domain, keep_statics=False)
    goal_atoms = set(goal.atom for goal in mimir_problem.goal)

    def mimir_to_wlplan_atom(mimir_atom):
        return wlplan.planning.Atom(
            predicate=name_to_predicate[mimir_atom.predicate.name],
            objects=[o.name for o in mimir_atom.terms],
        )

    objects = [o.name for o in mimir_problem.objects]
    positive_goals = [mimir_to_wlplan_atom(atom) for atom in goal_atoms]
    negative_goals = []
    wlplan_problem = wlplan.planning.Problem(
        domain=wlplan_domain,
        objects=objects,
        positive_goals=positive_goals,
        negative_goals=negative_goals,
    )
    feature_generator.set_problem(wlplan_problem)
    goal_names = [str(atom) for atom in goal_atoms]

    ### Test
    ## GBFS
    def is_goal(state):
        state_atom_names = set([str(atom) for atom in state.get_atoms()])
        for atom in goal_names:
            if atom not in state_atom_names:
                return False
        return True

    def get_h(state):
        wlplan_atoms = []
        for atom in state.get_atoms():
            wlplan_atom = mimir_to_wlplan_atom(atom)
            wlplan_atoms.append(wlplan_atom)
        x = feature_generator.embed(wlplan_atoms)
        h = x @ w.T
        h = round(h)
        return h

    state = mimir_problem.create_state(mimir_problem.initial)
    node = Node(state)
    h = get_h(state)
    best_h = h
    LOGGER.info(f"Initial {h=}")
    q = []
    start_time = time.time()
    expansions = 0
    seen = set()
    heappush(q, (h, node))
    seen.add(hash(state))
    while len(q):
        node = heappop(q)[1]
        state = node.state
        if is_goal(state):
            t = time.time() - start_time
            LOGGER.info(f"Found goal state! {expansions=}, {t=}")
            break
        expansions += 1
        for action in succ_generator.get_applicable_actions(state):
            succ = action.apply(state)
            if hash(succ) in seen:
                continue
            seen.add(hash(succ))
            h = get_h(succ)
            if h < best_h:
                best_h = h
                t = time.time() - start_time
                LOGGER.info(f"New best {h=}, {expansions=}, {t=}")
            heappush(q, (h, Node(succ)))
        if expansions >= EXPANSION_LIMIT:
            LOGGER.info(f"Expansions limit reached")
            assert False
