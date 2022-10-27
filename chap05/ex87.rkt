;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct editor [str cs])
; An Editor is a Structure:
; (make-editor String Number)
; interpretation (make-editor str cs) descrives an editor
; whose the visible text is str with
; the cursor displayed at cs(the number of characters from the left) 
; example
(define e1 (make-editor "Hello World" 6))
(define e2 (make-editor "What" 2))
(define e3 (make-editor "WoaWoa " 7))
(define e4 (make-editor "S!" 0))
(define e5 (make-editor "" 0))

; Editor -> Interacive
; lauches an interactive editor
; with Editor is the states of the program
(define (run str)
  (big-bang (make-editor str (string-length str))
            [to-draw render]
            [on-key edit]))

(define WIDTH 200)
(define HEIGHT 20)
(define MTS (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 20 "solid" "red"))
(define T_SIZE 16)
(define T_COLOR "black") 
(define T_V_ALIGN "left")
(define T_H_ALIGN "center")
; Editor -> Image
; render the text and the cursor on an empty scene
(define (render ed)
  (overlay/align T_V_ALIGN T_H_ALIGN
    (above
      (text (editor-str ed) T_SIZE T_COLOR)
      CURSOR )
    MTS))
; example:
(render e1)
(render e2)


; Editor -> Editor
; change the state of an Editor if a key is pressed
(define (edit ed) ed)
