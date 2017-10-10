#lang racket

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
       
(define points (pointmakerlist 10))
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
          
        
           
               


