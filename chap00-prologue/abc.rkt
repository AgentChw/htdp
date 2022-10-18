;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname abc) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(circle 10 "solid" "red")
(overlay (circle 5 "solid" "red") (rectangle 20 20 "solid" "blue"))
(image-width (overlay (circle 5 "solid" "red") (rectangle 20 20 "solid" "blue")))
(place-image (circle 5 "solid" "green") 50 80 (empty-scene 100 100))

(define (y x) (* x x))
(y 1)
(y 3)
(y 8)
(define (g item) (* 2.4 (+ 2 item)))
(g 8)

(define (picture-of-rocket height) (place-image (circle 10 "solid" "green") 50 height (empty-scene 100 60)))
(picture-of-rocket 30)

(define (picture-of-rocket.v2 height)
  (cond
    [(<= height (- 60 (/ (image-height (circle 10 "solid" "orange")) 2)))
      (place-image (circle 10 "solid" "orange") 50 height (empty-scene 100 60))]
    [(> height (- 60 (/ (image-height (circle 10 "solid" "orange")) 2)))
       (place-image (circle 10 "solid" "orange") 50 (- 60 (/ (image-height (circle 10 "solid" "orange")) 2)) (empty-scene 100 60))]
  )
)

; constants
(define WIDTH 100)
(define HEIGHT 60)
(define MTSCN (empty-scene WIDTH HEIGHT))

(define ROCKET (circle 10 "solid" "orange"))
(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2)))

;functions
(define (picture-of-rocket.v5 h)
  (cond
    [(<= h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 h MTSCN)]
    [(> h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))
    
;animation
(animate picture-of-rocket.v5)