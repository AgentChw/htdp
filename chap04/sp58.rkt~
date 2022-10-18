;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sp58) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; A Price falls into one of three internvals:
; --- 0 through 1000
; --- 1000 through 10000
; --- 10000 and above.
; interpretation the price of an item

; Price -> Number
; computes the amount of tax charged for p
; 0 -> 0; 537 -> 0; 1000 -> 50; 1282 -> 64; 10000 -> 800(asked the specialist); 12017 -> 961
(define (sales-tax p) 
  (cond
    [(and (<= 0 p) (< p 1000)) 0]
    [(and (<= 1000 p) (< p 10000)) (* 0.05 p)]
    [(>= p 10000) (* 0.08 p)]))
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) 50)
(check-expect (sales-tax 1282) 64)
(check-expect (sales-tax 10000) 800)
(check-expect (sales-tax 12017) 961)
