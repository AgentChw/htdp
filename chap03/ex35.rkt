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

; Design the function stirng-last, which extracts the last character from a non-empty string.
; String to represent String
; Str1 to represent String
; string -> str1
; extracts the last character from a non-empty string
; given: "hello", expect: "o"
; given: "doi", expect: "i"

(define (string-last str) (string-ith str (- (string-length str) 1)))
