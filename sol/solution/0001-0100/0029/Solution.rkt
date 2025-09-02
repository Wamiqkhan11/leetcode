(define (divide dividend divisor)
  (define INT_MAX (- (expt 2 31) 1))
  (define INT_MIN (- (expt 2 31)))
  (cond
    [(and (= dividend INT_MIN) (= divisor -1)) INT_MAX]
    [(and (= dividend INT_MIN) (= divisor 1)) INT_MIN]
    [else
     (let loop ((a (abs dividend)) (b (abs divisor)) (res 0))
       (if (< a b)
           (if (xor (> dividend 0) (> divisor 0)) (- res) res)
           (let loop2 ((temp b) (multiple 1))
             (if (<= (* 2 temp) a)
                 (loop2 (* 2 temp) (* 2 multiple))
                 (loop (- a temp) b (+ res multiple))))))]))