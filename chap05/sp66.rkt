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

; ball is a struct represent a ball that moving in a room
; location represent the distance from the top of the room
; velocity represent the velocity of the room
(define-struct ball [location velocity])