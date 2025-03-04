;; base case
;;
(define (problem blocksworld-08)
 (:domain blocksworld)
 (:requirements :typing)
 (:objects  b1 b2 b3 - object)
 (:init 
    (arm-empty)
    (clear b1)
    (on b1 b2)
    (on b2 b3)
    (on-table b3)
)
 (:goal (and
    (clear b3)
    (on b3 b2)
    (on b2 b1)
    (on-table b1)
)))
