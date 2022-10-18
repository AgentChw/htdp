;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex21-26) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; example
;; (define (ff a) (* 10 a))
;; (ff (+ 1 1))

; ex21
;; (ff (ff 1))
;; (+ (ff 1) (ff 1))
;; (define (opening first-name last-name)
    ;; (string-append "Dear " first-name ","))
;; (opening "Matthew" "Fisler")

; ex22
;; (define (distance-to-origin x y)
  ;; (sqrt (+ (sqr x) (sqr y))))
;; (distance-to-origin 3 4)

; ex23
;;(define (string-first s)
  ;; (substring s 0 1))
;; (string-first "hello world")

; ex24
;; (define (==> x y)
  ;; (or (not x) y))
;; (==> #true #false)

; ex25
;; (require 2htdp/image)
;; (define (image-clasify img)
  ;; (cond 
    ;; [(> (image-height img) (image-width img)) "tall"]
    ;; [(= (image-height img) (image-width img)) "square"]
    ;; [(< (image-height img) (image-width img)) "wide"]))
;; (image-clasify (circle 10 "solid" "green"))

; ex26
(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))
(string-insert "helloworld" 6)


