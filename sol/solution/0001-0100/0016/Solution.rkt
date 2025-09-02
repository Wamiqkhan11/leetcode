(define (three-sum-closest nums target)
  (let* ([sorted (sort nums <)]
         [n (length sorted)]
         [closest-sum (+ (list-ref sorted 0) (list-ref sorted 1) (list-ref sorted 2))])
    (let loop-main ([i 0] [best closest-sum])
      (if (>= i (- n 2))
          best
          (let loop ([left (+ i 1)] [right (- n 1)] [closest best])
            (if (>= left right)
                (loop-main (+ i 1) closest)
                (let* ([curr-sum (+ (list-ref sorted i) (list-ref sorted left) (list-ref sorted right))]
                       [new-closest (if (< (abs (- curr-sum target)) (abs (- closest target)))
                                        curr-sum
                                        closest)])
                  (cond
                    [(= curr-sum target) curr-sum]
                    [(< curr-sum target) (loop (+ left 1) right new-closest)]
                    [else (loop left (- right 1) new-closest)]))))))))