#!chezscheme
(import (rpn)
        (rpn-iter)
        (chezscheme))

(:v 2dup over over)
(:v split dup (1 cdr) swap (1 car))
(:v open? #\{ (2 eqv?) over #\[ (2 eqv?) (2 or))
(:v pop-stack split rot swap)
(: match? over #\} (2 eqv?) over #\{ (2 eqv?) (2 and) rrot
          over #\] (2 eqv?) over #\[ (2 eqv?) (2 and) 
           (4 4 rot) (2 or) skim)
(: not-null? (1 null?) (1 not))

(:v 2pand
    (rpnlv (2 -- 1) #f skim)
    (5 rif))

(: balanced? (1 string->list) '() 
    (rpnlv dup open?
        (rpnlv (3 -- 1) swap (2 cons) skim)
        (rpnlv (3 -- 1) over dup not-null? (rpnl (1 car) match?) 2pand
            (rpnl (2 -- 1) (1 cdr) skim)
            (rpnl (2 -- 1) drop #f swap (2 ev))
            (5 rif))
        (6 rif))
    rot find1 (1 null?))

(scheme-start
 (rpnlv "{{{{}}}{{}}}" balanced? dis))