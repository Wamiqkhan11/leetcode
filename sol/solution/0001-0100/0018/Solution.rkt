(define/contract (four-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof (listof exact-integer?)))
  (let ([sorted-nums (sort nums <)]
        [n (length nums)])
    (if (< n 4)
        '()
        (let loop-i ([i 0] [result '()])
          (cond
            [(>= i (- n 3)) result]
            [(and (> i 0) (= (list-ref sorted-nums i) (list-ref sorted-nums (- i 1))))
             (loop-i (+ i 1) result)]
            [else
             (let loop-j ([j (+ i 1)] [current-result result])
               (cond
                 [(>= j (- n 2)) (loop-i (+ i 1) current-result)]
                 [(and (> j (+ i 1)) (= (list-ref sorted-nums j) (list-ref sorted-nums (- j 1))))
                  (loop-j (+ j 1) current-result)]
                 [else
                  (let two-pointer ([left (+ j 1)] [right (- n 1)] [quad-result current-result])
                    (cond
                      [(>= left right) (loop-j (+ j 1) quad-result)]
                      [else
                       (let ([sum (+ (list-ref sorted-nums i)
                                    (list-ref sorted-nums j)
                                    (list-ref sorted-nums left)
                                    (list-ref sorted-nums right))])
                         (cond
                           [(= sum target)
                            (let ([quadruplet (list (list-ref sorted-nums i)
                                                   (list-ref sorted-nums j)
                                                   (list-ref sorted-nums left)
                                                   (list-ref sorted-nums right))])
                              (let skip-left ([new-left (+ left 1)])
                                (if (and (< new-left right)
                                        (= (list-ref sorted-nums new-left)
                                           (list-ref sorted-nums left)))
                                    (skip-left (+ new-left 1))
                                    (let skip-right ([new-right (- right 1)])
                                      (if (and (> new-right left)
                                              (= (list-ref sorted-nums new-right)
                                                 (list-ref sorted-nums right)))
                                          (skip-right (- new-right 1))
                                          (two-pointer new-left new-right
                                                      (cons quadruplet quad-result)))))))]
                           [(< sum target)
                            (two-pointer (+ left 1) right quad-result)]
                           [else
                            (two-pointer left (- right 1) quad-result)]))]))]))])))))
