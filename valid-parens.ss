#!chezscheme
(import (rpn rpn)
        (rpn iter)
        (rpn extended-base)
        (chezscheme))

(: open? (#\{ {2 eqv?}) 1k1 #\[ {2 eqv?} {2 or})
(: match? 2dup #\{ {2 eqv?} (#\} {2 eqv?}) 1u1 {2 and}
              (#\[ {2 eqv?} (#\] {2 eqv?}) 1u1 {2 and}) 2u1 {2 or})
(: not-null? {1 null?} {1 not})

(: balanced? {1 string->list} '() 
    (dup open?
        ({3 1} swap {2 cons} skim)
        (over dup not-null? ({1 car} match?) 2pand
            ({2 1} {1 cdr} skim)
            (drop #f swap {2 ev})
            2rif)
        3rif)
    rot find1 {1 null?})

(scheme-start
 (rpnlv "{{{{}}}{{}}}" balanced? dis))
