# Genetic Algorithm

Some codes and materials for my thesis.

## GA Framework

**Initialization:**  Generate a random population P of M individuals

**Evaluation:** Evaluate the fitness *f(x)* of each individual

**Repeat until the stopping criteria are met:**

&#8194; &#8194; &#8194; &#8194;**Reproduction:** Repeat the following steps until all offspring are generated

 &#8194; &#8194; &#8194; &#8194;&#8194; &#8194; &#8194; &#8194; **Parent Selection:** Select two parents from P

 &#8194; &#8194; &#8194; &#8194;&#8194; &#8194; &#8194; &#8194;**Crossover:** Apply crossover on the parents with probability Pc

 &#8194; &#8194; &#8194; &#8194;&#8194; &#8194; &#8194; &#8194;**Mutation:** Apply mutation on offspring with probability Pm

 &#8194; &#8194; &#8194; &#8194;&#8194; &#8194; &#8194; &#8194;**Evaluation:** Evaluate the newly generated offspring

&#8194; &#8194; &#8194; &#8194;**Offspring Selection:** Create a new population from offspring and P

**Output:** Return the best individual foud

## Idea

Exploration is import to ensure global reliability, i.e. every part of the domain is searched enough to provide a reliable estimate of the global optimum.

Exploitation is also important since it concentrates the search effort around the best solutions found so far by searching their neighborhoods to produce better solutions.

For specific question, degisn some new genetic operators i.e. Edge Assembly Crossover for the Travelling salesman problem.