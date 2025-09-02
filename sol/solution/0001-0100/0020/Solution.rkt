(define is-valid
  (lambda (s)
    (let ([pairs (make-hash)])
      (hash-set! pairs #\) #\()
      (hash-set! pairs #\] #\[)
      (hash-set! pairs #\} #\{)
      (let loop ([chars (string->list s)]
                 [stack '()])
        (cond
          [(null? chars) (null? stack)]
          [else
           (define ch (car chars))
           (cond
             [(member ch (list #\( #\[ #\{))
              (loop (cdr chars) (cons ch stack))]
             [(hash-has-key? pairs ch)
              (and (not (null? stack))
                   (equal? (hash-ref pairs ch) (car stack))
                   (loop (cdr chars) (cdr stack)))]
             [else #f])])))))
(provide is-valid)
