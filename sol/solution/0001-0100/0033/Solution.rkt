#lang racket
(define (search nums target)
  (define (helper l r)
    (if (> l r) -1
        (let* ([mid (quotient (+ l r) 2)]
               [val (list-ref nums mid)])
          (cond [(= val target) mid]
                [(<= (list-ref nums l) val)
                 (if (and (<= (list-ref nums l) target) (< target val))
                     (helper l (- mid 1))
                     (helper (+ mid 1) r))]
                [else
                 (if (and (< val target) (<= target (list-ref nums r)))
                     (helper (+ mid 1) r)
                     (helper l (- mid 1)))]))))
  (helper 0 (- (length nums) 1)))