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

(define-struct centry [name home office cell])
(define-struct phone [area number])
(make-centry "Shriram Fisler" 
             (make-phone 207 "363-2421")
             (make-phone 101 "776-1099")
             (make-phone 208 "112-9981"))