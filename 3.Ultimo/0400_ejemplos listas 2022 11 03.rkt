#lang racket

; SOLUCIÓN DEL PROBLEMA 1:
; Imprimir cada elemento de
; una lista, línea por línea:
(define (imprimeEltosL L)
 (if (not (empty? L))
     (begin
       (display (first L))
       (newline)
       (imprimeEltosL (rest L))
     )
     (newline)
  )
)


; SOLUCIÓN DEL PROBLEMA 2:
; Sumar todos los elementos de una lista:

;Versión 1:
(define (sumaEltosLista L)
  (sumaEltosL L 0)
)

(define (sumaEltosL L suma)
  (if (not (empty? L))
      (sumaEltosL (rest L) (+ suma (first L)))
      suma
  )
)


;Versión 2:
(define (sumaEltosLista2 L)
  (sumEltosL2 L 0)
)

(define (sumEltosL2 L suma)
  (if (not (empty? L))
      (+ (first L) (sumEltosL2 (rest L) suma))
      0
  )
)


; SOLUCIÓN DEL PROBLEMA 3:
; Invertir una lista:
(define (invertirLista L)
  (invLista L '())
)

(define (invLista L Linv)
  (if (not (empty? L))
      (invLista (rest L) (append (list (first L)) Linv))
      Linv
  )
)


; SOLUCIÓN DEL PROBLEMA 4:
; Dada una cadena, retornar la
; lista compuesta por los
; carácteres de la cadena:

;Versión 1:
(define (cad-lista cad)
  (c-l cad '())
)

(define (c-l cad L)
  (if (not (zero? (string-length cad)))
      (c-l (substring cad 1 (string-length cad)) (append L (list (string-ref cad 0))))
      L
   )
)


;Versión 2:
(define (c-l2 cad)
  (string->list cad)
)


; SOLUCIÓN DEL PROBLEMA 5:
; Dada una cadena, retornar la lista compuesta
; por los carácteres de la cadena, colocados
; en orden inverso:
;Versión 1:
(define (cad-lista-inv cad)
  (c-l-inv cad '())
)

(define (c-l-inv cad L)
  (if (not (zero? (string-length cad)))
      (c-l-inv (substring cad 1 (string-length cad)) (append (list (string-ref cad 0)) L))
      L
   )
)


;Versión 2:
(define (c-l-inv2 cad)
  (reverse (string->list cad))
)


; SOLUCIÓN DEL PROBLEMA 6:
; Construir una lista lineal a partir de
; tres listas, colocando los elementos de
; la misma posición, uno tras otro:

; Versión 1:
(define (hacer-lista A B C)
  (if (and (equal? (length A) (length B)) (equal? (length B) (length C)))
      (hacer-l-rec A B C '())
      (display "Las listas no son de la misma longitud")
  )
)


(define (hacer-l-rec A B C L)
  (if (not (empty? A))
      (hacer-l-rec (rest A) (rest B) (rest C) (append L (list (first A)) (list (first B)) (list (first C))))
      L
  )
)


; Versión 2:
(define (hacer-lista2 A B C)
  (if (and (equal? (length A) (length B)) (equal? (length B) (length C)))
      (hacer-l-rec2 A B C '())
      (display "Las listas no son de la misma longitud")
  )
)


(define (hacer-l-rec2 A B C L)
  (if (not (empty? A))
      (let-values
          (
           ((uno dos tres) (values (first A) (first B) (first C)))
          )
          (hacer-l-rec2 (rest A) (rest B) (rest C) (append L (list uno) (list dos) (list tres)))
      )
      L
  )
)


; SOLUCIÓN DEL PROBLEMA 7:
; Construir una lista de sublistas de
; tres elementos a partir de tres listas
; que se reciben como parámetro:

; Versión 1:
(define (hacer-lista-sublistas A B C)
  (if (and (equal? (length A) (length B)) (equal? (length B) (length C)))
      (hacer-l-sub-rec A B C '())
      (display "Las listas no son de la misma longitud")
  )
)


(define (hacer-l-sub-rec A B C L)
  (if (not (empty? A))
      (hacer-l-sub-rec
         (rest A)
         (rest B)
         (rest C)
         (append L (list (list (first A) (first B) (first C))))
      )
      L
  )
)


; Versión 2:
; UTILIZANDO LA FUNCIÓN MAP.
(define (hacer-lista-sublistas2 A B C)
  (if (and (equal? (length A) (length B)) (equal? (length B) (length C)))
      (map hacer-sublistita A B C)
      (display "Las listas no son de la misma longitud")
  )
)
  

(define (hacer-sublistita Elto1 Elto2 Elto3)
  (list Elto1 Elto2 Elto3)
)


; SOLUCIÓN DEL PROBLEMA 8:
; Calsificar los elementos de una lista
; en cuatro listas de: números, cadenas,
; símbolos y carácteres.

; Versión 1:
(define (clasificar L)
  (clasificar-rec L '() '() '() '())
)
  

(define (clasificar-rec L Num Cad Car Sim)
  (if (not (empty? L))
      (cond 
        ((number? (first L)) (clasificar-rec (rest L) (append Num (list(first L))) Cad Car Sim))
        ((string? (first L)) (clasificar-rec (rest L) Num (append Cad (list (first L))) Car Sim))
        ((char?   (first L)) (clasificar-rec (rest L) Num Cad (append Car (list (first L))) Sim))
        ((symbol? (first L)) (clasificar-rec (rest L) Num Cad Car (append Sim (list (first L)))))
      )
      (values Num Cad Car Sim)
  )
)


; Versión 2:
; UTILIZANDO LA FUNCIÓN FILTER.
(define (clasificar2 L)
  (values
    (filter number? L)
    (filter string? L)
    (filter char? L)
    (filter symbol? L)
  )
)



