;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; ex76

; example
(define-struct ufo [loc vel])
; A UFO is a structure:
; (make-ufo Posn Vel)
; represents (make-ufo p v) is at location
; p moving at velocity v

(define-struct movie [title producer year])
; A Movie is a structure:
; (make-movie Str Str Number)
; represents (make-movie title producer year)
; with title, name of producer and published year

(define-struct pet [name hair eyes phone])
; A Pet is a structure:
; (make-pet Str Str Str Number)
; represents (make-pet name hair eyes phone)
; with name, hair color, eyes color and phone number

;; ex77
(define-struct time-point [hours minutes seconds])
; A Time-point is a structure:
; (make-time-point Number Number Number)
; represents (make-time-point hours minutes seconds) 
; is a points in time since midnights consist of 3 numbers: hours, minutes, and seconds

;; ex78
(define-struct 3lword [1c 2c 3c])
; A 3lword is a structure:
; (make-3lword 1String 1String 1String)
; represents a three characters word consists of 1String fields
