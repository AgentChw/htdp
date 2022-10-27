;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define-struct editor [pre post])
; An Editor is a structure:
; (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t
; example:
(define e1 (make-editor "Hello " "World"))
(define e2 (make-editor "What the" " fuck"))
(define e3 (make-editor "Hello World" ""))
(define e4 (make-editor "" "S!"))
(define e5 (make-editor "12" "567"))
(define e6 (make-editor "    " "  "))

; ex83
(define WIDTH 200)
(define HEIGHT 20)
(define MTS (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 20 "solid" "red"))
(define T_SIZE 16)
(define T_COLOR "black") 
(define T_V_ALIGN "left")
(define T_H_ALIGN "center")
; Editor -> Image
; from editor render the text within an empty scene
(define (render ed) 
  (overlay/align T_V_ALIGN T_H_ALIGN
    (beside 
      (text (editor-pre ed) T_SIZE T_COLOR) 
      CURSOR 
      (text (editor-post ed) T_SIZE T_COLOR))
    MTS))
; example:
(render e1)
(render e2)

; ex84
(define TAB "\t")
(define BAC "\b")
(define RET "\r")
(define LEF "left")
(define RIG "right")
; Editor KeyEvent -> Editor
; ignore "\t" and "\r"
; if KeyEvent is "\b", delete the last character of Editor's pre
; ignore if the width of Editor's two part are too long for the canvas
; or add the KeyEvent to the end of Editor's pre
; move the cursor to the left of right if the KeyEvent is "left" or "right" 
; ignore other longer than on KeyEvents
(define (edit ed ke) 
  (cond 
    [(string=? ke TAB) ed]
    [(string=? ke RET) ed]
    [(string=? ke BAC) (del ed)]
    [(>= 
       (+
         (image-width (text (editor-pre ed) T_SIZE T_COLOR))
         (image-width (text (editor-post ed) T_SIZE T_COLOR)))
      (image-width MTS)) ed] 
    [(= (string-length ke) 1) (add ed ke)]
    [(string=? ke LEF) (move-left ed)]
    [(string=? ke RIG) (move-right ed)]
    [else ed]))
; example:
(check-expect (edit e1 BAC) (make-editor "Hello" "World"))
(check-expect (edit e3 BAC) (make-editor "Hello Worl" ""))
(check-expect (edit e4 BAC) e4)
(check-expect (edit e1 TAB) e1)
(check-expect (edit e6 RET) e6)
(check-expect (edit e1 "l") (make-editor "Hello l" "World"))
(check-expect (edit e2 "!") (make-editor "What the!" " fuck"))
(check-expect (edit e5 " ") (make-editor "12 " "567"))
(check-expect (edit e4 "4") (make-editor "4" "S!"))
(check-expect (edit e1 LEF) (make-editor "Hello" " World"))
(check-expect (edit e4 LEF) e4)
(check-expect (edit e1 RIG) (make-editor "Hello W" "orld"))
(check-expect (edit e3 RIG) e3)

; Editor -> Editor
; delete the last character of Editor's pre
(define (del ed) 
  (if 
    (= (string-length (editor-pre ed)) 0)
    ed
    (make-editor 
      (substring 
        (editor-pre ed) 0 (- (string-length (editor-pre ed)) 1))
      (editor-post ed))))
; example:
(check-expect (del e1) (make-editor "Hello" "World"))
(check-expect (del e3) (make-editor "Hello Worl" ""))
(check-expect (del e4) e4)

; Editor KeyEvent -> Editor
; add the KeyEvent to the end of Editor's pre
(define (add ed ke) 
  (make-editor 
    (string-append (editor-pre ed) ke)
    (editor-post ed)))
; example:
(check-expect (add e1 "l") (make-editor "Hello l" "World"))
(check-expect (add e2 "!") (make-editor "What the!" " fuck"))
(check-expect (add e5 " ") (make-editor "12 " "567"))
(check-expect (add e4 "4") (make-editor "4" "S!"))

; Editor -> Editor
; move the cursor right
(define (move-right ed) 
  (if 
    (= (string-length (editor-post ed)) 0)
    ed
    (make-editor 
      (string-append (editor-pre ed) (substring (editor-post ed) 0 1))
      (substring (editor-post ed) 1 (string-length (editor-post ed)))
    )))
; example:
(check-expect (move-right e1) (make-editor "Hello W" "orld"))
(check-expect (move-right e3) e3)

; Editor -> Editor
; move the cursor left
(define (move-left ed)
  (if 
    (= (string-length (editor-pre ed)) 0)
    ed
    (make-editor 
      (substring (editor-pre ed) 0 (- (string-length (editor-pre ed)) 1))
      (string-append 
        (substring 
          (editor-pre ed) 
          (- (string-length (editor-pre ed)) 1) 
          (string-length (editor-pre ed))) 
        (editor-post ed))
    )))
; example:
(check-expect (move-left e1) (make-editor "Hello" " World"))
(check-expect (move-left e4) e4)

; ex85
; String -> Interactive
; Launches the interactive editor
; with input String the pre part of the Editor
(define (run str)
  (big-bang (make-editor str "")
            [to-draw render]
            [on-key edit]))
; example:
(run "Hello World!")

; ex86
; change the edit function so that
; it won't add more character to Editor's pre 
; if the lenght of pre and post are enough to render on the canvas
; SOVLED
