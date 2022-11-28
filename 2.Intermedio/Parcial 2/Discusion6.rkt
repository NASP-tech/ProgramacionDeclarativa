#lang racket
; Discusion 6
; Dado un entero que representa un anio, diga si es o no bisiesto.

(define (bisiesto numero)
  (if (and (= 0 (modulo numero 4)) (or (not (= 0 (modulo numero 100))) (= (modulo numero 400))))
      (display "El anio es bisiesto")
      (display "El anio no es bisiesto")
      )
  )

; Para probar (bisiesto 2022)

; Dados tres enteros positivos que representan los lados de un triangulo
; Indique si ese es equilatero, isosceles o escaleno

(define (triangulo n1 n2 n3)
  (cond
    ( (= n1 n2 n3) (display "Equilatero"))
    ( (or (= n1 n2) (= n1 n3) (= n2 n3))  (display "Isosceles"))
    ( (not(= n1 n2 n3)) (display "Escaleno"))
    )
  )

; Para probarlo (triangulo 1 1 1)

; Dado un numero positivo que representa el radio de una circunferencia,
; realice lo siguiente: a) si el radio es mayor que cero, calcular e indicar el
; area de la circunferencia, b) si el valor del radio es cero, indicar que se
; trata de un punto en el plano, pedir sus cordenadas e indicar la
; distancia del punto al origen.
(define (circunferencia r)
  (if (< 0 r)
      (begin
        (let ([area (* pi (expt r 2))]) (display area))
        ;(let ([identificar valor])
        )
      (begin
        (display "Es un punto")
        (let ([x1 (read)] [y1 (read)]) (display (sqrt (+ (expt x1 2) (expt y1 2)))))
        )
      )
  )





