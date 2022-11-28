#lang racket

(define (longcirc r)
   ;(*(* 2 pi) r)
   (* 2 pi r)
  ;solo devuelve lo ultimo que esta
   ;(+ 5 3)
)

(define (dist2puntos x1 y1 x2 y2)
   (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1))) )
)