---
title: ECON 140 Reference Sheet
description: "Disclaimer: I am bad at taking notes"
---

This is for equation reference only, for example, when you're lost as hell during lectures!
I will make real cheat sheets that explain *what* things are.

## Calculating GDP

$$Y = C_a + I_a + G_a + X_a - IM_a$$

where
- $$Y$$ is **GDP**
- $$C_a$$ is **actual consumption**
- $$I_a$$ is **actual investment**, which is equal to gross investment less depreciation
- $$G_a$$ is **actual government expenditure**
- $$X_a$$ is **actual exports**
- $$IM_a$$ is **actual imports**

## Simple Short-Run Model

Equilibrium GDP $$Y_e$$ occurs when $$Y_e = AE$$, the **aggregate expenditure**.

We have a few basic metrics:
- The **autonomous spending** $$A$$ is $$AE$$ when $$Y = 0$$
- $$\frac{\Delta Y}{\Delta AE} = z$$ is the **marginal propensity to spend**
- $$\frac{\Delta A}{\Delta Y_e} = \frac{1}{1-z}$$ is the **simple multiplier**

In our simple model, we **ignore government and trade**, so that we can say

$$\begin{align}AE & = C + I \\ & = (a + I_0) + (b)Y\end{align}$$

where
- $$C = a + bY$$ is **desired consumption**
  - $$a$$ is **autonomous consumption**
  - $$b$$ is the **marginal propensity to consume**.
    The opposite (*marginal propensity to save*) is $$1-b$$.
- $$I = I_0$$ is **desired investment**, which we set to a constant

Since this is linear, we can immediately conclude that $$a+I_0$$ is autonomous spending and $$z = b$$.
We can also find the simple multiplier $$\frac{1}{1-b}$$.

## Adding Government

We now add government expenditure.

$$\begin{align}AE & = C + I + T \\ & = \underbrace{(a - bT_0 + I_0)}_{A} + \underbrace{b(1-t)}_{z}Y\end{align}$$

where the only changes from above are that
- \$$C = a + bY_D$$
  - $$Y_D = Y - T$$ is **disposable income**
- $$T = T_0 + tY$$ is **desired taxes**
  - $$T_0$$ is **autonomous tax** that doesn't depend on GDP, like CERB
  - $$t$$ is the **marginal tax rate**
