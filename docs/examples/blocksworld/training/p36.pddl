;; blocks=11, out_folder=training/easy, instance_id=36, seed=63

(define (problem blocksworld-36)
 (:domain blocksworld)
 (:requirements :typing)
 (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 - object)
 (:init 
    (arm-empty)
    (clear b2)
    (on b2 b10)
    (on b10 b3)
    (on b3 b7)
    (on b7 b1)
    (on b1 b6)
    (on b6 b4)
    (on-table b4)
    (clear b9)
    (on b9 b5)
    (on b5 b11)
    (on b11 b8)
    (on-table b8))
 (:goal  (and 
    (clear b8)
    (on b8 b11)
    (on b11 b3)
    (on b3 b7)
    (on b7 b2)
    (on b2 b6)
    (on-table b6)
    (clear b10)
    (on-table b10)
    (clear b9)
    (on b9 b1)
    (on b1 b5)
    (on b5 b4)
    (on-table b4))))
