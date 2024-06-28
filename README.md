# Introduction
Travelling salesman problem is a classic problem found in computer science that involves finding the shortest path to traverse a given set of points.
Its one of the type of poroblems known as [NP problems](https://www.wikiwand.com/en/NP_(complexity)). 

If we solve it by brute force, we need to try n! that is factorial(n) possibilities to verify the shortest path. This wouldn't be a problem for a smalll number of points
but as number of points increases oot gets really hard to do.

# Genetic Algorithm
We can fine solution within relatively short time if we use a genatic algorithm. Genetic algorithms are algorithms based on how natural selection works.
They choose a set of solutions refered to as "Population" and use the best performances among them to form "Children" i.e. the next generation.

# Purpose
This programme generate given number of random points and solve travelling salesman problem for that same set of points side by side using brute force and 
genetic algorithm. This is helpful to visualize how effective genetic algorithm is compared to brute force. Note that however parameters of genetic algorithm such as population size 
may affect the performance and the should be changed based on the number of points.

# Example
![tsp](https://github.com/Nuwantha005/TSP_BruteForce_and_Genetic_Comparison/assets/132461834/e5fcb87d-6ce8-46ab-b686-cfb975dddb2d)
