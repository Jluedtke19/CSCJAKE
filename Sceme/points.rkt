#lang racket/gui

;filter


(define(coordinate)
  (/ (truncate(* (random) 100)) 100))
;multiplies random by 1000, cuts it off then divides

(define(point)
  (list (coordinate)(coordinate)))

(define (pointmakerlist count)
  (define( helper list counter)
    (if (equal? counter 0)
        list
        (helper (cons(point) list) (- counter 1))))
  (helper '() count))
       
(define points (pointmakerlist 100001))
(define p0 (car points))
(define p1 (car(cdr points)))
;(define (testpoint) (car (cdr(cdr (points)))))

(define (square x)
  (* x x))

(define testpoint1 '(0.52 0.84))
(define testpoint2 '(0.32 0.64))

(define (pointdistance point1 point2)
  (sqrt( + (square(- (car point1) (car point2))) (square(- (car (cdr point1)) (car (cdr point2))))))) 
  

(define (pointcompare point)
  (cond
    (( < (pointdistance p0 point) (pointdistance p1 point)) -1)
    (( > (pointdistance p0 point) (pointdistance p1 point)) 1)
    (else 0)))
      
(define (points-0 list)
  (helper0list list '()))
  
  
(define (helper0list randomlist returnlist)
    (if (null? randomlist)
        returnlist
        (if ( = -1 (pointcompare (car randomlist)))
          (helper0list (cdr randomlist) (cons (car randomlist) returnlist))
        (helper0list (cdr randomlist) returnlist))))



(define (points-1 list)
  (helper1list list '()))

(define (helper1list randomlist returnlist)
  (if (null? randomlist)
      returnlist
      (if ( = 1 (pointcompare (car randomlist)))
          (helper1list (cdr randomlist) (cons (car randomlist) returnlist))
      (helper1list (cdr randomlist) returnlist))))
          
        
           
              
(define pointsv-0 (points-0 points))
(define pointsv-1 (points-1 points))
;(define p0p (car points))
;(define p1p (car(cdr points)))

;; You may use different colors to distinguish
;; the elements of pointsv-0 from the elements of
;; pointsv-1.
(define dot-color-0 "yellow")
(define dot-color-1 "purple")

;; You may change the size of the picture.
(define picture-size 100)

;; You may change the size of the dots
;; that represent the points.
(define dot-radius 2)
(define dot-diameter (* 2 dot-radius))

;;;; DO NOT CHANGE ANY OF THE CODE BELOW HERE ;;;;

(define (get-x point) (car point))
(define (get-y point) (car (cdr point)))

(define (scale point factor)
  (list
   (exact->inexact (* (get-x point) factor))
   (exact->inexact (* (get-y point) factor))))

(define (make-scale-function divisor)
  (lambda (point) (scale point divisor)))

(define scale-function (make-scale-function picture-size))

(define scaled-pointsv-0 (map scale-function pointsv-0))
(define scaled-pointsv-1 (map scale-function pointsv-1))

;(define scaled-point-0 (map scale-function p0p))
;(define scaled-point-1 (map scale-function p1p))

(define (point-function point draw-function)
  (let ((cx (get-x point)) (cy (get-y point)))
    (draw-function (- cx dot-radius) (- cy dot-radius) dot-diameter)))

(define (draw-points list-of-points draw-function)
  (if (null? list-of-points)
      #f
      (begin
        (point-function (car list-of-points) draw-function)
        (draw-points (cdr list-of-points) draw-function))
      ))

(define (set-dot-color dc dot-color)
  (send dc set-brush dot-color 'solid))

(define (paint dc list-of-points)
  (draw-points
   list-of-points
   (lambda (ulx uly d) (send dc draw-ellipse ulx uly d d))))

(define (paint-colored-dots dc dot-color list-of-points)
  (begin
    (set-dot-color dc dot-color)
    (paint dc (map scale-function list-of-points))))
  
(define frame (new frame%
                   [label "Example"]
                   [width picture-size]
                   [height picture-size]))
(new canvas% [parent frame]
     [paint-callback
      (lambda (canvas dc)
        
        (paint-colored-dots dc dot-color-0 pointsv-0)
        
        (paint-colored-dots dc dot-color-1 pointsv-1)

        ;(paint-colored-dots dc dot-color-0 p0p)
        
        ;(paint-colored-dots dc dot-color-1 p1p)
        )])
(send frame show #t)


