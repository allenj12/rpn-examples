#!chezscheme
(import (chezscheme)
        (rpn rpn)
        (rpn extended-base)
        (rpn iter))

(: start {1 car})
(: end {1 cadr})
(: extract (end) 1k1 start)
(: between tuck {2 <=} ({2 >=}) 2u1 {2 and})
(: prep-compare 2dup extract rot {1 car})
(: extract-prior over {1 car} extract)
(: over3 rot dup 4rrot)

(: overlap? prep-compare start between
            (prep-compare end between) 2u3 {2 or}
            (extract-prior over3 start between) 2u3 {2 or}
            (extract-prior over3 end between) 2u3 {2 or})

(: order-pairs 2dup (start) 1u1 start {2 >}
    ({2 2})
    (swap)
    {5 2 rif})

(: minstart start swap start {2 min})
(: maxend end swap end {2 max})
(: merg 2dup maxend (minstart) 2u1 {2 list})
(: insert-interval swap '() {2 cons}
    (overlap?
        ((split) 1u2 merg swap {2 cons})
        ((split) 1u2 order-pairs rot {2 cons} {2 cons})
        2rif)
    rot fold1)

(scheme-start
 (rpnlv '(4 8) '((1 2) (3 5) (6 7) (8 10) (12 16)) insert-interval dis))
