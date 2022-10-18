;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex27-29) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Literal Constants
(define ATTENLOWEST 120) ; people
(define LOWESTPRICE 5.0) ; $
(define AVERAGEATT 15) ; people
(define PRICEPERCHANGE 0.1) ; $
(define FIXEDCOST 0) ; $
(define VARICOST 1.50) ; $

; Computed Constants
(define PRICE-SENSITIVITY (/ AVERAGEATT PRICEPERCHANGE))

; helper functions/ auxiliary functions
(define (attendees ticket-price)
  (- ATTENLOWEST (* (- ticket-price LOWESTPRICE) PRICE-SENSITIVITY)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXEDCOST (* VARICOST (attendees ticket-price))))

; main funtion
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

; alternative: only one function
(define (profit2 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

