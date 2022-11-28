#lang racket

; Programacion Declarativa 02/2022
; Ing. Guillermo Cortes y Jaime Serrano Seccion 2
; -> Natalia Alexandra Solorzano Paz 00120319
; -> Herson Alexander Reyes Rivas 00216519
; -> Dylan Moises Melendez Linares 00087018
; -> Alberto Enrique de Leon Quinonez 00087919


;EJERCICIO 1
;1. La Ecuación de la Circunferencia. Dada la coordenada del centro, 
;C(h,k), y un punto P(a,b), se desea construir la ecuación de la 
;circunferencia (x - h)^2 + (y - k)^2 = r^2, se solicita una función de 
;racket que ayude a construir dicha ecuación de la circunferencia. Por 
;ejemplo, sea ecCircunferencia la función a desarrollar y con C(2,1) y P(5,1):


     (define (circunferencia x y h k)
       (let*
        (
       (raizCuad(+(sqr(- x h))(sqr(- y k))))
         )
       (list '=(list '+ (list 'sqr (list '- x h)) (list 'sqr (list '- y k))) raizCuad)
       )
     )

;(circunferencia 2 1 5 1)
;'(= (+ (sqr (- 2 5)) (sqr (- 1 1))) 9)

;EJERCICIO 2
;2. La Ecuación de la Recta. Dados los puntos (x1, y1) y (x2, y2), elabore 
;una función que construya la ecuación de la recta, y = mx + b, que pasa 
;por ambos puntos. Recordar: m = y2-y1 / x2-x1. Por ejemplo, siendo P1(0,3) y  P2(-1.5, 0)

(define (ecRecta x1 y1 x2 y2)
  (let*
    (
     (m (/ (- y2 y1) (- x2 x1)))
     (b (- y1 (* m x1)))
     )
    (list '+ (list '* (eval m) 'x) (eval b))
    )
  )

;(ecuacionRecta 0 3 -1.5 0)
;'(+ (* 2.0 x) 3)