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

(require 2htdp/image)
(require 2htdp/universe)

(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

; A Posn represents the state of the world.

; Posn -> Posn
; (define (main p0)
;   (big-bang p0
;             [on-tick x+]
;             [on-mouse reset-dot]
;             [to-draw scene+dot]))

; Posn -> Image
; adds a red spot to MTS at p
(define (scene+dot p) 
  (place-image DOT (posn-x p) (posn-y p) MTS))
; example: included in unit tests
(check-expect (scene+dot  (make-posn 10 20)) 
              (place-image DOT 10 20 MTS))
(check-expect (scene+dot  (make-posn 88 73)) 
              (place-image DOT 88 73 MTS))

; Posn -> Posn
; increases the x-coordinate of p by 3
(define (x+ p)
  (make-posn (+ (posn-x p) 3) (posn-y p)))
; exmaple: included in unit test
(check-expect (x+ (make-posn 81 55)) (make-posn 84 55))
(check-expect (x+ (make-posn 10 0)) (make-posn 13 0))

; Posn Number Number MouseEvt -> Posn
; for mouse clicks, (make-posn x y); otherise p
(define (reset-dot p x y me) 
  (cond
    [(mouse=? "button-down" me) (make-posn x y)]
    [else p]))
; example: included in unit tests
(check-expect 
  (reset-dot (make-posn 10 20) 29 31 "button-down")
  (make-posn 29 31))
(check-expect 
  (reset-dot (make-posn 10 20) 29 31 "button-up")
  (make-posn 10 20))
