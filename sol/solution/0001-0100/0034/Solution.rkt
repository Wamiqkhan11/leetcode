(define (search-range nums target)
  (define (findBound first?)
    (define (loop l r ans)
      (if (> l r) ans
          (let* ([mid (quotient (+ l r) 2)]
                 [val (list-ref nums mid)])
            (cond [(= val target)
                   (loop (if first? l (+ mid 1))
                         (if first? (- mid 1) r)
                         mid)]
                  [(< val target) (loop (+ mid 1) r ans)]
                  [else (loop l (- mid 1) ans)]))))
    (loop 0 (sub1 (length nums)) -1))
  (list (findBound #t) (findBound #f)))