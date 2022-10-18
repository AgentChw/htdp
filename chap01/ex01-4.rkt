;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex01-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
TT; ex01
(define x 3)
(define y 4)

(sqrt (+ (sqr x) (sqr y)))

; ex02
(define prefix "hello")
(define suffix "world")

(string-append prefix "_" suffix)

; ex03
(define str "helloworld")
(define ind "0123456789")
(define i 5)

(string-append (substring str 0 i) "_" (substring str i (string-length str)))
(string-append (substring ind 0 i) "_" (substring ind i (string-length ind)))

; ex04
(string-append (substring str 0 (- i 1)) (substring str (+ i 1) (string-length str)))