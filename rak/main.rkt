#lang racket

(provide rkt-main)

(define (rkt-main)
    (get-line))

(define (get-line)
    (display "Enter your number:\n")
    (let [[line
            (string->number
            (read-line (current-input-port)
                    'any))]]
        (if line
            line
            (error "Invalid input string given. Expected a number."))))
