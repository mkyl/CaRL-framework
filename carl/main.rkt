#lang racket
(require "reader.rkt"
         "expander.rkt")

(define (create-model port)
    (let* ([ast (load-rules port)]
           [model (handle-model ast)])
        model))
(provide create-model)

(define (load-data model)
    42)
(provide load-data)

; just temporarily
(define f (open-input-file "carl/test.carl"))
(provide f)
(define m (create-model f))
(provide m)
