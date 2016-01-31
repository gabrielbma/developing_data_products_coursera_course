---
title       : An Iris dataset analysis application
subtitle    : 
author      : Gabriel Bezerra de Menezes Armelin
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Outline

1. Goal and features
2. Summary feature
3. Plots feature
4. Model features

## Goal and Features

The main goal of this application is to allow students to easily inspect the Iris dataset by providing built-in features such as dataset summary, plots and some machine learning models. That way, a student just starting learining this dataset can quickly take out information of it.

--- .class #id 

## Summary Feature

The summary tab shows some Iris statistics for all observations and for the observations used for training. The dataset structure is also presented.

![](images/summary1.png)
![](images/summary2.png)
![](images/summary3.png)

---
## Plots Features
The plot tab shows a pair plot which confronts each variable with the remaining variables.

![](images/plots3.png)

---
## Model features

The model feature tab shows information such as model fit, model plot and model test (confusion marix). By clicking on the radio buttons on the left side, a user can choose different models and compare which one better fit the iris dataset.

![](images/model1.png)
![](images/model2.png)
![](images/model3.png)

