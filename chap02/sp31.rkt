;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sp31) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/batch-io)

(define (convert in out)
  (write-file out
              (string-append
                (number->string
                  (C
                    (string->number
                      (read-file in))))
                "\n")))

(define (C f)
  (* 5/9 (- f 32)))

(write-file "sample.dat" "212")
(convert "sample.dat" 'stdout)
(convert "sample.dat" "out.dat")
(read-file "out.dat")
