#!chezscheme

(import (chezscheme)
        (rpn))

(:v split dup (1 cdr) swap (1 car))
(:v prep split rot swap) ;; to-go so-far new-pair
(:v 2dup over over)
(:v n? dup (1 null?))
(:v extract dup (1 cadr) swap (1 car))
(:v start (1 car))
(:v end (1 cadr))
(:v between tuck (2 <=) rrot (2 >=) (2 and))
(:v prep-compare 2dup extract rot (1 car))
(:v extract-prior over (1 car) extract)
(:v dup3 rot dup (4 4 rrot))
(:v overlap? prep-compare start between rrot 
             prep-compare end between (4 4 rot) (2 or) rrot
             extract-prior dup3 start between (4 4 rot) (2 or) rrot
             extract-prior dup3 end between (4 4 rot) (2 or))

(:v order-pairs 2dup start swap start swap (2 >)
    (rpnlv (2 -- 2))
    (rpnlv swap)
    (5 2 rif))

(:v minstart start swap start (2 min))
(:v maxend end swap end (2 max))
(:v merge 2dup minstart dup3 dup3 maxend (2 list) skim)
(:v insert-interval n? 
    (rpnl swap skim)
    (rpnlv prep overlap?
        (rpnl swap split rot merge swap (2 cons) swap insert-interval)
        (rpnl swap split rot order-pairs rot (2 cons) (2 cons) swap insert-interval)
        (6 rif))
    (5 rif))

(scheme-start
 (rpnlv '((4 8)) '((1 2) (3 5) (6 7) (8 10) (12 16)) insert-interval dis))
