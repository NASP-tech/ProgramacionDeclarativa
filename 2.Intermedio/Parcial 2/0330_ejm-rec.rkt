#lang racket

; Facorial:
(define (factorial n)
  (if (> n 1)
      (* n (factorial (- n 1)))
      1
  )
)


; Contar hasta 10:
(define (imprimirHasta10)
  (imprimeEntre 1 10))

(define (imprimeEntre i n)
  (if (<= i n)
      (begin
        (display i)
        ;(display "\n")
        (newline)
        (imprimeEntre (add1 i) n))
      (void)))


; Calcular y retornar la suma de los número del 1 al 10:
(define (sumar_1_a_10)
  (acumular 1 10))

(define (acumular i n)
  (if (< i n)
      (+ i (acumular (add1 i) n)) 
      n))


; Calcular y retornar la suma de los número del 1 a n:
(define (sumar_1_a_N N)
  (acumular 1 N))


; Calcular la suma de los números en el
; intervalo [a, b]:
(define (sumar_de_A_a_B A B)
  (acumular A B))


; Desplegar los divisores de un número entero positivo:
(define (mostrarDivisores N)
  (if (and (integer? N) (positive? N))
      (divisor N (quotient N 2))
      (display "El N introducido no es entero o positivo")))

(define (divisor N D)
  (if (>= D 2)
      (begin
        (if (equal? (remainder N D) 0)
            (begin
              (display D)
              (newline))
            (void))
        (divisor N (sub1 D)))
      (void)))


; Número perfecto:
(define (esPerfecto N)
  (if (and (integer? N) (positive? N))
      (if (equal? N (sumaDivisores N (quotient N 2)))
          #t
          #f)
      #f))


(define (sumaDivisores N D)
  (if (>= D 1)
      (begin
        (if (equal? (remainder N D) 0)
            (+ D (sumaDivisores N (sub1 D))) 
            (sumaDivisores N (sub1 D))))
      0))


