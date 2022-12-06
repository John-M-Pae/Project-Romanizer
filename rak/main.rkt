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
        (and (positive-integer? test-val)
            (<= test-val
                bound))))

(define (roman value)
    (if (zero? value)
        "Z"
        (roman-iter value "" Numerals)))

(define (roman-iter value result numerals)
    (cond ((zero? value)
            result)
        ((>= value (caar numerals))
            (roman-iter
                (- value (caar numerals))
                (string-append result (cadar numerals))
                numerals))
        (else value
            (roman-iter
                value
                result
                (cdr numerals)))))

(define Numerals
    (let [[arab-list (list (power 5)
                           (* 5 (power 4))
                           (power 4)
                           (* 5 (power 3))
                           (power 3)
                           (* 9 100)
                           (* 5 100)
                           (* 4 100)
                           100 90 50 40 10 9 5 4 1
                           (/ 1 2)
                           (/ 5 12)
                           (/ 1 3)
                           (/ 1 4)
                           (/ 1 6)
                           (/ 1 2))]
          [roman-list (list "ↈ" "ↇ" "ↂ" "ↁ" "ↀ" "Cↀ" "D" "CD" "C" "XC" "L" "XL" "X" "IX" "V" "IV" "I" "S" "⁙" "∷" "∴" ":" "·")]]
         (map list arab-list roman-list)))

(define (power n)
    (expt 10 n))