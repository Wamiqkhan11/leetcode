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
(define/contract (remove-nth-from-end head n)
    (-> (or/c list-node? #f) exact-integer? (or/c list-node? #f))
    (define dummy (list-node 0 head))
    (define fast dummy)
    (define slow dummy)
    (for ([i (in-range (+ n 1))])
        (set! fast (list-node-next fast)))
    (let loop ()
        (when fast
            (set! fast (list-node-next fast))
            (set! slow (list-node-next slow))
            (loop)))
    (when (list-node-next slow)
        (set-list-node-next! slow (list-node-next (list-node-next slow))))
    (list-node-next dummy))