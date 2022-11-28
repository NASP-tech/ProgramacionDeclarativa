#lang racket
; Programacion Declarativa 02/2022
; Ing. Guillermo Cortes y Jaime Serrano Seccion 2
; -> Natalia Alexandra Solorzano Paz 00120319
; -> Herson Alexander Reyes Rivas 00216519
; -> Alberto Enrique de Le�n Qui�onez 00087919
; -> Dylan Moises Melendez Linares 00087018


; EJERCICIO 1
;1. Dada una lista, que se recibe como argumento, retornar otra con los 
;datos en orden inverso. No utilice la función predefinida reverse.
(define (CodersList Cod)
  (CodersReverseList Cod '()))

(define (CodersReverseList Cod L)
  (if (not (zero? (string-length Cod)))
      (CodersReverseList (substring Cod 1 (string-length Cod)) (cons (string-ref Cod 0) L ))
      L
      ))
; Para probarlo
;(CodersList "Coders List")
;'(#\t #\s #\i #\L #\space #\s #\r #\e #\d #\o #\C)


; EJERCICIO 2
;2. Elabore una función que reciba tres listas de igual longitud y cree una 
;sola lista en la que cada elemento de ella es una sublista integrada por los 
;elementos de la misma posición de las tres listas proporcionadas. 
;Ejemplo: L1=[1,2,3], L2=[4,5,6], L3=[7,8,9], 
;LF=[[1,4,7],[2,5,8],[3,6,9]].


(define (CodersUnify LA LB LC)
  (if( and (equal? (length LA) (length LB)) (equal? (length LC) (length LB)))
     (CodersUnifyList LA LB LC '())
     (display "Las Listas deben tener la misma longitud")
     )
  )
(define (CodersUnifyList LA LB LC listaU)
  (if (> (length LA) 0)
      (CodersUnifyList (rest LA) (rest LB) (rest LC) (append listaU (list (first LA)) (list (first LB)) (list (first LC))))
      listaU
      )
  )

;(CodersUnify '("Natalia" "Alexandra" "Solorzano") '(20 21 22) '(Z Y X))
;'("Natalia" 20 Z "Alexandra" 21 Y "Solorzano" 22 X)

; EJERCICIO 3
; 3. Retornar la suma de todos los elementos de una lista
(define (CodersNumbers CodL)
  (if (empty? CodL) 0
      (+ (first CodL) (CodersNumbers (rest CodL))))
  )

; Para probarlos
;(CodersNumbers '(7 3 8 9 10))