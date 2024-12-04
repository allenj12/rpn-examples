#!chezscheme
(import (chezscheme)
        (rpn-extended-base)
        (rpn-iter)
        (rpn))

(: putht dup3 {3 put-hash-table!} SE) ;maintain just hashmap
(: getht 0 {3 get-hash-table})

(: gen-pair '() {2 cons} {2 cons})
(: pair 10 swap -)
(: pairs '() {0 make-hash-table}
    (tuck pair 2dup getht dup 0 {2 <=}
        ({5 2} drop drop swap 2dup getht 1 + putht)
        (over 4rrot 1 - putht rrot gen-pair rot {2 cons} swap)
        {8 2 rif})
    4rot fold2 drop)

(scheme-start
 (rpnlv '(1 0 3 -1 11 10 1 7 7 9 9 1) pairs dis))
