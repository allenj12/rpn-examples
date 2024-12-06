#!chezscheme
(import (chezscheme)
        (rpn)
        (rpn-extended-base)
        (rpn-iter))

(: l {1 car})
(: r {1 cadr})
(: new-q '(()()))
(: oq swap (l) 1k1 ({2 cons}) 2u1 {1 cdr} {2 cons})
(: uq (l) 1k1 r dup {1 null?}
            ((swap {2 cons}) rot fold1 split ('() swap {2 list}) 1u1)
            (split ({2 list}) 2u1)
            {5 2 rif})

(scheme-start
        (rpnlv new-q 1 oq 2 oq 3 oq 4 oq uq dis 5 oq uq dis uq dis uq dis uq dis))
