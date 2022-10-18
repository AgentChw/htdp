;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Problem statement
; Data definitions
; Signature, Purposes, Header(random return value from its class)Wh
; Examples
; Templates (for function body, what parameter to compute)
; Code
; Test

; World State: data that represents the state of the world (cw)

; WorldState -> Image
; when needed, big-bang obtains the image of the current state of the world by evaluating (render cw)
; (define (render ws) ...)

; WorldState -> WorldState 
; for each keystroke, big-bang obtains the next state
; from (keystroke-handler cw ke); ke represents the key
; (define (keystroke-handler cw ke) ...)

; WorldState Number Number String -> WorldState
; for each mouse gestruer, big-bang obtains the next state
; from (mouse-event-handler cw x y me) ...)

; WorldStae -> Boolean
; after each event, big-bang evaluates (end? cw)
; (define (end? cw) ...)

(require 2htdp/image)
(require 2htdp/universe)

(define WHEEL-RADIUS 5)
(define BACKGROUND (empty-scene 1000 40))
(define Y-CAR 20)
(define CAR (rectangle 60 25 "solid" "blue"))
(define EDGE-POS (- 1000 (/ (image-width CAR) 2))) 
(define BUTTON-DOWN "button-down")

; WorldState -> WorldState
; moves the car by 3 pixels for every clock tick
; g: 20, e: 23
; g: 78, e: 81
(define (tock ws) (+ ws 3))

; WorldStae -> Image
; places the car into the BACKGROUND scene, according to the given world state
; g: 600, e: more than middle 
; g: 50, e: at the begining
(define (render ws) (place-image CAR ws Y-CAR BACKGROUND))

(define tree 
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

; WorldState -> Boolean
; After each events big-bang evaluates (end? ws)
; (define (end? ws) ...)
(define (end? ws) (>= ws EDGE-POS))

; WorldSDate Number Number String -> WorldState 
; places the car at x-mouse
; if the given me is "button-down"
; (define (hyper x-position-ofcar x-mouse y-mouse me) x-position-of-car)
; g: 21 10 20 "enter: ", e: 21
; g: 42 10 20 "button-down", e: 10
; g: 42 10 20 "move", e: 42
(define (hyper ws x-pos y-pos mes) (if (equal? mes "button-down") x-pos ws))
; tests
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]
            [on-mouse hyper]
            [stop-when end?]))
