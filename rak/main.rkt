#lang racket

(display "Enter your number:")
(define content 
    (read-line (current-input-port) 'return))
(define line-to-num
    (string->number content))

(printf "~a has been read in\n"
    content)
(if line-to-num
    (printf "~a is your value"
        line-to-num)
    (error "Input could not be read as a valid number."))