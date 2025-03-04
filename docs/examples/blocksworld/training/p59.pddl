;; blocks=17, out_folder=training/easy, instance_id=59, seed=86

(define (problem blocksworld-59)
 (:domain blocksworld)
 (:requirements :typing)
 (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 - object)
 (:init 
    (arm-empty)
    (clear b3)
    (on b3 b6)
    (on b6 b8)
    (on b8 b4)
    (on b4 b14)
    (on-table b14)
    (clear b10)
    (on b10 b16)
    (on b16 b15)
    (on b15 b7)
    (on b7 b5)
    (on b5 b9)
    (on b9 b2)
    (on b2 b13)
    (on b13 b17)
    (on b17 b12)
    (on b12 b11)
    (on b11 b1)
    (on-table b1))
 (:goal  (and 
    (clear b9)
    (on b9 b10)
    (on b10 b2)
    (on b2 b6)
    (on b6 b5)
    (on b5 b8)
    (on b8 b3)
    (on b3 b16)
    (on b16 b1)
    (on b1 b11)
    (on b11 b4)
    (on b4 b17)
    (on-table b17)
    (clear b15)
    (on b15 b13)
    (on-table b13)
    (clear b7)
    (on b7 b14)
    (on b14 b12)
    (on-table b12))))
