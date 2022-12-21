;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; A List-of-numbers is one of:
; -- '()
; -- (cons Number List-of-numbers)
; examples:
(define ln0 '())
(define ln1 (cons 2 '()))
(define ln2 (cons 4 ln1))
(define ln3 (cons -8 ln2))
(define ln4 (cons 11 ln3))
(define ln5 (cons 6 ln2))
(define ln6 (cons 5 '()))
(define ln7 (cons -1 '()))

; List-of-numbers -> Boolean
; check if all the numbers are positive
(define (pos? ln) 
  (cond
    [(empty? ln) #true]
    [(cons? ln) (and (> (first ln) 0) (pos? (rest ln)))]))
; examples:
(check-expect (pos? ln0) #true)
(check-expect (pos? ln1) #true)
(check-expect (pos? ln2) #true)
(check-expect (pos? ln3) #false)
(check-expect (pos? ln4) #false)
(check-expect (pos? ln5) #true)
(check-expect (pos? ln6) #true)
(check-expect (pos? ln7) #false)








