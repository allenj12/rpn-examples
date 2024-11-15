#!chezscheme
(import (chezscheme)
        (rpn))

(:v putht (3 -- 1) double (3 put-hash-table!) SE drop drop) ;maintain just hashmap
(:v getht over over #f (3 get-hash-table))
(:v split dup (1 cdr) swap (1 car))
(:v n? dup (1 null?))
(:v hord split rot swap)
(:v pord rot drop)
(:v swap3 (4 4 rot) (4 4 rot) swap (4 4 rrot) (4 4 rrot))

(:v map0 dup
    (rpnlv (2 -- 2))
    (rpnlv swap drop #f)
    (5 2 rif))

(:v avail? dup
    (rpnlv dup 0 (2 >) over (2 and) map0)
    (rpnlv dup)
    (4 2 rif))

(:v p-results rot p rot p rot)
(: pairs n?
    (rpnl drop drop #t)
    (rpnl hord dup 10 swap - rot swap getht avail?
        (rpnl swap3 1 - p-results pord putht swap pairs)
        (rpnl drop drop swap 1 putht swap pairs)
        (8 rif))
    (5 rif))

(scheme-start
 (rpnlv (0 make-hash-table) '(1 0 3 -1 11 10 1 7 7 9 9 1) pairs))