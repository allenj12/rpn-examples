#!chezscheme

(import (chezscheme)
        (rpn))

(: left  (1 car))
(: right (1 caddr))
(:v children dup right swap left swap)

(: depth dup (1 null?)
    (rpnl drop 0)
    (rpnl children depth 1 + swap depth 1 + (2 max))
    (4 rif))

(: tree '((() 9 ()) 3 ((() 15 ()) 20 (() 7 ()))))

(scheme-start
 (rpnlv tree depth dis))
