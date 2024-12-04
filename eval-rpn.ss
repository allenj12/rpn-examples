#!chezscheme
(import (chezscheme)
        (rpn)
        (rpn-extended-base)
        (rpn-iter))

(: proc-or-match swap dup {1 procedure?}
    ({2 1} #f skim)
    ({2 string-ci=?})
    2rif)

(: proc-or-pass (proc-or-match) 2u1 rot rif)
(: +? dup "+" (+) proc-or-pass)
(: -? dup "-" (-) proc-or-pass)
(: *? dup "*" (*) proc-or-pass)
(: /? dup "/" fx/ proc-or-pass)
(: num? ({1 procedure?}) 1k1 dup {1 string->number} rif)
(: op? +? -? *? /?)
(: parse op? num?)

(: runrpn '() (parse dup {1 procedure?}
                ((split (split) 1u2) 1u3 {3 ev} swap {2 cons})
                (swap {2 cons})
                2rif)
               rot fold1 {1 car})

(scheme-start
 (rpnlv '("1" "2" "*" "20" "-") runrpn))
