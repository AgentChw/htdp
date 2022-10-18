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

(define CAT (circle 20 "solid" "orange"))
(define CAT2 (circle 20 "solid" "blue"))
(define BACKGROUND (empty-scene 1000 40))
(define Y-CAT 20)
(define EDGE-POS (- 1000 (/ (image-width CAT) 2)))
(define PIX-PER-SEC 3)

; CatState: state that represent the cat state (cs)

; CatState -> Image
; big-bang obtain the image of the cat in the world by evaluating CatState (render cs)
; if the x-coordinate of the cat is odd, change the cat to CAT2, else CAT1
; (define (render cs) cat-image)
; g: 0, e: (place-image CAT cs Y-CAT BACKGROUND)
; g: 100, e: (place-image CAT cs Y-CAT BACKGROUND)
; g: 79, e: (place-imae CAT2 cs Y-CAT BACKGROUND)
(define (render cs) (cond 
        [(even? cs) (place-image CAT cs Y-CAT BACKGROUND)]
        [else (place-image CAT2 cs Y-CAT BACKGROUND)]))
; tests
(check-expect (render 0) (place-image CAT 0 Y-CAT BACKGROUND))
(check-expect (render 100) (place-image CAT 100 Y-CAT BACKGROUND))
(check-expect (render 79) (place-image CAT2 79 Y-CAT BACKGROUND))

; CatState -> CatState
; each seconds, the next state is calculated by adding 3 pixels to the current state
; if the cat disapears on the right, make it appear at the left
; (define (prog cs) new-cs)
; g: 0, e: 3
; g: 14, e 17
; g: 1000, e: 0
; g: 999, e: 999
; g: 1002, e: 2
(define (move cs)
  (cond
    [(< cs 0) (- 0 cs)]
    [(>= cs EDGE-POS) (+ (modulo cs EDGE-POS) PIX-PER-SEC)]
    [else (+ cs PIX-PER-SEC)]))
; tests
(check-expect (move 0) 3)
(check-expect (move 14) 17)
(check-expect (move (+ EDGE-POS 1)) 4)

(define (main cs)
  (big-bang cs
            [to-draw render]
            [on-tick move]))
