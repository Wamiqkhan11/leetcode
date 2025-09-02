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
(define (swap-pairs head)
  (cond
    [(or (not head) (not (list-node-next head))) head] 
    [else
     (let* ([next-node (list-node-next head)]
            [next-next-node (list-node-next next-node)])
       (set-list-node-next! head (swap-pairs next-next-node))
       (set-list-node-next! next-node head)
       next-node)]))