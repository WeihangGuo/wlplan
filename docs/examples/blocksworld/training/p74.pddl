;; blocks=22, out_folder=training/easy, instance_id=74, seed=101

(define (problem blocksworld-74)
 (:domain blocksworld)
 (:requirements :typing)
 (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 - object)
 (:init 
    (arm-empty)
    (clear b11)
    (on b11 b16)
    (on b16 b13)
    (on b13 b1)
    (on b1 b20)
    (on b20 b9)
    (on b9 b3)
    (on b3 b17)
    (on b17 b22)
    (on b22 b6)
    (on b6 b14)
    (on b14 b8)
    (on b8 b5)
    (on b5 b4)
    (on b4 b10)
    (on b10 b21)
    (on b21 b2)
    (on b2 b15)
    (on b15 b12)
    (on b12 b18)
    (on b18 b7)
    (on b7 b19)
    (on-table b19))
 (:goal  (and 
    (clear b9)
    (on b9 b11)
    (on b11 b18)
    (on b18 b8)
    (on b8 b2)
    (on b2 b17)
    (on b17 b10)
    (on b10 b3)
    (on b3 b5)
    (on b5 b21)
    (on b21 b19)
    (on-table b19)
    (clear b16)
    (on b16 b6)
    (on b6 b20)
    (on-table b20)
    (clear b22)
    (on b22 b12)
    (on b12 b4)
    (on b4 b7)
    (on b7 b15)
    (on b15 b1)
    (on b1 b14)
    (on b14 b13)
    (on-table b13))))
