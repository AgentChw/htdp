;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; A Color is one of:
; --- "white"
; --- "yellow"
; --- "orange"
; --- "green"
; --- "red"
; --- "blue"
; --- "black"
; example: white, yellow, blue, black

; H is a Number between 0 and 100.
; interpretation represents a happiness value
; example: 0, 100, 50, 39

(define-struct person [fstname lstname male?])
; A Person is a structure:
; (make-person String String Boolean)
; represents a person with first name, last name as String,
; and male? value is #True or #False(Female)
; example: (make-person Tien Tran #False), (make-person Lady Gaga #True)

(define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; represents a dog with a owner(Person), name(String), age(Number, positive integer), and happiness(Number)
; example: (make-dog (make-person Tien Tran #False) Jack 4 80),  (make-dog (make-person Diana Nguyen #False) Micky 6 -40)

; A Weapon is one of:
; --- #false
; --- Posn
; interpretation #false menas the missile hasn't
; been fired yet; a Posn means it is in flight
; example: #false, (make-posn 0 0), (make-posn -1 9)

