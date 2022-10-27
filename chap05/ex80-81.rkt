;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; ex80
; Create templates for functions that comsume instances of the structure types
(define-struct movie [title director year])
(define-struct pet [name number])
(define-struct CD [artist title price])
(define-struct sweater [material size color])

(define (func-movie mo) (... (movie-title mo) ... (movie-director mo) ... (movie-year mo)))
(define (func-pet pup) (... (pet-name pup) ... (pet-number pup)))
(define (func-CD cd) (... (CD-artist cd) ... (CD-title cd) ... (CD-price cd)))
(define (func-sweater sw) (... (sweater-material sw) ... (sweater-size sw) ... (sweater-color sw)))

; ex81
(define-struct time-point [hours minutes seconds])
; A Time-point is a structure:
; (make-time-point Number Number Number)
; represents (make-time-point hours minutes seconds) 
; is a points in time since midnights consist of 3 numbers: hours, minutes, and seconds
; example:
(define p1 (make-time-point 3 30 23))
(define p2 (make-time-point 16 22 9))

; Time-point -> Number
; produces the number of seconds that have passed since midnight
(define (convert-time tpoint) (+ (* 60 60 (time-point-hours tpoint)) (* 60 (time-point-minutes tpoint)) (time-point-seconds tpoint)))
; example:
(check-expect (convert-time p1) 12623)
(check-expect (convert-time p2) 58929)

; ex82
(define-struct 3lw [1c 2c 3c])
; A 3lw is a structure:
; (make-3lw 1String 1String 1String)
; represents a three characters word consists of 1String fields
; example:
(define s1 (make-3lw "c" "a" "t"))
(define s2 (make-3lw "c" "a" "t"))
(define s3 (make-3lw "d" "o" "g"))

; 3lw 3lw -> 3lw or #false
; determines whether 2 3 letters words are the same or not, return #false if not
(define (com3 s1 s2) 
  (cond
   [(not (string=? (3lw-1c s1) (3lw-1c s2))) #false]
   [(not (string=? (3lw-2c s1) (3lw-2c s2))) #false]
   [(not (string=? (3lw-3c s1) (3lw-3c s2))) #false]
   [else s1]))
; example:
(check-expect (com3 s1 s2) s1)
(check-expect (com3 s1 s3) #false)
