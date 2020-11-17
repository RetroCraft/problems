;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname E15) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; James Ah Yong
;; CS 135 Fall 2020
;; Module 15 Exercises
;; ***************************************************
;;

;;
;; Exercise 1
;;

;; (ln-small x k) Taylor approximates ln(x) with order k
;; ln-small: Num Nat -> Num
;;   Requires: 0 < x <= 2
(define (ln-small x k) (cond [(= k 0) #i0]
                             [else (- (ln-small x (- k 1))
                                      (/ (expt (- 1 x) k) k))]))

(define ln2 (ln-small 2 20))

;; (ln x) approximates the natural logarithm of x
;;   by calculating ln(2) + ln(x/2)
;; Examples:
(check-within (ln e) 1 0.05)
(check-within (ln (sqr e)) 2 0.05)
;; ln: Num -> Num
(define (ln x) (cond [(<= x 2) (ln-small x 20)]
                     [else (+ ln2 (ln (/ x 2)))]))


;;
;; Exercise 2
;;

;; (mc91 n) produces the output of the McCarthy 91 function
;; Examples:
(check-expect (mc91 1) 91)
(check-expect (mc91 99) 91)
(check-expect (mc91 110) 100)
;; mc91: Nat -> Nat
(define (mc91 n) (cond [(> n 100) (- n 10)]
                       [else (mc91 (mc91 (+ n 11)))]))

#|
  (mc91 n) does in fact always terminate, since it is equivalent to
  M(n) =
    | n > 100: n - 10
    | n <= 100: 91
  which clearly terminates for any n.
|#


;;
;; Exercise 3
;;

;; (pfd n) produces the prime factorization of n
;; Examples:
(check-expect (pfd 1) empty)
(check-expect (pfd 2) (list 2))
(check-expect (pfd 24) (list 2 2 2 3))
(check-expect (pfd 42) (list 2 3 7))
;; pfd: Nat -> (listof Nat)
;;   Requires: n > 0
(define (pfd n)
  (local [;; (next-prime p) returns the next prime after p
          ;; next-prime: Nat -> Nat
          (define (next-prime p)
            (cond [(prime? (add1 p) 2) (add1 p)]
                  [else (next-prime (add1 p))]))
          ;; (prime? p) determines if p is not divisible by all between k and p
          ;; prime?: Nat -> Bool
          (define (prime? p k)
            (cond [(> k (sqrt p)) true]
                  [else (and (not (zero? (remainder p k)))
                             (prime? p (add1 k)))]))
          ;; (pfd-from p k) finds prime factors of k starting at p
          ;; pfd-from: Nat Nat -> (listof Nat)
          (define (pfd-from p k)
            (cond [(zero? (remainder k p)) (cons p (pfd (/ k p)))]
                  [else (pfd-from (next-prime p) k)]))]
    (cond [(= n 1) empty]
          [else (pfd-from 2 n)])))
