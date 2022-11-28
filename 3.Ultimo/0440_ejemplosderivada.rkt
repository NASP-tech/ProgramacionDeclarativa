#lang racket

; a) Derivada de una constante:
(define (dK x expresion)
  (if (number? expresion)
    0
    (display "No se puede resolver para esta expresión")
  )
)
;(dK 'x 5)
;0

;------------

; b) Derivada de x respecto a x:
(define (dX x expresion)
  (if (equal? expresion x)
    1
    (display "No se puede resolver para esta expresión")
  )
)

;(dX 'x 'x)
;1

;------------

; c) Derivada de una constante por x:
(define (dKX x expresion)
  (if (equal? (first expresion) '*)
    (if (and (number? (second expresion)) (equal? (third expresion) 'x))
      (second expresion)
      (display "No se puede resolver para esta expresión")
    )
    (display "No se puede resolver para esta expresión")
  )
)

;(dKX 'x '(* 7 x))
;7

;------------


; d) Derivada de x a la n:
(define (dXN x expresion)
  (if (equal? (first expresion) 'expt)
    (if (and (equal? (second expresion) 'x) (number? (third expresion)))
      (list '* (third expresion) (list 'expt 'x (sub1 (third expresion))))
      (display "No aplica")
    )
    (display "No se puede resolver para esta expresión")
  )
)

;(dXN 'x '(expt x 5))
;'(* 5 (expt x 4))

;------------

; e) Derivada de a a la x:
(define (dAX x expresion)
  (if (equal? (first expresion) 'expt)
    (if (and (number? (second expresion)) (equal? (third expresion) 'x))
      (list '* (list 'expt (second expresion) 'x) (list 'log (second expresion)))
      (display "No se puede resolver para esta expresión")
    )
    (display "No se puede resolver para esta expresión")
  )
)

;(dAX 'x '(expt 5 x))
;'(* (expt 5 x) (log 5))

;------------


; Una sola función de derivada:
(define (derivada x expresion)
  (cond
    ; Derivada de una constante:
    ((number? expresion) 0)
    ; Derivada de la variable respecto a sí misma:
    ((equal? expresion x) 1)
    (else
     (let
         (
          (u (second expresion))
          (v (third expresion))
          )
       (case (first expresion)
         ((expt)
          (cond
            ; x elevada a un exponente numérico:
            ((and (equal? u x) (number? v)) (list '* v (list 'expt u (sub1 v))))
            ; Una función elevada a otra función:
            ((and (list u) (list v)) (list '* (list 'expt u v) (list '+ (list '* (derivada x v) (list 'log u)) (list '/ (list '* v (derivada x u)) u))))
            ; Un número elevado a una función:
            ((and (number? u) (list? v)) ((* (expt u v) (log u) (derivada x v))))
            ; Un número elevado a otro número:
            ((and (number? u) (number? v)) 0)
          )
         )
         ((*)
            (cond
              ; Una constante por x:
              ((and (number? u) (equal? v x)) u)
              ; Una constante por una función:
              ((and (number? u) (list? v)) (list '* u (derivada x v)))
              ; El producto de dos funciones:
              ((and (list? u) (list v)) (list '+ (list '* u (derivada x v)) (list '* v (derivada x u))))
            )
         )
       )
     )
    )
  )
)

;(derivada 'x '(expt (* x 5) 4))
;'(* (expt (* x 5) 4) (+ (* 0 (log (* x 5))) (/ (* 4 #<void>) (* x 5))))

;------------

; Convergencia a la raíz de una función
; por el método de Newton-Raphson:

(define (f)
  (list 'expt 'x 2)
)
;(f)
;'(expt x 2)

(define (convergencia)
  (eval '(- x (/ (eval (f)) (eval (derivada 'x (f))))))
)


; Elaborar una función que aplique recursivamente
; el método de Newton-Raphson para converger
; a la raíz de una función:


