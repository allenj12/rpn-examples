#!chezscheme
(library (rpn-iter)
    (export iter1
            iter2
            iter3
            iter4)
    (import (rpn)
            (chezscheme))
  
(:v 2dup (2 -- 4) double)

(: iter1 1 (rpnl 2dup (2 <)
                (rpnl (5 -- 1) drop drop drop swap drop)
                (rpnl (5 -- 1) dup 1 (2 fx+) (5 5 rot) rot (5 5 rot) dup (6 6 rrot) (3 ev)
                               (4 4 rrot) (5 5 rot) dup (6 6 rrot) (6 ev))
                (8 rif))
               dup (6 6 rrot) (6 ev))

(:v iter2 1 (rpnlv 2dup (2 <)
            (rpnlv (6 -- 2) drop drop drop rot drop)
            (rpnlv (6 -- 2) dup 1 (2 fx+) (6 6 rot) (6 6 rot) (4 4 rot) (6 6 rot) dup (7 7 rrot) (4 2 ev)
                            (5 5 rrot) (5 5 rrot) (6 6 rot) dup (7 7 rrot) (7 2 ev))
            (9 2 rif))
            dup (7 7 rrot) (7 2 ev))

(:v iter3 1 (rpnlv 2dup (2 <)
            (rpnlv (7 -- 3) drop drop drop (4 4 rot) drop)
            (rpnlv (7 -- 3) dup 1 (2 fx+) (7 7 rot) (7 7 rot) (7 7 rot) (5 5 rot) (7 7 rot) dup (8 8 rrot) (5 3 ev)
                            (6 6 rot) (6 6 rot) (6 6 rot) (7 7 rot) dup (8 8 rrot) (8 3 ev))
            (10 3 rif))
            dup (8 8 rrot) (8 3 ev))

(:v iter4 1 (rpnlv 2dup (2 <)
            (rpnlv (8 -- 4) drop drop drop (5 5 rot) drop)
            (rpnlv (8 -- 4) dup 1 (2 fx+) (8 8 rot) (8 8 rot) (8 8 rot) (8 8 rot) (6 6 rot) (8 8 rot) dup (9 9 rrot) (6 4 ev)
                            (7 7 rot) (7 7 rot) (7 7 rot) (8 8 rot) dup (9 9 rrot) (9 4 ev))
            (11 4 rif))
            dup (9 9 rrot) (9 4 ev)))