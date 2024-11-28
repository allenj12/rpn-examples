#!chezscheme
(import (chezscheme)
        (rpn)
        (rpn-extended-base)
        (rpn-iter))

(: proc-or-match swap dup (1 procedure?)
    (rpnl (2 -- 1) #f skim)
    (rpnl (2 string-ci=?))
    2rif)

(: proc-or-pass 4rrot proc-or-match rot rot rif)
(: +? dup "+" (rpnl +) proc-or-pass)
(: -? dup "-" (rpnl -) proc-or-pass)
(: *? dup "*" (rpnl *) proc-or-pass)
(: /? dup "/" fx/ proc-or-pass)
(: num? dup dup (1 procedure?) swap rot (1 string->number) rif)
(: op? +? -? *? /?)
(: parse op? num?)

(: runrpn '() (rpnl parse dup (1 procedure?)
                (rpnl swap rsplit rsplit rrot swap 4rot (3 ev) swap (2 cons))
                (rpnl swap (2 cons))
                2rif)
               rot fold1 (1 car))

(scheme-start
 (rpnlv '("1" "2" "*" "20" "-") runrpn))
