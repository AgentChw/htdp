;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex47) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Problem statement
; Data definitions
; Signature, Purposes, Header(random return value from its class)
; Examples
; Templates (for function body, what parameter to compute)
; Code
; Test

; "happiness gauge", gauge-prog
; display start with maximum score,
; each clock itck, happiness decreases by -0.1, 0 is minimum score
; down arrow key, increase 1/5
; up arrow pressed, increase 1/3
; visual: red rectangle with black frame, 0 red bar is gone, 100 all the way across the scene

; (define (gauge-prog hp) (big-bang hp [...]))
(require 2htdp/image)
(require 2htdp/universe)

; Data definitions
(define MAX-HP 100)
(define MIN-HP 0)
(define DE-HP 0.1)
(define UP_ARROW "up")
(define DOWN_ARROW "down")
(define UP_ADD (/ 1 3))
(define DOWN_ADD (/ 1 5))
(define BACK_GROUND (empty-scene 1000 42))
(define BAR_HEIGHT 40)
(define IMG_CV 10)
(define Y-BAR 21)
(define H-WIDTH 2)
(define START-HP MAX-HP)

; HappyState -> HappyState
; decreases the amount of happiness by -0.1 every seconds
; (define (dehappy hp) new-hp)
; 0 -> 0; 100 -> 99.9; 44, 43.9; 100.2 -> 100
(define (dehappy hp)
  (cond 
    [(>= hp MAX-HP) (- MAX-HP DE-HP)]
    [(> hp MIN-HP) (- hp DE-HP)]
    [else MIN-HP]))
; tests
(check-expect (dehappy 0) 0)
(check-expect (dehappy 100) 99.9)
(check-expect (dehappy 44) 43.9)
(check-expect (dehappy 100.2) 99.9)

; HappyState key -> HappyState
; if the down arrow is pressed, increase happiness by 1/5
; if the up arrow is pressed, increase happiness by 1/3
; (define (add-happy hp key) hp)
; 100 "up" -> 100; 32 "down" -> 32.2; 0 "up" -> (+ 0 (/ 1 3)); 40 "w" -> 40
(define (add-happy hp key) 
  (cond 
    [(>= hp MAX-HP) MAX-HP]
    [(< hp MIN-HP) MIN-HP]
    [(string=? key UP_ARROW) (+ hp UP_ADD)]
    [(string=? key DOWN_ARROW) (+ hp DOWN_ADD)]
    [else hp]))
(check-expect (add-happy 100 "up") 100)
(check-expect (add-happy 32 "down") 32.2)
(check-expect (add-happy 0 "up") UP_ADD)
(check-expect (add-happy 40 "w") 40)

; HappyState -> Image
; with each happy state, create an image represents it
; (define (img hp) image)
; 0 -> (rectangle 0 BAR_HEIGHT "solid" "red")
; 40 -> (rectangle (* 40 IMG_CV) BAR_HEIGHT "solid" "red")
; 100 -> (rectangle (* 100 IMG_CV) BAR_HEIGHT "solid" "red")
(define (img hp) (rectangle (* hp IMG_CV) BAR_HEIGHT "solid" "red"))
; tests
(check-expect (img 0) (rectangle 0 BAR_HEIGHT "solid" "red"))
(check-expect (img 40) (rectangle (* 40 IMG_CV) BAR_HEIGHT "solid" "red"))
(check-expect (img 100) (rectangle (* 100 IMG_CV) BAR_HEIGHT "solid" "red"))

; HappyState -> Image
; with each happy state, big-bang places the image in the scene to view
; define (render hp) img)
; 0 -> (place-image (img 0) (/ (* 0 IMG_CV) H-WIDTH) Y-BAR BACK_GROUND)
; 40 -> (place-image (img 40) (/ (* 40 IMG_CV) H-WIDTH) Y-BAR BACK_GROUND)
; 100 -> (place-image (img 100) (/ (* 100 IMG_CV) H-WIDTH) Y-BAR BACK_GROUND)
(define (render hp) (place-image (img hp) (/ (* hp IMG_CV) H-WIDTH) Y-BAR BACK_GROUND))
; tests
(check-expect (render 0) (place-image (img 0) (/ (* 0 IMG_CV) H-WIDTH) Y-BAR BACK_GROUND))
(check-expect (render 40) (place-image (img 40) (/ (* 40 IMG_CV) H-WIDTH) Y-BAR BACK_GROUND))
(check-expect (render 100) (place-image (img 100) (/ (* 100 IMG_CV) H-WIDTH) Y-BAR BACK_GROUND))

(define (gauge-prog hp) 
  (big-bang START-HP
            [on-tick dehappy]
            [to-draw render]
            [on-key add-happy]))
