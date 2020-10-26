;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname E12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ***************************************************
;; James Ah Yong
;; CS 135 Fall 2020
;; Module 12 Exercises
;; ***************************************************
;;

;;
;; Exercise 1
;;

;; (check-msg-length to from body min-len max-len) checks if a message
;;   payload of to, from, and body is outside the bounds of min-len and max-len
;; Examples:
(check-expect (check-msg-length "Ed" "Santa" "Xmas List" 3 14) 'too-long)
(check-expect (check-msg-length "Ed" "Santa" "Xmas List" 3 140) 16)
(check-expect (check-msg-length "Charlie" "Santa" "No presents for Ed!"
                                140 280) 'too-short)
;; check-msg-length: Str Str Str Nat Nat -> (anyof Nat Sym)
(define (check-msg-length to from body min-len max-len)
  (local [(define len (string-length (string-append to from body)))]
    (cond [(> len max-len) 'too-long]
          [(< len min-len) 'too-short]
          [else            len])))
;; Unoptimal solution
#|(define (check-msg-length to from body min-len max-len)
  (cond [(> (string-length (string-append to from body)) max-len)
         'too-long]
        [(< (string-length (string-append to from body)) min-len)
         'too-short]
        [else (string-length (string-append to from body))]))|#



;;
;; Exercise 2
;;

;; (normalize lst) divides each value in lst by the sum of all values
;; Examples:
(check-expect (normalize empty) empty)
(check-expect (normalize '(4 2 14)) '(0.2 0.1 0.7))
;; normalize: (listof Num) -> (listof Num)
(define (normalize lst)
  (local [(define (sum lst)
            (cond [(empty? lst) 0]
                  [else (+ (first lst) (sum (rest lst)))]))
          (define (list/ lst k)
            (cond [(empty? lst) empty]
                  [else (cons (/ (first lst) k) (list/ (rest lst) k))]))]
    (list/ lst (sum lst))))



;;
;; Exercise 3
;;

;; (list-squares n) produces the squares of the first n natural numbers
;; Example:
(check-expect (list-squares 4) '(0 1 4 9))
;; list-squares: Nat -> (listof Nat)
(define (list-squares n)
  (local [(define (squares k)
            (cond [(>= k n) empty]
                  [else (cons (sqr k) (squares (add1 k)))]))]
    (squares 0)))



;;
;; Exercise 4
;;

;; (mult-table3 nr nc) produces a multiplication table with nr rows and nc cols
;; Example:
(check-expect (mult-table3 3 4)
              (list (list 0 0 0 0)
                    (list 0 1 2 3)
                    (list 0 2 4 6)))
;; mult-table3: Nat Nat -> (listof (listof Nat))
(define (mult-table3 nr nc)
  (local [(define (rows-to r)
            (local [(define (cols-to c)
                      (cond [(>= c nc) empty]
                            [else (cons (* r c) (cols-to (add1 c)))]))]
              (cond [(>= r nr) empty]
                    [else (cons (cols-to 0) (rows-to (add1 r)))])))]
    (rows-to 0)))



;;
;; Exercise 5
;;

;; (table-ccy nr nc) produces a (nr)x(nc) table where each element is c^2*r
;; Example:
(check-expect (table-ccr 4 5)
              (list (list 0 0 0 0 0)
                    (list 0 1 4 9 16)
                    (list 0 2 8 18 32)
                    (list 0 3 12 27 48)))
;; table-ccy: Nat Nat -> (listof (listof Nat))
(define (table-ccr nr nc)
  (local [(define (rows-to r)
            (local [(define (cols-to c)
                      (cond [(>= c nc) empty]
                            [else (cons (* r c c) (cols-to (add1 c)))]))]
              (cond [(>= r nr) empty]
                    [else (cons (cols-to 0) (rows-to (add1 r)))])))]
    (rows-to 0)))
