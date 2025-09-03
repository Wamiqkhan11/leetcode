#lang racket
(define (longest-valid-parentheses s)
  (define n (string-length s))
  (define (pass idx step)
    (let loop ([i idx] [left 0] [right 0] [best 0])
      (cond
        [(or (< i 0) (>= i n)) best]
        [else
         (define ch (string-ref s i))
         (define-values (l r)
           (cond [(char=? ch #\() (values (add1 left) right)]
                 [else            (values left (add1 right))]))
         (cond
           [(= l r) (loop (+ i step) l r (max best (* 2 r)))]
           [(and (= step 1) (> r l)) (loop (+ i step) 0 0 best)]
           [(and (= step -1) (> l r)) (loop (+ i step) 0 0 best)]
           [else (loop (+ i step) l r best)])])))
  (max (pass 0 1) (pass (sub1 n) -1)))