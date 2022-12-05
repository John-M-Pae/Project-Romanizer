#lang racket

(provide rak-main)

(define (rak-main)
    (let [[value (get-line)]]
        (if (is-valid? value)
            (roman value)
            (error "Your value is not a valid Roman numeral"))))

(define (get-line)
    (display "Enter your number:\n")
    (let [[line
            (string->number
            (read-line (current-input-port)
                    'any))]]
        (if line
            line
            (error "Invalid input string given. Expected a number."))))

(define (is-valid? val)
    (let [[test-val (* 12 val)]
          [bound 2399999]]
        (and (integer? test-val)
            (<= test-val
                bound))))

(define (roman val)
    val)
