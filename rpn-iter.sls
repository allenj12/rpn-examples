#!chezscheme
(library (rpn-iter)
    (export iter1
            iter2
            iter3
            iter4
            fold1
            fold2
            fold3
            fold4
            find1
            find2
            find3
            find4)
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
            dup (9 9 rrot) (9 4 ev))

(:v split dup (1 car) swap (1 cdr))

(: fold1 dup (1 null?)
            (rpnl (3 -- 1) drop drop)
            (rpnl split (4 4 rrot) swap dup (4 4 rrot) (3 ev)
                        swap rot fold1)
            (6 rif))

(:v fold2 dup (1 null?)
            (rpnlv (4 -- 2) drop drop)
            (rpnlv split (5 5 rrot) swap dup (5 5 rrot) (4 2 ev)
                        rot (4 4 rot) fold2)
            (7 2 rif))
            
(:v fold3 dup (1 null?)
            (rpnlv (5 -- 3) drop drop)
            (rpnlv split (6 6 rrot) swap dup (6 6 rrot) (5 3 ev)
                        (4 4 rot) (5 5 rot) fold3)
            (8 3 rif))
            
(:v fold4 dup (1 null?)
            (rpnlv (6 -- 4) drop drop)
            (rpnlv split (7 7 rrot) swap dup (7 7 rrot) (6 4 ev)
                        (5 5 rot) (6 6 rot) fold4)
            (9 4 rif))

(: find1 (3 1 (lambda (arg fn l)
                  (call/cc
                    (lambda (c)
                      (if (null? l)
                          arg
                          (let ([ret (fn c arg (car l))])
                            (find1 ret fn (cdr l)))))))))
  
(:v find2 (4 2 (lambda (arg1 arg2 fn l)
                  (call/cc
                    (lambda (c)
                      (if (null? l)
                          (values arg1 arg2)
                          (let-values ([(a b) (fn c arg1 arg2 (car l))])
                            (find2 a b fn (cdr l)))))))))
                            
(:v find3 (5 3 (lambda (arg1 arg2 arg3 fn l)
                  (call/cc
                    (lambda (c)
                      (if (null? l)
                          (values arg1 arg2 arg3)
                          (let-values ([(a b d) (fn c arg1 arg2 arg3 (car l))])
                            (find3 a b d fn (cdr l)))))))))
                            
(:v find4 (6 4 (lambda (arg1 arg2 arg3 arg4 fn l)
                  (call/cc
                    (lambda (c)
                      (if (null? l)
                          (values arg1 arg2 arg3 arg4)
                          (let-values ([(a b d e) (fn c arg1 arg2 arg3 arg4 (car l))])
                            (find4 a b d e fn (cdr l))))))))))
