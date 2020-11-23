;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname E16) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; ***************************************************
;; James Ah Yong
;; CS 135 Fall 2020
;; Module 16 Exercises 
;; ***************************************************
;;

;; A Node is a Sym

;; A Graph is one of:
;;   * empty
;;   * (cons (list v (list w_1 ... w_n)) g)
;;     where g is a Graph
;;           v, w_1, ... w_n are Nodes
;;           v is the in-neighbour to w_1 ... w_n in the Graph
;;           v does not appear as an in-neighbour in g



;;
;; Exercise 1
;;

;; (count-out-neighbours g) counts how many out-neighbours each node in g has
;; Example:
(check-expect (count-out-neighbours g) '(3 2 0 2 1 2 0 1 0))
;; count-out-neighbours: Graph -> (listof Nat)
(define (count-out-neighbours g)
  (map (lambda (n) (length (second n))) g))



;;
;; Exercise 2
;;

;; (count-in-neighbours g) counts how many in-neighbours each node in g has
;; Example:
(check-expect (count-in-neighbours g) '(0 0 1 1 2 1 2 2 2))
;; count-in-neighbours: Graph -> (listof Nat)
(define (count-in-neighbours g)
  (map (lambda (n)
         (length (filter (lambda (node) (member? (first n) (second node))) g)))
       g))



;;
;; Testing constants
;;

(define g
  '((A (C D E))
    (B (E J))
    (C ())
    (D (F J))
    (E (K))
    (F (K H))
    (H ())
    (J (H))
    (K ()))
  )
