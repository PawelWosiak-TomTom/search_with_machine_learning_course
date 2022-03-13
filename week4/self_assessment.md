# Level 1
## Number of unique categories
min_queries | number of unique categories
---  | ---
100  | 866
1000 | 374
## Best values of P@1 / R@3 / R@5
min_queries | P@1 | R@3 | R@5 | comment
----------- | --- | --- | --- | ---
100         |0.512|0.692|0.757| -
1000        |0.53 |0.714|0.78| training set size 50k
1000        |0.583|0.781|0.845| after increasing training set size to 1M (60 - 90 minutes of training)

![alt text](training-variants.png)

# Level 2

## Positive examples
query           | nr of results without filtering | nr of results with filtering | predicted categories | comment
 ---            | ---                             |           ---                |     --- | ---
 qc 15     |          3373                        |           1                  | conf=0.96, All Headphones (pcmcat144700050004) | without filtering not in result set, with filtering perfect match
 laptop    |         7734                         |         1492                 | conf=0.64, PC Laptops (pcmcat247400050000) | without filtering first laptop on 7th pos
 

## Negative examples