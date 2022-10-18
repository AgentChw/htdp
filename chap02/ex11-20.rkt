
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; ex11
(define (f x y) (sqrt (+ (sqr x) (sqr y))))

; ex12
(define (cvolume x) (* x x x))
(define (csurface x) (* 6 x x))

; ex13
(define (string-first str)
  (if (string? str)
      (if (> (string-length str) 0)
          (string-ith str 0)
          "not a non-empty string")
      "not a string")
)

; ex14
(define (string-last str)
  (if (string? str)
      (if (> (string-length str) 0)
          (string-ith str (- (string-length str) 1))
          "not a non-empty string")
      "not a string")
)

; ex15
(define (==> sunny friday) (and (not sunny) friday))

; ex16
(require 2htdp/image)
(require 2htdp/universe)
(define (image-area image) (* (image-width image) (image-height image)))

; ex17
(define (image-classify image) 
    (cond 
      [(> (image-height image) (image-width image)) "tall"]
      [(= (image-height image) (image-width image)) "square"]
      [(< (image-height image) (image-width image)) "wide"]
    )
)

; ex18
(define (string-join s1 s2) (string-append s1 "_" s2))

(define (string-insert str i) 
    (if (>= i (string-length str))
        "i is larger than string length"
        (string-append
            (substring str 0 i) "_" (substring str i (string-length str))
        )
    )
)

; ex20
(define (string-delete str i)
  (if (>= i (string-length str))
    "i is large rthan string lenght"
    (string-append 
      (substring str 0 i) (substring str (+ i 1) (string-length str))
    )
    )
)



