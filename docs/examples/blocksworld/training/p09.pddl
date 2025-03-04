(define (problem blocksworld-09)
 (:domain blocksworld)
 (:requirements :typing)
 (:objects  b1 b2 b3 b4 - object)
 (:init 
    (arm-empty)
    (clear b1)
    (on b1 b2)
    (on-table b2)
    (clear b3)
    (on b3 b4)
    (on-table b4)
)
 (:goal (and
    (clear b3)
    (on b3 b2)
    (on-table b2)
    (clear b1)
    (on b1 b4)
    (on-table b4)
)))