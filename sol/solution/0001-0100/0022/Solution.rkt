(define/contract (generate-parenthesis n)
  (-> exact-integer? (listof string?))
  (define (loop left right s)
    (cond
      [(and (= left 0) (= right 0)) (list s)]
      [else
       (append
        (if (> left 0)
            (loop (- left 1) right (string-append s "("))
            '())
        (if (> right left)
            (loop left (- right 1) (string-append s ")"))
            '()))]))
  (loop n n "")
)