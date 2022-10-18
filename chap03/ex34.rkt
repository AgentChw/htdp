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

; Design the function string-first, which extracts the first character from a non-empty string. Don't worry about empty strings.

; String to represent string
; Str1 to represent character
; String -> Str1
; extracts the first character for a non-empty string
; given: "ehh" -> expect: 'e'
; given: "hello" -> expect: 'h'

(define (string-first str) (string-ith str 0))

