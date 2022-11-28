#lang racket
; '(x) = (quote x)
; (eval '(+ 5 3)) = 8

; Ejercicio Encontrar la derivada de un constante
; Debe devolver 0 para una constante
(define (derConst x expression)
  (if (number? expression)
      0
      (display "La expression no puede derivarse")
      )
  )
; Para Probarlo
; (derConst 'x 5)


; Ejercicio Encontrar la derivada de un x
; Debe devolver 1 para una x

(define (derVar x expression)
  (if (equal? expression x)
      1
      (display "La expression no puede derivarse")
      )
  )
; Para Probarlo
;(derVar 'x 'x)


; Ejercicio Encontrar la derivada de x multiplicada por una constante
; Debe devolver x*2 = 2

(define (derConstVar x expression)
  (if (equal? (first expression) '*)
      (if (and (number? (second expression)) (equal? (third expression) x))
          (second expression)
          (display "La expression no puede derivarse")
      )
      (display "La expression no puede derivarse")
  )
)
; Para Probarlo
;(derConstVar 'x '(* 5 x))


; Ejercicio Encontrar la derivada de x elevado a la n
; Debe devolver x^2 = 2*x^n-1

(define (derPot x expression)
  (if (equal? (first expression) 'expt)
      (if (and (number? (third expression)) (equal? x (second expression)))
          (list '*(third expression) (list 'expt x (sub1 (third expression))))
          (display "La expression no puede derivarse")
      )
      (display "La expression no puede derivarse")
  )
)
; Para Probarlo
;(derPot 'x '(expt x 7))


; Ejercicio Encontrar la derivada de x elevado a la n
; Debe devolver a^x = a^xln(a)

(define (derLn x expression)
  (if (equal? (first expression) 'expt)
      (if (and (number? (second expression)) (equal? x (third expression)))
          (list '* (list 'expt x (second expression)) (list 'log (second expression)))
          (display "La expression no puede derivarse")
      )
      (display "La expression no puede derivarse")
  )
)
; Para probarlo
; (derLn 'x '(expt 5 x ))

; Unir las soluciones anteriores y ramificar las derivadas

; Soluciones anteriores en una sola funcion

