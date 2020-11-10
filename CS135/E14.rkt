;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname E14) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ***************************************************
;; James Ah Yong
;; CS 135 Fall 2020
;; Module 14 Exercises
;; ***************************************************
;;

;;
;; Exercise 1
;;

;; (keep4 lst) finds strings in a list of strings, lst, with length 4
;; Example:
(check-expect
 (keep4 '("There's" "no" "fate" "but" "what" "we" "make" "for" "ourselves"))
 '("fate" "what" "make"))
;; keep4: (listof Str) -> (listof Str)
(define (keep4 lst)
  (filter (lambda (str) (= (string-length str) 4)) lst))


;;
;; Exercise 2
;;

;; (squash-range nums) converts a list of nums from [0,255] to [0,1]
;; Example:
(check-expect (squash-range '(0 204 255)) '(0 0.8 1))
;; squash-range: (listof Num) -> (listof Num)
;;   Requires: every number is between 0 and 1, inclusive
(define (squash-range nums)
  (map (lambda (n) (/ n 255)) nums))


;;
;; Exercise 3
;;

;; (greet-each names) produces a greeting for every name in a list of names
;; Example:
(check-expect (greet-each '("Ali" "Carlos" "Sai"))
              '("Hi Ali!" "Hi Carlos!" "Hi Sai!"))
;; greet-each: (listof Str) -> (listof Str)
(define (greet-each names)
  (map (lambda (name) (string-append "Hi " name "!")) names))

;; (neg-odd nums) negates all odd numbers in nums, leaving the rest as-is
;; Example:
(check-expect (neg-odd '(2 5 8 11 14 17)) '(2 -5 8 -11 14 -17))
;; neg-odd: (listof Int) -> (listof Int)
(define (neg-odd nums)
  (map (lambda (n) (cond [(odd? n) (- n)]
                         [else     n]))
       nums))


;;
;; Exercise 4
;;

;; (count-odd nums) counts odd numbers in nums
;; Example:
(check-expect (count-odd '(2 5 8 11 14 17)) 3)
;; count-odd: (listof Nat) -> Nat
(define (count-odd nums)
  (foldr (lambda (x count) (+ count (remainder x 2))) 0 nums))
;; Alternative solutions:
(check-expect (count-odd/filter '(2 5 8 11 14 17)) 3)
(define (count-odd/filter nums)
  (length (filter odd? nums)))
(check-expect (count-odd/map '(2 5 8 11 14 17)) 3)
(define (count-odd/map nums)
  (foldr + 0 (map (lambda (x) (remainder x 2)) nums)))


;; (prod nums) produces the product of a list of nums
;; Example:
(check-expect (prod '(2 2 3 5)) 60)
;; prod: (listof Num) -> Num
(define (prod nums) (foldr * 1 nums))

;; (total-length lst) produces the total number of elements
;;   in a nested list, lst
;; Example:
(check-expect (total-length '((1 2 3) (4 5) (1 1 1))) 8)
;; total-length: (nested-listof Any) -> Nat
(define (total-length lst)
  (foldr (lambda (l rror) (+ rror (length l))) 0 lst))
;; Alternative solution:
(check-expect (total-length/foldr '((1 2 3) (4 5) (1 1 1))) 8)
(define (total-length/foldr lst)
  (foldr (lambda (l rror) (+ rror (foldr (lambda (x len) (add1 len)) 0 l)))
         0 lst))


;;
;; Exercise 5
;;

;; (average nums) takes the geometric mean of nums
;; Examples:
(check-expect (average '(2 4 9)) 5)
(check-expect (average '(4 5 6 6)) 5.25)
;; average: (listof Num) -> Num
;;   Requires: nums is not empty
(define (average nums)
  (/ (foldr + 0 nums) (length nums)))

;; (times-square nums) produces the product of all perfect squares in nums
;; Example:
(check-expect (times-square '(1 25 5 4 1 17)) 100)
;; times-square: (listof Nat) -> Nat
(define (times-square nums)
  (foldr * 1 (filter (lambda (x) (integer? (sqrt x))) nums)))


;;
;; Exercise 6
;;

(define (double n) (* n 2))

;; (double-each lst) doubles each element in a list
;; Example:
(check-expect (double-each '(1 2 3 4)) '(2 4 6 8))
;; double-each: (listof Num) -> (listof Num)
(define (double-each lst)
  (foldr (lambda (n lst) (cons (double n) lst)) empty lst))

;; (keep-evens lst) filters out only even elements of lst
;; Example:
(check-expect (keep-evens '(1 2 3 4 5 6)) '(2 4 6))
;; keep-evens: (listof Int) -> (listof Int)
(define (keep-evens lst)
  (foldr (lambda (n lst) (cond [(even? n) (cons n lst)] [else lst])) empty lst))

;; (sum-evens lst) sums all the even elements of lst
;; Example:
(check-expect (sum-evens (list 2 3 4 5)) 6)
;; sum-evens: (listof Int) -> Int
(define (sum-evens lst) (foldr + 0 (filter even? lst)))
;; Alternative solution:
(check-expect (sum-evens/no-filter (list 2 3 4 5)) 6)
(define (sum-evens/no-filter lst)
  (foldr (lambda (n sum) (cond [(even? n) (+ n sum)] [else sum])) 0 lst))


;;
;; Exercise 7
;;

;; (multiply-each lst n) multiplies each element in lst by n
;; Example:
(check-expect (multiply-each (list 2 3 5) 4) (list 8 12 20))
;; multiply-each: (listof Num) Num -> (listof Num)
(define (multiply-each lst n)
  (map (lambda (x) (* n x)) lst))

;; (add-total lst) adds the total sum of lst to each element of lst
;; Example:
(check-expect (add-total (list 2 3 5 10)) (list 22 23 25 30))
;; add-total: (listof Num) -> (listof Num)
(define (add-total lst)
  (local [(define total (foldr + 0 lst))]
    (map (lambda (n) (+ n total)) lst)))

;; (discard-bad lst lo hi) finds elements of lst between lo and hi, inclusive
;; Example:
(check-expect (discard-bad '(12 5 20 2 10 22) 10 20) '(12 20 10))
;; discard-bad: (listof Num) Num Num -> (listof Num)
(define (discard-bad lst lo hi)
  (filter (lambda (n) (and (>= n lo) (<= n hi))) lst))


;;
;; Exercise 8
;;

;; (squash-bad lo hi lst) clamps elements of lst to a max of hi and min of lo
;; Example:
(check-expect (squash-bad 10 20 '(12 5 20 2 10 22)) '(12 10 20 10 10 20))
;; squash-bad: Num Num (listof Num)
(define (squash-bad lo hi lst)
  (map (lambda (n) (cond [(< n lo) lo] [(> n hi) hi] [else n])) lst))

;; (above-average lst) finds values above in lst above the average of lst
;; Example:
(check-expect (above-average '(1 2 3 4 5 200 201)) '(200 201))
;; above-average: (listof Num) -> (listof Num)
(define (above-average lst)
  (local [(define avg (/ (foldr + 0 lst) (length lst)))]
    (filter (lambda (n) (>= n avg)) lst)))


;;
;; Exercise 10
;;

;; (triangles k) gives the first k triangular numbers
;; Example:
(check-expect (triangles 4) (list 0 1 3 6))
;; triangles: Nat -> (listof Nat)
(define (triangles n)
  (build-list n (lambda (x) (/ (* x (add1 x)) 2))))
