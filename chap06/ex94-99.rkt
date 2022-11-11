;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define B_WID 200)
(define B_HEI 300)
(define TANK_Y (- B_HEI 20))
(define GROUND (- B_HEI 30))
(define BG (empty-scene B_WID B_HEI))
(define TANK (above (rectangle 10 10 "solid" "blue") 
                    (rectangle 30 10 "solid" "blue")))
(define MSL (triangle 10 "solid" "red"))
(define UFO (above (rectangle 5 5 "solid" "green")
                   (rectangle 20 10 "solid" "green")
                   (rectangle 5 10 "solid" "green")))
(define T_SPEED 10)
(define M_SPEED 20)
(define U_SPEED 2)
(define GAME_OVER (text "Game Over!" 28 "indigo"))
(define B_CENTER_X (/ B_WID 2))
(define B_CENTER_Y (/ B_HEI 2))

(define-struct tank [loc vel])
; A Tank is a structure:
; (make-tank Number Number)
; represents (make-tank x dx) specifies the postion horizontally and the speed of the tank
; examples: 
(define t1 (make-tank 0 -3))
(define t2 (make-tank -100 4))
(define t3 (make-tank B_WID 6))
(define t4 (make-tank (/ B_WID 2) 0))
(define t5 (make-tank 28 -6))
(define t6 (make-tank 100 0))
(define t1am (make-tank -3 -3))

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])
; an Aim is a structure:
; (make-aim Posn Tank)
; represents the states of game when missiles is not fired
; A UFO is a Posn
; represents the UFO's location (to-down, left-right)
; A Missile is a Posn
; represents the missile position

; UFO examples:
(define u1 (make-posn 0 0))
(define u2 (make-posn B_WID B_HEI))
(define u3 (make-posn -50 1000))
(define u4 (make-posn (/ B_WID 2) (/ B_HEI 2)))
(define u5 (make-posn 40 30))
(define u6 (make-posn 20 100))
(define u7 (make-posn (/ B_WID 2) GROUND))
; Missile examples:
(define m1 (make-posn 0 0))
(define m2 (make-posn B_WID B_HEI))
(define m3 (make-posn -50 1000))
(define m4 (make-posn (/ B_WID 3) (/ B_HEI 4)))
(define m5 (make-posn 45 35))
(define m7 (make-posn (/ B_WID 2) (+ GROUND 5)))
(define m5am (make-posn 45 (- 35 M_SPEED)))

; A SIGS is one of:
; -- (make-aim UFO Tank)
; -- (make-fired UFO Tank Missile)
; interpretation represents the complete state of a space invader game

; Tank Image -> Image
; adds t to the given image im
(define (tank-render t im) 
  (place-image TANK (tank-loc t) TANK_Y im))
; examples:
(tank-render t1 BG)
(tank-render t2 BG)
(tank-render t3 BG)
(tank-render t4 BG)

; UFO Image -> Image
; adds u to the given image im
(define (ufo-render u im) 
  (place-image UFO (posn-x u) (posn-y u) im))
; examples:
(ufo-render u1 BG)
(ufo-render u2 BG)
(ufo-render u3 BG)
(ufo-render u4 BG)

; Missile Image -> Image
; adds m to the given image im
(define (missile-render m im ) 
  (place-image MSL (posn-x m) (posn-y m) im))
; examples:
(missile-render m1 BG)
(missile-render m2 BG)
(missile-render m3 BG)
(missile-render m4 BG)

; SIGS -> Image
; adds TANK, UFO, and possibly MISSILE to
; the BACKGROUND scene
(define (render s) 
  (cond
    [(aim? s) 
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) BG))]
    [(fired? s) 
     (tank-render (fired-tank s)
                  (ufo-render (fired-ufo s)
                              (missile-render (fired-missile s) BG)))]))
; example:
(render (make-aim u5 t1))
(render (make-fired u6 t5 m4))
(render (make-fired u5 t4 m5))

; SIGs -> boolean
; conditions to end the game:
; if UFO lands
; or the missile hits the UFO
(define (si-game-over? s)
  (cond
    [(aim? s) (aim-over? s)]
    [(fired? s) (fired-over? s)]))
; examples:
(check-expect (si-game-over? (make-aim u7 t3)) #true)
(check-expect (si-game-over? (make-fired u7 t5 m2)) #true)
(check-expect (si-game-over? (make-aim u6 t2)) #false)
(check-expect (si-game-over? (make-fired u5 t4 m5)) #true)
(check-expect (si-game-over? (make-fired u2 t5 m2)) #true)
(check-expect (si-game-over? (make-fired u4 t2 m4)) #false)

; SIGs -> Boolean
; end states of aim:
; when ufo touch the ground
(define (aim-over? s) (>= (posn-y (aim-ufo s)) GROUND))
; examples:
(check-expect (aim-over? (make-aim u7 t3)) #true)
(check-expect (aim-over? (make-aim u6 t2)) #false)

; SIGs -> Boolean
; end states of fire
(define (fired-over? s) 
  (cond
    [(>= (posn-y (fired-ufo s)) GROUND) #true]
    [(and 
       (<= 
        (abs
            (- 
                (posn-y (fired-ufo s)) (posn-y (fired-missile s)))) 
        5)
       (<=
         (abs
           (-
             (posn-x (fired-ufo s)) (posn-x (fired-missile s)))))
    ) #true]
    [else #false]))
; examples:
(check-expect (fired-over? (make-fired u7 t5 m2)) #true)
(check-expect (fired-over? (make-fired u5 t4 m5)) #true)
(check-expect (fired-over? (make-fired u2 t5 m2)) #true)
(check-expect (fired-over? (make-fired u4 t2 m4)) #false)

; SIGs -> Image
; Informs the end of the game
(define (si-render-final s) (place-image GAME_OVER B_CENTER_X B_CENTER_Y (render s)))
  ; examples:
  (si-render-final (make-fired u5 t4 m5))
  (si-render-final (make-aim u5 t1))

; SIGs -> SIGs
; calculates the next position of objects
(define (si-move s)
  (cond 
    [(aim? s) 
     (make-aim 
       (move-ufo (aim-ufo s))
       (move-tank (aim-tank s)))]
    [(fired? s) 
     (make-fired
        (move-ufo (fired-ufo s))
        (move-tank (fired-tank s))
        (move-missile (fired-missile s)))]))
; examples: 

; Posn -> Posn
; calculates the next position of UFO
(define (move-ufo u) 
  (make-posn
    (cond
      [(= (random 1) 0) (- (posn-x u) (random U_SPEED))] 
      [else (+ (posn-x u) (random U_SPEED))])
    (+ (posn-y u) U_SPEED)))
; examples:
(check-random 
  (move-ufo u5)
  (make-posn
    (cond
      [(= (random 1) 0) (- (posn-x u5) (random U_SPEED))]
      [else (+ (posn-x u5) (random U_SPEED))])
    (+ 30 U_SPEED)))

; Tank -> Tank
; calculates the next position of Tank
(define (move-tank t)
  (make-tank 
    (+ (tank-loc t) (tank-vel t))
    (tank-vel t)))
; examples:
(check-expect (move-tank t1) t1am)
(check-expect (move-tank t4) 
              (make-tank
                (+ (tank-loc t4) (tank-vel t4))
                (tank-vel t4)))

; Posn -> Posn
; calculates the next position of Missile
(define (move-missile m) 
  (make-posn 
    (posn-x m)
    (- (posn-y m) M_SPEED)))
; examples:
(check-expect (move-missile m5) m5am)
(check-expect (move-missile m7) 
              (make-posn
                (/ B_WID 2)
                (- (+ GROUND 5) M_SPEED)))

; SIGs ke -> SIGs
; control the the tank, fire missiles
(define (si-control s ke) 
  (cond
    [(and (= ke " ") (aim? s)) 
        (spawn-missle s)]
    [(and (= ke "left") (aim? s))
        (make-aim ...)]
    [(and (= ke "left") (fired? s))
        (make-fired ...)]
    [(and (= ke "right") (aim? s))
        (make-aim ...)]
    [(and (= ke "right") (fired? s))
        (make-fired ...)]))
; examples:

; AIMs -> FIREDs
; create the new SIGs that a missile is spawned
(define (spawn-missle s)
  (make-fired 
    (aim-ufo s)
    (aim-tank s)
    (make-posn 
      (tank-loc (aim-tank s))
      GROUND)))
; examples:
