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

; image-area, counts the number of pixels in a given image
; image to represent image that rendered in drracket's interactive
; number to reprerent pixels
; image -> number
; count the number of pixels in an image
; multipy of width and height of image
; given: (circle 10 "solid" "green"), expect: 400
; given: (rectangle 20 10 "solid" "orange"), expect: 200

(require 2htdp/image)
(define (image-area image) (* (image-width image) (image-height image)))
