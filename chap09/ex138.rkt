;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; A List-of-amounts is one of:
; -- '()
; -- (cons PositiveNumber List-of-amounts)
; Represents the sequence of amounts of money
; examples:
(define l0 '())
(define l1 (cons 1 '()))
(define l2 (cons 2 l1))
(define l3 (cons 5 l2))
(define l4 (cons 10 l3))
(define l5 (cons 6 l1))

; List-of-amounts -> Number
; Calculate the sum of all the amounts of money in a list
(define (sum loa) 
  (cond 
    [(empty? loa) 0]
    [(cons? loa) (+ (first loa) (sum (rest loa)))]))
; examples:
(check-expect (sum l0) 0)
(check-expect (sum l1) 1)
(check-expect (sum l2) 3)
(check-expect (sum l3) 8)
(check-expect (sum l4) 18)
(check-expect (sum l5) 7)
