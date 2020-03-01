#lang racket

(define (handle-model m)
    (let* ([rules (syntax-e m)]
           )
      (map handle-rule rules)))
(provide handle-model)

(define (handle-rule r)
    42)
  