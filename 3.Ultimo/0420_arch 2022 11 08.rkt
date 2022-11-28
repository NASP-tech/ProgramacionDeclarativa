#lang racket

; Utilizar solamente las instrucciones
; de apertura y cierre:
(define (crear nombre)
  (define nombre-ext (string-append nombre ".txt"))
  (define archivo (open-output-file nombre-ext
                                    #:mode 'text
                                    #:exists 'replace))
  (close-output-port archivo)
)


; Leer desde teclado hasta
; introducir cero:
(define (leer-hasta-cero)
  ; Apertura:
  (define archivo (open-output-file "datos-de-teclado.txt"
                                    #:mode 'text
                                    #:exists 'replace))
  ; Procesamiento:
  (leer-hasta-cero-rec archivo)
  ; Cierre:
  (close-output-port archivo)
)


(define (leer-hasta-cero-rec flujo)
  (local
    (
      (define dato (read))
    )
    (if (not (zero? dato))
        (begin
          (display dato flujo)
          (newline flujo)
          (leer-hasta-cero-rec flujo)
        )
        (void)
    )
  )
)


; Leer el contenido de un archivo y
; mostrarlo en pantalla:
(define (mostrar-contenido nombre-archivo)
  ; Apertura:
  (define archivo (open-input-file nombre-archivo
                                    #:mode 'text))
  ; Procesamiento:
  (mostrar-contenido-rec archivo)
  ; Cierre:
  (close-input-port archivo)
)


(define (mostrar-contenido-rec flujo)
  (local
    (
      (define linea (read-line flujo 'any))
    )
    (if (eof-object? linea)
        (void)
        (begin
          (display linea)
          (newline)
          (mostrar-contenido-rec flujo)
        )
    )
  )
)



; Grabar el contenido de una
; lista en un archivo:
(define (procesarLista fh lista)
  (if (= 0 (length lista))
      (void)
      (begin
         (display (first lista) fh)
         (display " " fh)
         (procesarLista fh (rest lista))
        )
  )
)


(define (guardarLista lista nombre)
  (let
      (
       [fh (open-output-file nombre #:mode 'text #:exists 'replace)]
       )
    (procesarLista fh lista)
    (close-output-port fh)
    )
)


