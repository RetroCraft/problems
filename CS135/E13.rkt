;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname E13) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ***************************************************
;; James Ah Yong
;; CS 135 Fall 2020
;; Module 13 Exercises 
;; ***************************************************
;;

;;
;; Exercise 1
;;

;; (keep-inrange nums) returns only the nums within 10 and 30, inclusive
;; Example:
(check-expect (keep-inrange (list -5 10.1 12 7 30 3 19 6.5 42))
              (list 10.1 12 30 19))

;; keep-inrange: (listof Num) -> (listof Num)
(define (keep-inrange nums)
  (local [(define (range? x) (and (>= x 10) (<= x 30)))]
    (filter range? nums)))



;;
;; Exercise 2
;;

;; (keep-short lst) keeps all the values in lst of length at most 6.
;; Example:
(check-expect (keep-short (list "Strive" "not" "to" "be" "a" "success"
                                "but" "rather" "to" "be" "of" "value"))
              (list "Strive" "not" "to" "be" "a"
                    "but" "rather" "to" "be" "of" "value"))

;; keep-short: (listof Str) -> (listof Str)
(define (keep-short lst)
  (local [(define (short? s) (<= (string-length s) 6))]
    (filter short? lst)))



;;
;; Exercise 3
;;

;; (keep-multiples3 nums) keeps all multiples of 3
;; Example:
(check-expect (keep-multiples3 (list 1 2 3 4 5 6 7 8 9 10)) (list 3 6 9))

;; keep-multiples3: (listof Int) -> (listof Int)
(define (keep-multiples3 nums)
  (local [(define (3? x) (= (remainder x 3) 0))]
    (filter 3? nums)))



;;
;; Exercise 4
;;

;; (keep-multiples23 nums) keeps all multiples of either 2 or 3
;; Example:
(check-expect (keep-multiples23 (list 1 2 3 4 5 6 7 8 9 10))
              (list 2 3 4 6 8 9 10))

;; keep-multiples23: (listof Int) -> (listof Int)
(define (keep-multiples23 nums)
  (local [(define (2/3? x) (or (even? x) (= (remainder x 3) 0)))]
    (filter 2/3? nums)))



;;
;; Exercise 5
;;

;; (sum-odds-or-evens lst) returns the sum of even numbers in lst if there are
;;   more even numbers than odd numbers and the sum of the odd numbers otherwise
;; Examples:
(check-expect (sum-odds-or-evens (list 2 3 4 5 6)) 12)
(check-expect (sum-odds-or-evens (list 1 2 3 4 5)) 9)
(check-expect (sum-odds-or-evens (list 1 2 3 4 5 6)) 9)

;; sum-odds-or-evens: (listof Int) -> (listof Int)
(define (sum-odds-or-evens lst)
  (local [(define odds (filter odd? lst))
          (define evens (filter even? lst))
          (define (sum nums)
            (cond [(empty? nums) 0]
                  [else (+ (first nums) (sum (rest nums)))]))]
    (cond [(> (length evens) (length odds))
           (sum evens)]
          [else (sum odds)])))



;;
;; Exercise 6
;;

;; (make-divisible? n) produces a predicate function checking divisibility by n
;; Examples:
(check-expect (filter (make-divisible? 2) (list 0 1 2 3 4 5 6 7 8 9))
              (list 0 2 4 6 8))
(check-expect (filter (make-divisible? 3) (list 0 1 2 3 4 5 6 7 8 9))
              (list 0 3 6 9))
(check-expect (filter (make-divisible? 4) (list 0 1 2 3 4 5 6 7 8 9))
              (list 0 4 8))

;; make-divisible?: Int -> (Int -> Bool)
(define (make-divisible? n)
  (local [(define (divisible? x) (= 0 (remainder x n)))]
    divisible?))



;;
;; Exercise 8
;;

;; (isort pred? lst) sorts the elements of lst so that adjacent
;;   elements satisfy pred?
;; Examples:
(check-expect (isort < (list 3 4 2 5 1))
              (list 1 2 3 4 5))
(check-expect (isort > (list 3 4 2 5 1))
              (list 5 4 3 2 1))
(check-expect (isort string<? (list "can" "ban" "fan"))
              (list "ban" "can" "fan"))

;; isort: (X X -> Bool) (listof X) -> (listof X)
(define (isort pred? lst)
  (local [(define (insert elem lst)
            (cond [(empty? lst) (list elem)]
                  [(pred? elem (first lst)) (cons elem lst)]
                  [else (cons (first lst) (insert elem (rest lst)))]))]
    (cond [(empty? lst) empty]
          [else (insert (first lst) (isort pred? (rest lst)))])))



;;
;; Exercise 9 
;;

;; (create-checker f answers) creates a predicate which checks if an application
;;   to f produces a value in answers
;; Examples:
(check-expect ((create-checker string-length (list 0)) "") true)
(check-expect ((create-checker string-length (list 1 2 3)) "long") false)
(check-expect ((create-checker-v2 string-length (list 0)) "") true)
(check-expect ((create-checker-v2 string-length (list 1 2 3)) "long") false)
;; create-checker: (Str -> Num) (listof Num) -> (Str -> Bool)
(define (create-checker f answers) (λ (s) (member? (f s) answers)))
(define (create-checker-v2 f answers)
  (local [(define (checker s) (member? (f s) answers))] checker))



;;
;; Exercise 10
;;

(define-struct gnode (key children))
;; A GT (Generalized Tree) is a (make-gnode Nat (listof GT))

(define gt-ex1
  (make-gnode 78 (list (make-gnode 81 empty)
                       (make-gnode 66 empty)
                       (make-gnode 48 (list (make-gnode 37 empty)
                                            (make-gnode 12 empty)))
                       (make-gnode 11 empty))))
(define gt-ex2
  (make-gnode 78 (list (make-gnode 11 empty)
                       (make-gnode 48 (list (make-gnode 12 empty)
                                            (make-gnode 37 empty)))
                       (make-gnode 66 empty)
                       (make-gnode 81 empty))))

;; (tested-gt-sum pred? gt) sums the keys of gt which satisfy pred?
;; Examples:
(check-expect (tested-gt-sum odd? gt-ex1) 129)
(check-expect (tested-gt-sum odd? gt-ex2) 129)
;; tested-gt-sum: (Nat -> Bool) GT -> Nat
(define (tested-gt-sum pred? gt)
  (local [(define tested-key
            (cond [(pred? (gnode-key gt)) (gnode-key gt)] [else 0]))]
    (cond [(empty? (gnode-children gt)) tested-key]
          [else (foldr + tested-key (map (lambda (x) (tested-gt-sum pred? x))
                                         (gnode-children gt)))])))
