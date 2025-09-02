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
(define (reverse-k-group head k)
  (define (has-k? node k)
    (let loop ([n node] [i 0])
      (cond [(= i k) #t]
            [(not n) #f]
            [else (loop (list-node-next n) (add1 i))])))
  (define (reverse-first-k node k)
    (let loop ([curr node] [prev #f] [i 0])
      (if (= i k)
          (values prev curr)
          (let ([next (list-node-next curr)])
            (set-list-node-next! curr prev)
            (loop next curr (add1 i))))))
  (define (process curr new-head last-tail)
    (if (not curr)
        new-head
        (if (has-k? curr k)
            (let-values ([(rev-head rest) (reverse-first-k curr k)])
              (when last-tail (set-list-node-next! last-tail rev-head))
              (process rest (or new-head rev-head) curr))
            (begin
              (when last-tail (set-list-node-next! last-tail curr))
              (if new-head new-head curr)))))
  (process head #f #f))