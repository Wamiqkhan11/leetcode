(define (search-insert nums target)
  (let loop ((left 0) (right (- (length nums) 1)))
    (if (> left right)
        left
        (let* ((mid (quotient (+ left right) 2))
               (val (list-ref nums mid)))
          (cond [(= val target) mid]
                [(< val target) (loop (+ mid 1) right)]
                [else (loop left (- mid 1))])))))