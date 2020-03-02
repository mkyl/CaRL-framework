#lang racket
(require "reader.rkt"
         "expander.rkt"
         "grounding.rkt")

(define (create-model port)
    (let* ([ast (load-rules port)]
           [model (handle-model ast)])
        model))
(provide create-model)

(provide load-data)

; just temporarily
(define f (open-input-file "carl/test.carl"))
(provide f)
(define m (create-model f))
(provide m)
(require db)
(define sqlite 
    (sqlite3-connect #:database 'memory))
(query-exec sqlite
    "create table score (key string PRIMARY KEY, value integer)")
(query-exec sqlite
    "create table experience (key string PRIMARY KEY, value integer)")
(query-exec sqlite
    "create table luck (key string PRIMARY KEY, value integer)")

(query-exec sqlite
    "insert into score values ('eve', 1), ('alice', 0), ('bob', 1)")
(query-exec sqlite
    "insert into experience values ('eve', 0), ('alice', 0), ('bob', 1)")
(query-exec sqlite
    "insert into luck values ('eve', 1), ('alice', 0), ('bob', 0)")
(load-data m sqlite)