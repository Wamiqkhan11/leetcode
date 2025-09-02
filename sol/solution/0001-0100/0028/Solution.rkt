(define/contract (str-str haystack needle)
    (-> string? string? exact-integer?)
    (let* ((n (string-length haystack))
                 (m (string-length needle)))
        (cond
            [(= m 0) 0]
            [else
             (define lps (make-vector m 0))
             (let loop ((i 1) (len 0))
                 (when (< i m)
                     (cond
                         [(char=? (string-ref needle i) (string-ref needle len))
                            (set! len (add1 len))
                            (vector-set! lps i len)
                            (loop (add1 i) len)]
                         [(> len 0)
                            (loop i (vector-ref lps (sub1 len)))]
                         [else
                            (vector-set! lps i 0)
                            (loop (add1 i) len)])))
             (let search ((i 0) (j 0))
                 (cond
                     [(= i n) -1]
                     [(char=? (string-ref haystack i) (string-ref needle j))
                        (if (= (add1 j) m)
                                (- (add1 i) m)
                                (search (add1 i) (add1 j)))]
                     [(> j 0) (search i (vector-ref lps (sub1 j)))]
                     [else (search (add1 i) j)]))])))