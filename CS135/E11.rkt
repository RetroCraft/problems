;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname E11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ***************************************************
;; James Ah Yong
;; CS 135 Fall 2020
;; Module 11 Exercises 
;; ***************************************************
;;


;;
;; Exercise 1
;;

(define-struct node (key left right))
;; A Node is a (make-node Nat BT BT)

;; A binary tree (BT) is one of:
;; * empty
;; * Node

(define test-tree (make-node 5 (make-node 1 (make-node 3 '() '())
                                          (make-node 6 '() '()))
                             (make-node 1 (make-node 1 (make-node 4 '() '())
                                                     (make-node 6 '() '()))
                                        (make-node 3 '() '()))))

;; (count-leaves t) takes a binary tree t and produces the number of leaf nodes
;; Examples:
(check-expect (count-leaves empty) 0)
(check-expect (count-leaves test-tree) 5)
;; count-leaves: BT -> Nat
(define (count-leaves t)
  (cond [(empty? t) 0]
        [(and (empty? (node-left t)) (empty? (node-right t))) 1]
        [else (+ (count-leaves (node-left t))
                 (count-leaves (node-right t)))]))

;; (count-evens t) counts the number of nodes with even keys on a binary tree t
;; Examples:
(check-expect (count-evens empty) 0)
(check-expect (count-evens test-tree) 3)
;; count-evens: BT -> Nat
(define (count-evens t)
  (cond [(empty? t) 0]
        [else (+ (cond [(even? (node-key t)) 1] [else 0])
                 (count-evens (node-left t))
                 (count-evens (node-right t)))]))

;; (reverse-tree t) swaps all left and right subtrees of a binary tree t
;; Examples:
(check-expect (reverse-tree empty) empty)
(check-expect
 (reverse-tree (make-node 1 (make-node 2 '() '()) (make-node 3 '() '())))
 (make-node 1 (make-node 3 '() '()) (make-node 2 '() '())))
;; reverse-tree: BT -> BT
(define (reverse-tree t)
  (cond [(empty? t) empty]
        [else (make-node (node-key t)
                         (reverse-tree (node-right t))
                         (reverse-tree (node-left t)))]))



;;
;; Exercise 2
;;

;; (contains? tree k) checks if a binary tree contains a key k
;; Examples:
(check-expect (contains? empty 2) false)
(check-expect (contains? test-tree 4) true)
;; contains: BT Nat -> Bool
(define (contains? tree k)
  (and (node? tree)
       (or (= k (node-key tree))
           (contains? (node-left tree) k)
           (contains? (node-right tree) k))))



;;
;; Exercise 3
;;

;; A Binary Search Tree (BST) is one of:
;; * empty
;; * a BNode

;; A BNode is a (make-node Nat BST BST)
;;   Requires: key > every key in left
;;             key < every key in right

(define test-bst (make-node 5 (make-node 1 (make-node 0 '() '())
                                         (make-node 3 '() '()))
                            (make-node 6 '() (make-node 14 '() '()))))

;; (count-smaller n t) counts the number of keys less than n in a BST t
;; Examples:
(check-expect (count-smaller 0 test-bst) 0)
(check-expect (count-smaller 8 test-bst) 5)
(check-expect (count-smaller 100 test-bst) 6)
;; count-smaller: Nat BST -> Nat
(define (count-smaller n t)
  (cond [(empty? t)          0]
        [(>= (node-key t) n) (count-smaller n (node-left t))]
        [(< (node-key t) n)  (+ 1 (count-smaller n (node-left t))
                                (count-smaller n (node-right t)))]))
;; Tests:
(check-expect (count-smaller 1 empty) 0)



;;
;; Exercise 4
;;

;; (bst-min t) finds the smallest value in a non-empty BST
;; Examples:
(check-expect (bst-min (make-node 6 '() '())) 6)
(check-expect (bst-min test-bst) 0)
;; bst-min: BST -> Nat
;;   Requires: t is not empty
(define (bst-min t)
  (cond [(empty? (node-left t)) (node-key t)]
        [else    (bst-min (node-left t))]))

;; (bst-max t) finds the largest value in a non-empty BST
;; Examples:
(check-expect (bst-max (make-node 6 '() '())) 6)
(check-expect (bst-max test-bst) 14)
;; bst-max: BST -> Nat
;;   Requires: t is not empty
(define (bst-max t)
  (cond [(empty? (node-right t)) (node-key t)]
        [else    (bst-max (node-right t))]))

;; (bst-add n t) adds the key n to the BST t
;; Examples:
(check-expect (bst-add 1 (make-node 2 '() '()))
              (make-node 2 (make-node 1 '() '()) '()))
(check-expect (bst-add 3 empty) (make-node 3 '() '()))
(check-expect (bst-add 3 (make-node 3 '() '())) (make-node 3 '() '()))
(check-expect (bst-add 4 (make-node 2 '() '()))
              (make-node 2 '() (make-node 4 '() '())))
;; bst-add: BST Nat -> BST
(define (bst-add n t)
  (cond [(empty? t)         (make-node n '() '())]
        [(= n (node-key t)) t]
        [(< n (node-key t)) (make-node (node-key t)
                                       (bst-add n (node-left t))
                                       (node-right t))]
        [else               (make-node (node-key t)
                                       (node-left t)
                                       (bst-add n (node-right t)))]))

;; (bst-from-list nums) converts a list of nums into a BST
;; Examples:
(check-expect (bst-from-list empty) empty)
(check-expect (bst-from-list '(3 1 3)) (make-node 3 (make-node 1 '() '()) '()))
;; bst-from-list: (listof Nat) -> BST
(define (bst-from-list nums)
  (cond [(empty? nums) empty]
        [else (bst-add (first nums)
                       (bst-from-list (rest nums)))]))

;; (bst-from-list/acc nums t) adds a list of nums to a BST
;; Examples:
(check-expect (bst-from-list/acc empty empty) empty)
(check-expect (bst-from-list/acc '(3 1 3) empty)
              (make-node 3 (make-node 1 '() '()) '()))
;; bst-from-list/acc: (listof Nat) BST -> BST
(define (bst-from-list/acc nums t)
  (cond [(empty? nums) t]
        [else (bst-from-list/acc (rest nums)
                                 (bst-add (first nums) t))]))

;; (search-bst n t) checks for the existance of a node with key n in t
;; Examples:
(check-expect (search-bst 0 empty) false)
(check-expect (search-bst 3 test-bst) true)
(check-expect (search-bst 123 test-bst) false)
;; search-bst: Nat BST -> Bool
(define (search-bst n t)
  (and (node? t)
       (or (= n (node-key t))
           (and (< n (node-key t))
                (search-bst n (node-left t)))
           (and (> n (node-key t))
                (search-bst n (node-right t))))))



;;
;; Exercise 5 (Practice problems with EvoTrees)
;;

;; An EvoTree (Evolutionary Tree) is one of:
;; * a Current (current species)
;; * an Ancestor (common ancestor species)

(define-struct current (name endangered))
;; A Current is a (make-current Str Bool)

(define-struct ancestor (name age left right))
;; An Ancestor is a (make-ancestor Str Num EvoTree EvoTree)

(define human (make-current "human" false))
(define chimp (make-current "chimp" true))
(define rat (make-current "rat" false))
(define crane (make-current "crane" true))
(define chicken (make-current "chicken" false))
(define worm (make-current "worm" false))
(define fruit-fly (make-current "fruit fly" false))
(define e-primates (make-ancestor "early primates" 5 human chimp))
(define e-mammals (make-ancestor "early mammals" 65 e-primates rat))
(define e-birds (make-ancestor "early birds" 100 crane chicken))
(define e-vertebrates
  (make-ancestor "early vertibrates" 320 e-mammals e-birds))
(define e-invertebrates
  (make-ancestor "early invertibrates" 530 worm fruit-fly))
(define mco
  (make-ancestor "multi-celled organisms" 535 e-vertebrates e-invertebrates))

;; (count-older n t) counts the number species older than n million years in t
;; Examples:
(check-expect (count-older 200 mco) 3)
(check-expect (count-older 50 mco) 5)
;; count-older: Nat EvoTree -> Nat
(define (count-older n t)
  (cond [(current? t) 0]
        [(> (ancestor-age t) n)
         (+ 1 (count-older n (ancestor-left t))
            (count-older n (ancestor-right t)))]
        [else 0]))

;; (common sp t) counts the common ancestors of a current species, sp, in t
;; Examples:
(check-expect (common "human" mco) 4)
(check-expect (common "worm" mco) 2)
;; common: Str EvoTree -> (anyof false Nat)
(define (common sp t)
  (cond [(ancestor? t)
         (common/path (common sp (ancestor-left t))
                      (common sp (ancestor-right t)))]
        [(string=? sp (current-name t)) 0]
        [else false]))

;; (common/path left right) advances the left/right depth of a tree by 1
;; common/path: (anyof false Nat) (anyof false Nat) -> (anyof false Nat)
(define (common/path left right)
  (cond [(number? left) (add1 left)]
        [(number? right) (add1 right)]
        [else false]))

;; (path sp t) finds the path taken from the root of t to a species sp
;; Examples:
(check-expect
 (path "rat" mco)
 '("multi-celled organisms" "early vertibrates" "early mammals" "rat"))
(check-expect
 (path "human" e-mammals) '("early mammals" "early primates" "human"))
;; path: Str EvoTree -> (anyof false (listof Str))
(define (path sp t)
  (cond [(ancestor? t)
         (path/path (ancestor-name t)
                    (path sp (ancestor-left t))
                    (path sp (ancestor-right t)))]
        [(string=? sp (current-name t))
         (list (current-name t))]
        [else false]))

;; (path/path name left right) advances the left/right depth after name root
;; path/path: (anyof false (listof Str)) (anyof false (listof Str))
;;              -> (anyof false (listof Str))
(define (path/path name left right)
  (cond [(list? left) (cons name left)]
        [(list? right) (cons name right)]
        [else false]))

;; (list-endangered t) lists endangered species in t
;; Example:
(check-expect (list-endangered mco) '("chimp" "crane"))
;; list-endangered: EvoTree -> (listof Str)
(define (list-endangered t)
  (cond [(ancestor? t)
         (append (list-endangered (ancestor-left t))
                 (list-endangered (ancestor-right t)))]
        [(current-endangered t) (list (current-name t))]
        [else empty]))



;;
;; Exercise 6
;;

;; A nested list (nested-listof X) is one of:
;; * empty
;; * (cons (nested-listof X) (nested-listof X))
;; * (cons X (nested-listof X))

;; (nest-lst-sum nums) produces the sum of a nested list of nums
;; Examples:
(check-expect (nest-lst-sum '(1 1)) 2)
(check-expect (nest-lst-sum '(1 2 (3 4) () 7 ((1 4) 1))) 23)
;; nest-lst-sum: (nested-listof Num) -> Nat
(define (nest-lst-sum nums)
  (cond [(empty? nums) 0]
        [(list? (first nums)) (+ (nest-lst-sum (first nums))
                                 (nest-lst-sum (rest nums)))]
        [else (+ (first nums) (nest-lst-sum (rest nums)))]))

;; (nl-max-depth nl) finds the maximum depth of a nested list, nl
;; Examples:
(check-expect (nl-max-depth '()) 0)
(check-expect (nl-max-depth '(())) 1)
(check-expect (nl-max-depth '(1)) 1)
(check-expect (nl-max-depth '(1 (1 2))) 2)
;; nl-max-depth: (nested-listof Any) -> Nat
(define (nl-max-depth nl)
  (cond [(empty? nl) 0]
        [(list? (first nl))
         (max (add1 (nl-max-depth (first nl)))
              (nl-max-depth (rest nl)))]
        [else (max 1 (nl-max-depth (rest nl)))]))
