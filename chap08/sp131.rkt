;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; A alon (a list of names) is :
; -- '()
; -- (cons String list-of-names)
; represents a list of contact on a cell phone

; List-of-names -> Boolean
; determines whether "Flatt" is on a-list-of-names
(define (contains-flatt? alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon) 
     (or (string=? (first alon) "Flatt")
        (contains-flatt? (rest alon)))]))

; ex:
(check-expect (contains-flatt? '()) #false)
(check-expect (contains-flatt? (cons "Find" '())) #false)
(check-expect (contains-flatt? (cons "Flatt" '())) #true)
(check-expect 
  (contains-flatt? 
    (cons "A" (cons "Flatt" (cons "C" '()))))
  #true)

(contains-flatt? (cons "Flatt" (cons "C" '())))
(contains-flatt? 
  (cons "A" (cons "Flatt" (cons "C" '()))))


