; Definition for singly-linked list:
#|
; val : integer?
; next : (or/c list-node? #f)
(struct list-node
    (val next) #:mutable #:transparent)
; constructor
(define (make-list-node [val 0])
    (list-node val #f))
|#
(define/contract (merge-k-lists lists)
    (-> (listof (or/c list-node? #f)) (or/c list-node? #f))
    (define (merge-two l1 l2)
        (cond
            [(not l1) l2]
            [(not l2) l1]
            [(<= (list-node-val l1) (list-node-val l2))
             (set-list-node-next! l1 (merge-two (list-node-next l1) l2))
             l1]
            [else
             (set-list-node-next! l2 (merge-two l1 (list-node-next l2)))
             l2]))
    (define (merge-helper lsts)
        (cond
            [(empty? lsts) #f]
            [(= (length lsts) 1) (first lsts)]
            [else
             (define mid (quotient (length lsts) 2))
             (merge-two
                (merge-helper (take lsts mid))
                (merge-helper (drop lsts mid)))]))
    (merge-helper lists))