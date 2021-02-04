---
title: ECON 140 Reference Sheet
description: "Disclaimer: I am bad at taking notes"
---

This is for equation reference only, for example, when you're lost as hell during lectures!
I will make real cheat sheets that explain *what* things are.

## Calculating GDP

$$Y = C_a + I_a + G_a + NX_a$$

where
- $$Y$$ is **GDP**
- $$C_a$$ is **actual consumption**
- $$I_a$$ is **actual investment**, which is equal to gross investment less depreciation
- $$G_a$$ is **actual government expenditure**
- $$NX_a = X_a - IM_a$$ is **actual net exports**
  - $$X_a$$ is **actual exports**
  - $$IM_a$$ is **actual imports**

## Simple Short-Run Model

Equilibrium GDP $$Y_e$$ occurs when $$Y_e = AE$$, the **aggregate expenditure**.

We have a few basic metrics:
- The **autonomous spending** $$A$$ is $$AE$$ when $$Y = 0$$
- $$\frac{\Delta Y}{\Delta AE} = z$$ is the **marginal propensity to spend**
- $$\frac{\Delta A}{\Delta Y_e} = \frac{1}{1-z}$$ is the **simple multiplier**

All our models will be *linear*, that is, $$AE = A + zY$$.
This should make it easy to identify $$A$$ and $$z$$.
The term with no $$Y$$-dependency is called *autonomous* and with is called *induced*.

Assuming linearity also gives us the really nice equation $$Y_e = \frac{A}{1-z}$$.

### Super Simple Model

In our simple model, we **ignore government and trade**, so that we can say

$$\begin{align}
  AE & = C + I \\
     & = \underbrace{(a + I_0)}_{A} + \underbrace{(b)}_zY
\end{align}$$

where
- $$C = a + bY$$ is **desired consumption**
  - $$a$$ is **autonomous consumption**
  - $$b$$ is the **marginal propensity to consume**.
    The opposite (*marginal propensity to save*) is $$1-b$$.
- $$I = I_0$$ is **desired investment**, which we set to a constant

### Adding Government

We now add government expenditure.

$$\begin{align}
  AE & = C + I + G \\
     & = \underbrace{(a + I_0 - bT_0 + G_0)}_{A} + \underbrace{b(1-t)}_{z}Y
\end{align}$$

where the only changes from above are that
- \$$C = a + bY_D$$
  - $$Y_D = Y - T$$ is **disposable income**
    - $$T = T_0 + tY$$ is **taxes**
      - $$T_0$$ is **autonomous tax** that doesn't depend on GDP, like CERB
      - $$t$$ is the **marginal tax rate**
- $$G = G_0$$ is **desired government spending**, which we set to a constant

### Adding Trade

Lecture hasn't happened yet so I'm doing some hard guesswork here.

$$\begin{align}
  AE & = C + I + G + NX \\
     & = \underbrace{(a + I_0 - bT_0 + G_0 + X_0)}_{A} + \underbrace{(b(1-t) - m)}_{z}Y
\end{align}$$

where the variables are the same except
- $$NX = X - IM$$ is **desired net exports**
  - $$X = X_0$$ is **desired exports**, which we set to a constant
  - $$IM = mY$$ is **desired imports**
    - $$m$$ is the **marginal propensity to import**
