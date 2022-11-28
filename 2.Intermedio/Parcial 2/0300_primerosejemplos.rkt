#lang racket

;Suma de dos números:
(define (suma a b)
  (+ a b)
)


; Recordar: las funciones solo devuelven el
; resultado del último cálculo realizado.
(define (ejemplo)
  (+ 3 5)
  (* 3 5)
  (/ 3 5)
)


; En este ejemplo de programación de la ecuación
; cuadrática, solo retorna el valor de una raíz.
(define (raizCuadratica a b c)
  (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
  (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
)


; Aquí resolvemos para la cuadrática, pero desplegando
; los valores de ambas raíces, no retornándolos.
(define (raizCuadratica2 a b c)
  (display (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a)))
  (display "\n")
  (display (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a)))
)


; En este ejemplo sí retornamos ambos valores,"dentro de una lista".
(define (raizCuadratica3 a b c)
  (list
   (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
   (/ (- (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a))
  )
)


;Longitud de una circunferencia:
(define (longitud-circunferencia r)
  ;(* 2 (* pi r))
  (* 2 pi r)
)


;Area de un triángulo rectángulo:
(define (area-triangulo base altura)
  (/ (* base altura) 2)
)


;Distancia entre dos puntos:
(define (distancia-dos-puntos x1 y1 x2 y2)
  (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1))))
)


;Cuadrado perfecto:
(define (cuadradoPerfecto n)
  (integer? (sqrt n))
)

;Problema 5a:
; Indicar si un valor entá en el intervalo (3, 7].
(define (problema5a x)
  (and (> x 3) (<= x 7))
)


;Problema 5b:
; Indicar si un valor entá en el intervalo [3, 7].
(define (problema5b x)
  (and (>= x 3) (<= x 7))
)

;Problema 5c:
; Indicar si un valor entá en el intervalo [3, 9).
(define (problema5c x)
  (and (> x 3) (< x 9))
)

;Problema 5d:
; Indicar si un valor entá entre (1, 3) ó (9, 11).
(define (problema5d x)
  (or (and (> x 1) (< x 3)) (and (> x 9) (< x 11)))
)


(define (pruebaif)
  (if 5
      7
      3))


(define (signoDeX x)
  (if (positive? x)
      (display "El número es positivo")
      (display "El número es negativo")))


(define (compararCon10 a b)
  (if (> (+ a b) 10)
      (display "La suma es mayor que 10")
      (display "La suma es menor que 10")))


(define (compararCon10v2 a b)
  (if (> (+ a b) 10)
      (display "La suma es mayor que 10")
      (if (< (+ a b) 10)
          (display "La suma es menor que 10")
          (display "La suma es igual a 10"))))


(define (comparar-suma2 a b)
  (if(< (+ a b) 10)
     (begin
       (display "La suma ")
       (display "es menor que 10")
     )
     (begin
       (display "La suma ")
       (display "es mayor que 10")
     )))


(define (comparacionCon10 a b)
  (cond
    ((< (+ a b) 10) (display "La suma es menor que diez"))
    ((> (+ a b) 10) (display "La suma es mayor que diez"))
    (else (display "La suma es igual a diez"))
  )
)


(define (diaSemana dia)
  (cond
    ((= dia 1) (display "El día es lunes"))
    ((= dia 2) (display "El día es martes"))
    ((= dia 3) (display "El día es miércoles"))
    ((= dia 4) (display "El día es jueves"))
    ((= dia 5) (display "El día es viernes"))
    ((= dia 6) (display "El día es sábado"))
    ((= dia 7) (display "El día es domingo"))
    (else (display "Número de día no válido"))
  )
)


(define (leerValor)
  (read)
)



(define (mostrarValorLeido a)
  (display "El valor leído es: ")
  (display a)
)


(define (hacer-funcion funcion x)
  (funcion x))


(define (hacer-función2 función x y)
  (función x y)
)