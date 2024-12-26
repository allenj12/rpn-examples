#!chezscheme
(import (chezscheme)
        (rpn rpn)
        (rpn extended-base)
        (rpn iter))

(: hash over 100 * over + skim)
(: putht rrot hash swap {3 put-hash-table!} SE)
(: getht hash #f {3 get-hash-table})

(: check-val-amount {2 =} 1 #f rif)

(: bounded-amount-check 2dup - 0 {2 <=}
    ({4 1} 1000000 skim) 
    (dup {5 5 rrot} - runcoin 1 +)
    {7 rif})

(: bounded-coin-check rot 1 - dup 0 {2 <=}
    ({4 1} 1000000 skim)
    (swap {4 4 rrot} swap runcoin)
    {7 rif})

(: compare-old 4dup bounded-amount-check {5 5 rrot}
                    bounded-coin-check {2 min})

;not great in implementation, but havent had a chance to update since major language changes
(: coin-val-top {5 5 rot} rot swap)
(: runcoin  3dup getht coin-val-top 2dup {5 5 rot} (check-val-amount) 2por
            double (compare-old) 4por nip nip
            dup {5 5 rrot} putht)

(: top-fn-args rot {4 4 rot})
(: top-iter3-args {6 6 rot} {6 6 rot})
(: preserve-length {1 length} dup {5 5 rrot})
(: coins {2 1} tuck ({4 3} 4dup runcoin SE drop)
                (rrot split top-fn-args top-iter3-args iter3 trim swap) curry curry
                swap dup preserve-length {0 make-hash-table} rot {4 4 rot} {4 4 rot} iter2
                drop rrot getht)

(scheme-start
        (rpnlv '(1 5 7) 11 coins dis))
