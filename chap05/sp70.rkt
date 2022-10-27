;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Problem statement
; A game program
; keeps track of an object theat moves across the canvas
; at changing speed

; A UFO is a structure:
; (make-ufo Posn Vel)
; interpretation (make-ufo p v) is at location
; p moving at velocity v
(define-struct ufo [loc vel])

; A Vel is a structure:
; (make-vel X Y)
; interpreation (make-vel deltax deltay)  is
; the changeing of position
(define-struct vel [deltax deltay])

; UFO -> UFO
; determines where u moves in one clock tick;
; leaves the velocity as is
(define (ufo-move-1 u) 
  (make-ufo (posn+ (ufo-loc u) (ufo-vel u))
            (ufo-vel u)))
; example:
(define v1 (make-vel 88 -3))
(define v2 (make-vel -5 -3))

(define p1 (make-posn 22 80))
(define p2 (make-posn 30 77))

(define u1 (make-ufo p1 v1))
(define u2 (make-ufo p1 v2))
(define u3 (make-ufo p2 v1))
(define u4 (make-ufo p2 v2))

(check-expect (ufo-move-1 u1) u3)
(check-expect (ufo-move-1 u2)
              (make-ufo (make-posn 17 77) v2))

; Posn Vel -> Posn
; adds v to p
(define (posn+ p v) 
  (make-posn (+ (posn-x p) (vel-deltax v))
             (+ (posn-y p) (vel-deltay v))))
; example:
(check-expect (posn+ p1 v1) p2)
(check-expect (posn+ p1 v2) (make-posn 17 77))