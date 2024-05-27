;; blocks=26, out_folder=training/easy, instance_id=89, seed=116

(define (problem blocksworld-89)
 (:domain blocksworld)
 (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 - object)
 (:init 
    (arm-empty)
    (clear b9)
    (on b9 b6)
    (on b6 b22)
    (on b22 b25)
    (on b25 b12)
    (on b12 b15)
    (on b15 b3)
    (on b3 b11)
    (on b11 b17)
    (on b17 b2)
    (on b2 b13)
    (on b13 b14)
    (on b14 b23)
    (on b23 b7)
    (on b7 b19)
    (on b19 b8)
    (on b8 b26)
    (on b26 b16)
    (on b16 b5)
    (on b5 b4)
    (on-table b4)
    (clear b21)
    (on b21 b1)
    (on-table b1)
    (clear b10)
    (on b10 b18)
    (on b18 b20)
    (on b20 b24)
    (on-table b24))
 (:goal  (and 
    (clear b20)
    (on b20 b2)
    (on-table b2)
    (clear b23)
    (on b23 b6)
    (on-table b6)
    (clear b26)
    (on b26 b18)
    (on b18 b25)
    (on b25 b9)
    (on b9 b15)
    (on-table b15)
    (clear b22)
    (on b22 b5)
    (on b5 b17)
    (on b17 b13)
    (on b13 b3)
    (on b3 b7)
    (on b7 b16)
    (on b16 b12)
    (on b12 b8)
    (on b8 b10)
    (on b10 b11)
    (on b11 b14)
    (on b14 b1)
    (on b1 b4)
    (on b4 b21)
    (on b21 b19)
    (on b19 b24)
    (on-table b24))))
