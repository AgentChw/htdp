;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; A List-of-temperatures is one of:
; -- '()
; -- (cons CTemperature List-of-temperatures)

; A CTempeerature is a Number greater than -272.
; examples:
(define t1 (cons 20 '()))
(define t2 (cons -70 t1))
(define t3 (cons 200 t2))
(define t4 (cons -300 t1))

; List-of-temperatures -> Number
; computes the average temperature
(define (average alot) 
  (/ (sum alot) (how-many alot)))
; examples:
(check-expect 
  (average (cons 1 (cons 2 (cons 3 '())))) 2)

; List-of-temperatures -> Number
; adds up the temeratures on the given list
(define (sum alot) 
  (cond
    [(empty? alot) 0]
    [(cons? alot) (+ (first alot) (sum (rest alot)))]))
; ex:
(check-expect (sum t1) 20)
(check-expect (sum t2) -50)
(check-expect (sum t3) 150)

; List-of-temperatures -> Number
; counts the temperatures on the given list
(define (how-many alot)
  (cond
    [(empty? alot) 0]
    [(cons? alot) (+ 1 (how-many (rest alot)))]))
; ex:
(check-expect (how-many t0) 0)
(check-expect (how-many t1) 1)
(check-expect (how-many t2) 2) 
(check-expect (how-many t3) 3) 
