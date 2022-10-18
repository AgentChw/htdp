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

; string-remove-last, produces a string like the given one with the last character removed
; string to represent string
; string -> string
; return a string that abandon the last char from a given string
; create substring that ignore the last char
; given: "hao hao dau xanh", expect: "hao hao dau xan"
; given: "hi", expect: "h"
; given: "", expect: ""
; given: "h", expect: ""

(define (last-char-pos str) (- (string-length str) 1))
(define (string-remove-last str) (if (<= (string-length str) 0) "" (substring str 0 (last-char-pos str))))
