#lang racket

(define x 99)
(define y '(2 3))
(define z 101)
(define (twice z) (+ z z))
;((lambda (a) (+ a a a)) 16)
(define f (lambda (b) (* b b)))
;(if (equal? x y)
;    "numbers are equal"
;    "numbers aren't equal")
;(if (equal? x y)
;    (+ 2 3)
;    (* 3 5))
;(if (= x z)
;    "numbers are equal"
;    "numbers aren't equal")
(define (g x)
  (cond
    ((and ( > x 0) ( < x 18))"help")
     ((and ( >= x 18) ( < x 22)) "help help")
      (( (>= x 22) ( < x 45))"hep")
      (#t "if not true for these")))

;Homework

;; Write code that extracts the first element
;; of a list.
(car '(3 5 2))
;; Write code that extracts the second element
;; of a list.
(car ( cdr'(3 5 2)))
;; Write your own version of the length function.
;; When you are done, remove the comment symbol
;; from the next line of code---see that you get
;; the same result twice.
;; (my-length '(a b c d e f g h))

(define (my-length list)
  (define (counter list count)
    (if (null? list)
        count
        (counter (cdr list) (+ count 1))))
  (counter list 0))

(my-length '(a b c d e f g h))
(length '(a b c d e f g h))

;; Write your own version of the reverse function.
;; When you are done, remove the comment symbol
;; from the next line of code---see that you get
;; the same result twice.

(define (my-reverse list)
  (define (helper list list2)
    (if (null? list)
      list2
      (helper (cdr list) (cons(car list) list2))))
  (helper list '()))

(my-reverse '(a b c d e f g h))  
(reverse '(a b c d e f g h))

;; Write your own version of the append function.
;; When you are done, remove the comment symbol
;; from the next line of code---see that you get
;; the same result twice.

(append '(a b c d) '(e f g h))

(define (my-append list1 list2)
  (define (helpera list1 list2 rlist)
    (if(null? list1)
       (if(null? list2)
          (my-reverse rlist)
        (helpera list1 (cdr list2) (cons(car list2) rlist)))
  (helpera (cdr list1) list2 (cons(car list1) rlist))))
  (helpera list1 list2 '()))


        
  
 (my-append '(a b c d) '(e f g h))
    
        
    
;; Study the code below.
;; * What is the algorithm for finding the
;;   value of the smallest number in a list
;;   of numbers?
;; * What are some of the features of Scheme
;;   that you are seeing here for the first time?
(define (my-minimum-helper best-guess-so-far some-list)
  (cond
    ((null? some-list) best-guess-so-far)
    ((<= best-guess-so-far (car some-list))
     (my-minimum-helper best-guess-so-far (cdr some-list)))
    ((< (car some-list) best-guess-so-far)
     (my-minimum-helper (car some-list) (cdr some-list)))))

(define (my-minimum some-list)
  (my-minimum-helper (car some-list) (cdr some-list)))

(define (my-extrema-helper comparator best-guess-so-far some-list)
  (if (null? some-list)
      best-guess-so-far
      (if (comparator best-guess-so-far (car some-list))
          (my-extrema-helper comparator best-guess-so-far (cdr some-list))
          (my-extrema-helper comparator (car some-list) (cdr some-list)))))

(define (my-extrema comparator some-list)
  (my-extrema-helper comparator (car some-list) (cdr some-list)))

(define another-min (lambda (some-list) (my-extrema < some-list)))
(define another-max (lambda (some-list) (my-extrema > some-list)))

(define some-primes '(31 29 43 47 11 17 19))
(my-minimum some-primes)
(my-extrema < some-primes)
(my-extrema > some-primes)
(another-min some-primes)

           