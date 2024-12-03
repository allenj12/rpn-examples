#!chezscheme
(library (rpn-extended-base)
  (export split
          rsplit
          2dup
          3dup
          4dup
          dup2
          dup3
          dup4
          4rot
          5rot
          6rot
          7rot
          8rot
          9rot
          4rrot
          5rrot
          6rrot
          7rrot
          8rrot
          9rrot
          nip
          2nip
          nip3
          nip4
          nip5
          trim
          1rif
          2rif
          3rif
          4rif
          5rif
          6rif
          1pand
          2pand
          3pand
          4pand
          1por
          2por
          3por
          4por)
  (import (chezscheme)
          (rpn))

(:v split dup (1 cdr) swap (1 car))
(:v rsplit dup (1 car) swap (1 cdr))

(:v 2dup over over)
(:v 3dup (3 -- 6) double)
(:v 4dup (4 -- 8) double)

(:v 4rot (4 4 rot))
(:v 5rot (5 5 rot))
(:v 6rot (6 6 rot))
(:v 7rot (7 7 rot))
(:v 8rot (8 8 rot))
(:v 9rot (9 9 rot))

(:v 4rrot (4 4 rrot))
(:v 5rrot (5 5 rrot))
(:v 6rrot (6 6 rrot))
(:v 7rrot (7 7 rrot))
(:v 8rrot (8 8 rrot))
(:v 9rrot (9 9 rrot))

(:v dup2 over swap)
(:v dup3 rot dup 4rrot 4rrot)
(:v dup4 4rot dup 5rrot 5rrot)

(: nip swap drop)
(:v 2nip rot drop rot drop)
(:v nip3 rot drop)
(:v nip4 (4 4 rot) drop)
(:v nip5 (5 5 rot) drop)

(: trim drop swap drop)

(: 1rif (4 rif))
(: 2rif (5 rif))
(: 3rif (6 rif))
(: 4rif (7 rif))
(: 5rif (8 rif))
(: 6rif (9 rif))

(:v 1pand
    (rpnlv (1 -- 1) drop #f)
    1rif)

(:v 2pand
    (rpnlv (2 -- 1) #f skim)
    2rif)

(:v 3pand
    (rpnlv (3 -- 1) #f skim)
    3rif)
    
(:v 4pand
    (rpnlv (4 -- 1) #f skim)
    4rif)

(:v 1por swap dup
    (rpnl (2 -- 1) swap skim) curry
    rot
    1rif)

(:v 2por swap dup
    (rpnl (3 -- 1) rot skim) curry
    rot
    2rif)
    
(:v 3por swap dup
    (rpnl (4 -- 1) 4rot skim) curry
    rot
    3rif)

(:v 4por swap dup
    (rpnl (5 -- 1) 5rot skim) curry
    rot
    4rif))
