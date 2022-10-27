;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Design a function that computes the distance of objects in 
; a 3-dimensional space to the origin

(define-struct r3 [x y z])
; An R3 is a structure:
;  (make-r3 Number Number Number)
; represents a point in 3 dimensional space
; example:
(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 -1 0 3))

; R3 -> Number
; computes the distance of a point in 3-dimensional space(x,y,z) to the origin (0,0,0)
(define (distance3 p) (sqrt (+ (sqr (r3-x p)) (sqr (r3-y p)) (sqr (r3-z p)))))
; example: 
(check-expect (round (* 1000 (distance3 ex1))) (round (* 1000 (sqrt 174))))
(check-expect (round (* 1000 (distance3 ex2))) (round (* 1000 (sqrt 10))))

