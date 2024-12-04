#!chezscheme
(import (chezscheme)
        (rpn)
        (rpn-extended-base))

(: left  {1 car})
(: right {1 caddr})
(: children (left) 1k1 right)

(: depth dup {1 null?}
    (drop 0)
    (children depth 1 + swap depth 1 + {2 max})
    1rif)

(: tree '((() 9 ()) 3 ((() 15 ()) 20 (() 7 ()))))

(scheme-start
 (rpnv tree depth dis))
