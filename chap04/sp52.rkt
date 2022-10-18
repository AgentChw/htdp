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

; And LR (short for laungching rocket) is one of:
; -- "resting"
; -- NonnegativeNumber
; -- interpretation "resting" represents a grounded rocket
; a number denotes the height of a rocket in flight
(require 2htdp/image)

(define HEIGHT 300) ; distances in pixels
(define WIDTH 100)
(define YDELTA3 3)
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "shortlid"))
(define CENTER (/ (image-height ROCKET) 2))

; An LRCD (for launching rocket countdown) is one of:
; -- "resting"
; -- a Number between -3 and -1
; a NonnegativeNumber
; inteerpretation of grounded rocket, in countdown mode,
; a number denotes the number of pixels  between the
; top of the canvas and the rocket (its height)

; LRCD -> Image
; renders the state as a resting or flying rocket 
(define (show x) BACKG)

;LRCD KeyEvent -> LRCD
; starts the countdown when space bar is pressed,
; if the rocket is still resing
(define (launch x ke) x)

; LRCD -> LRCD
; raises the rocket by YDELTA,
; if it is moving already
(define (fly x) x)



