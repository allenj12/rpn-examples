#!chezscheme

(import (chezscheme)
        (rpn))

(:v 2dup over over)
(:v split dup (1 cdr) swap (1 car))
(:v open? dup #\{ (2 eqv?) over #\[ (2 eqv?) (2 or))
(:v pop-stack split rot swap)
(: match? over #\} (2 eqv?) over #\{ (2 eqv?) (2 and) rrot
           over #\] (2 eqv?) over #\[ (2 eqv?) (2 and) 
           (4 4 rot) (2 or) skim)
(: not-null? (1 null?) (1 not))

(:v 2pand
    (rpnlv (2 -- 1) #f skim)
    (5 rif))

(:v balanced? dup (1 null?)
    (rpnlv drop (1 length) 0 (2 =))
    (rpnlv pop-stack open?
        (rpnl swap (2 cons) swap balanced?)
        (rpnl over dup not-null? (rpnl (1 car) match?) 2pand
            (rpnl (1 cdr) swap balanced?)
            (rpnl (2 -- 1) #f skim)
            (5 rif))
        (6 rif))
    (5 rif))

(scheme-start
 (rpnlv '() "{{{{}}}{{}}}" (1 string->list) balanced? dis))