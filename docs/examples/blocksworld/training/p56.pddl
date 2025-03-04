;; blocks=17, out_folder=training/easy, instance_id=56, seed=83

(define (problem blocksworld-56)
 (:domain blocksworld)
 (:requirements :typing)
 (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 - object)
 (:init 
    (arm-empty)
    (clear b13)
    (on b13 b17)
    (on b17 b5)
    (on b5 b9)
    (on b9 b6)
    (on b6 b11)
    (on b11 b8)
    (on b8 b14)
    (on-table b14)
    (clear b10)
    (on-table b10)
    (clear b4)
    (on-table b4)
    (clear b12)
    (on b12 b1)
    (on b1 b7)
    (on b7 b3)
    (on b3 b2)
    (on b2 b15)
    (on b15 b16)
    (on-table b16))
 (:goal  (and 
    (clear b14)
    (on-table b14)
    (clear b1)
    (on b1 b9)
    (on b9 b2)
    (on b2 b17)
    (on b17 b5)
    (on b5 b12)
    (on-table b12)
    (clear b7)
    (on b7 b3)
    (on b3 b4)
    (on b4 b15)
    (on b15 b6)
    (on b6 b10)
    (on b10 b13)
    (on b13 b8)
    (on b8 b16)
    (on b16 b11)
    (on-table b11))))
