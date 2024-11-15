#!chezscheme
(import (chezscheme)
        (rpn)
        (rpn-iter))

(:v split dup (1 cdr) swap (1 car))
(:v 2dup over over)
(:v 3dup (3 -- 6) double)
(:v 4dup (4 -- 8) double)
(: trim drop swap drop)
(: 2nip swap trim)
(: hash over 100 * over + skim)
(:v putht rrot hash swap (3 put-hash-table!) SE)
(:v getht hash #f (3 get-hash-table))

(:v check-val-amount (2 =) 1 #f rif)

(: bounded-amount-check 2dup - 0 (2 <=)
    (rpnl (4 -- 1) 1000000 skim) 
    (rpnl dup (5 5 rrot) - runcoin 1 +)
    (7 rif))

(: bounded-coin-check rot 1 - dup 0 (2 <=)
    (rpnl (4 -- 1) 1000000 skim)
    (rpnl swap (4 4 rrot) swap runcoin)
    (7 rif))

(: compare-old 4dup bounded-amount-check (5 5 rrot)
                    bounded-coin-check (2 min))

(:v 2por swap dup
    (rpnl (3 -- 1) skim)
    (4 4 rot) 
    (6 rif))

(:v 4por swap dup
    (rpnlv (5 -- 1) skim)
    (4 4 rot) 
    (8 rif))

(:v coin-val-top (5 5 rot) rot swap)
(: runcoin  3dup getht coin-val-top 2dup (5 5 rot) (rpnl drop check-val-amount) 2por 
            double (rpnlv drop compare-old) 4por 2nip
            dup (5 5 rrot) putht)

(:v top-fn-args rot (4 4 rot))
(:v top-iter3-args (6 6 rot) (6 6 rot))
(:v preserve-length (1 length) dup (5 5 rrot))
(:v coins (2 -- 1) tuck (rpnlv (4 -- 3) 4dup runcoin SE drop)
                (rpnlv rrot split top-fn-args top-iter-args iter3 trim swap) curry curry
                swap dup preserve-length (0 make-hash-table) rot (4 4 rot) (4 4 rot) iter2
                drop rrot getht)

(scheme-start
        (rpnl '(1 5 7) 11 coins dis))