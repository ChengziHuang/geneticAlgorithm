# geneticAlgorithm
Some codes and materials for my thesis.

### GA Framework

**Initialization:**  Generate a random population P of M individuals

**Evaluation:** Evaluate the fitness *f(x)* of each individual

​	**Reproduction:** Repeat the following steps until all offspring are generated

​		**Parent Selection:** Select two parents from P

​		**Crossover:** Apply crossover on the parents with probability Pc

​		**Mutation:** Apply mutation on offspring with probability Pm

​		**Evaluation:** Evaluate the newly generated offspring

​	**Offspring Selection:** Create a new population from offspring and P

**Output:** Return the best individual foud






