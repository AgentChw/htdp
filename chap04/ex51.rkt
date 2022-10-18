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

; simulates a traffic light for a given duration
; renders the state of a traffic light as a solid circle of the appropriate color
; change the state every clock ticks
; LightState is a Number
; (define (main 0) (big-bang RED 0) ...)

(require 2htdp/image)
(require 2htdp/universe)
(define RED "red")
(define GREEN "green")
(define YELLOW "yellow")
(define BG (empty-scene 200 200))
(define DUR 3)
(define START_S 1)
(define X 100)
(define Y 100)
(define RA 60)
(define S_MAX 80)
(define S_MIN 0)
(define S_IN 1)
(define RED_S 0)
(define GREEN_S 30)
(define YELLOW_S 60)

; LightState -> LightState
; add 1 to LightState every seconds, if LightState get to 9, reset it to 1
; (define (change s t) s)
; 80 -> 0; 4 -> 5; 60 -> 61
(define (change s) 
  (cond
    [(>= s S_MAX) S_MIN]
    [else (+ s S_IN)]))
; tests
(check-expect (change 80) 0)
(check-expect (change 4) 5)
(check-expect (change 60) 61)

; LightState -> Image
; place the rendered image into scene
; (define (render s) img)
(define (render s) (place-image (img s) X Y BG))

; LightState -> Image
; render the state of the traffic light into a solid color cirle
; (define (img s) img)
; 1 -> "red"; 50 -> "green"; 70 -> "yellow"
(define (img s) 
  (cond 
    [(> s YELLOW_S) (circle RA "solid" YELLOW)]
    [(> s GREEN_S) (circle RA "solid" GREEN)]
    [else (circle RA "solid" RED)]))
; tests
(check-expect (img 1) (circle RA "solid" RED))
(check-expect (img 50) (circle RA "solid" GREEN))
(check-expect (img 70) (circle RA "solid" YELLOW))

(define (main s)
  (big-bang START_S
            [to-draw render]
            [on-tick change]))

