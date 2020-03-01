#lang racket
(require "reader.rkt"
         "expander.rkt")

(define (create-model port)
    (let* ([ast (load-rules port)]
           [model (handle-model ast)])
        ast))
(provide create-model)

(define (load-data model)
    42)
(provide load-data)
