#!chezscheme
(import (chezscheme)
        (rpn))

(:v split dup (1 cdr) swap (1 car))

(: proc-or-match swap dup (1 procedure?)
    (rpnl swap swap #f skim)
    (rpnl (2 string-ci=?))
    (5 rif))

(: proc-or-pass (4 4 rrot) proc-or-match rot rot rif)
(: +? dup "+" (rpnl +) proc-or-pass)
(: -? dup "-" (rpnl -) proc-or-pass)
(: *? dup "*" (rpnl *) proc-or-pass)
(: /? dup "/" fx/ proc-or-pass)
(: num? dup dup (1 procedure?) swap rot (1 string->number) rif)
(: op? +? -? *? /?)
(: parse op? num?)


(: recur rot dup (4 4 rrot) (4 ev))
(:v grab-args rot split swap split rot rot)
(:v grab-fn (4 4 rot) swap (4 4 rrot))
(: runrpn '() (rpnl swap dup (1 null?)
                    (rpnl (3 -- 1) swap split skim)
                    (rpnl split parse dup (1 procedure?)
                        (rpnl grab-args grab-fn (3 ev) swap (2 cons) recur)
                        (rpnl rot (2 cons) recur)
                        (7 rif))
                    (6 rif))
               dup (4 4 rrot)
               (4 ev))

(scheme-start
(lambda ()
        (display (runrpn '("1" "2" "*" "20" "-")))
        (newline)))
