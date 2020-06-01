---
title: "matplotlib"
preview: "matplotlib" 
permalink: "/blog/misc/matplotlib" 
layout: post
 
categories: 
    - "pycharm"
    - "matplotlib"
    - "visual"
---



# Pycharm matplotlib in interactive mode
## Solution:
```python3
import matplotlib as mpl
import matplotlib.pyplot as plt
mpl.use('macosx')

plt.plot(range(10))
```
+ or 
```
Disable Settings | Tools | Python Scientific | Show plots in tool window.
```
## Refs:
<!-- comments
<sup>[1]</sup>
1. [1]: https://stackoverflow.com/questions/49844189/how-to-get-interactive-plot-of-pyplot-when-using-pycharm
[inline link](in reference[1])  

[inline link](in reference[1])  
[1] [interactive plot in pycharm](https://stackoverflow.com/questions/49844189/how-to-get-interactive-plot-of-pyplot-when-using-pycharm)
-->

* https://stackoverflow.com/questions/49844189/how-to-get-interactive-plot-of-pyplot-when-using-pycharm
