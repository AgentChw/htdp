;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex07) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; ex07
(define sunny #true)
(define friday #false)

;go to the mall if true
(or (not sunny) friday)

; if statement
(define x 0)
(if (= x 0) 0 (/ 1 x))

; ex09
(define in "hello")
(if (string? in ) (string-length in) ...)
(if (number? in) (if (> in 0) (- in 1) ...) ...)
(if (boolean? in) (if (= in true) 10 20) ...)