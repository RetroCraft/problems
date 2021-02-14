---
layout: refpage
title: MATH 136 Reference Sheet
description: Collected from the Winter 2021 course notes
class: math136
---

## Notation

Note that numbered subreferences like "Definition 1.2" refer to Topic 1, Definition 2.

$$S^+$$ is the positive subset of $$S$$.
Set complements are denoted $$A\setminus B$$.

We notate a **vector** in boldface as $$\vb v = \mqty(1\\2\\3) = (1,2,3)^T \in \Z^3$$.
The generic field $$\F$$ is either $$\R$$ or $$\C$$.

The set of **matrices** with $$m$$ rows and $$n$$ columns with elements from $$\F$$ is $$M_{m\times n}(\F)$$.

$$
  A = \pmqty{
    {(A)}_{11} & {(A)}_{12} & \dotsb & {(A)}_{1n} \\
    {(A)}_{21} & {(A)}_{22} & \dotsb & {(A)}_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    {(A)}_{m1} & {(A)}_{m2} & \dotsb & {(A)}_{mn}
  } = \pmqty{
    a_{11} & a_{12} & \dotsb & a_{1n} \\
    a_{21} & a_{22} & \dotsb & a_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    a_{m1} & a_{m2} & \dotsb & a_{mn}
  } = \pmqty{\vb A^1 \\ \vb A^2 \\ \vdots \\ \vb A^m}
  = (\vb a_1, \vb a_2,\dotsc,\vb a_n)
$$

A **row vector** is a $$1\times n$$ matrix $$\vb M = (\vb M_1,\vb M_2,\vb M_3) \in M_{1 \times 3}$$.
A **column vector** is a $$n\times 1$$ matrix, notice that $$M_{n\times 1}(\F) = \F^n$$.
