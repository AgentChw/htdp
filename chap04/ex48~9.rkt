;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Problem statement
; Data definitions
; Signature, Purposes, Header(random return value from its class)
; Examples
; Templates (for function body, what parameter to compute)
; Code
; Test


; (define (reward s)
;   (cond
;     [(<= 0 s 10) "bronze"]
;     [(and (< 10 s) (< s 20)) "silver"]
;     [else "gold"]))
; (reward 3)
; (reward 21)
; (reward 18)

(define (bla y) (- 200 (cond [(> y 200) 0] [else y])))
(bla 100)
(bla 210)
