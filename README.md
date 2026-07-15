# TSP Brute Force and Genetic Comparison

This Processing sketch visualizes the Travelling Salesman Problem by solving the same randomly generated city set in two different ways: brute force and a genetic algorithm. The two approaches are shown side by side so the difference in search strategy, convergence speed, and route quality is easy to compare.

The project portfolio entry is available at https://nuwanthakumara.com/projects/project_tsp.

# Overview

The Travelling Salesman Problem asks for the shortest possible route that visits each city exactly once. A brute force solution checks every possible ordering of the cities, which becomes impractical very quickly as the number of cities grows. A genetic algorithm takes a different approach by maintaining a population of candidate routes, scoring them by fitness, and evolving better routes over time.

This sketch uses both strategies against the same set of points. That makes it useful as a teaching tool and as a visual demonstration of how heuristic search can outperform exhaustive search for larger inputs.

# Project Structure

The sketch is organized into a small set of Processing source files, each with a focused responsibility.

| File | Responsibility |
| --- | --- |
| [TSP_BruteForce_and_Genetic_Comparison.pde](TSP_BruteForce_and_Genetic_Comparison.pde) | Application entry point, random city generation, frame-by-frame drawing, and coordination of both solvers. |
| [elementClass.pde](elementClass.pde) | Defines the `element` class used to represent one candidate route in the genetic algorithm population. |
| [functions.pde](functions.pde) | Shared utility functions for array copying, swapping, shuffling, distance calculation, and factorial computation. |
| [GenaticAlgorithmFunctions.pde](GenaticAlgorithmFunctions.pde) | Genetic algorithm logic, including fitness evaluation, normalization, selection, mutation, and population replacement. |

# Core Classes and Functions

The `element` class is the main data structure used by the genetic algorithm. Each instance stores one route through the city list together with a fitness score. Routes are stored as index arrays, which lets the sketch reuse the same city coordinates across many candidate solutions without duplicating point data.

The main sketch file drives the entire visualization. During setup, it generates the city positions, initializes the brute force and genetic algorithm state, and creates the first random population. During each draw cycle, it updates the genetic algorithm population, advances the brute force permutation search, and renders the current and best routes for both methods.

The helper file contains the low-level operations the sketch depends on. Distance calculation is centralized so both solvers evaluate routes in the same way. Array cloning and swapping are used throughout the route manipulation code, and the factorial helper is used to compute the number of brute force permutations.

The genetic algorithm functions are separated from the drawing code so the evolutionary process is easier to follow. Fitness is assigned from route distance, normalized across the population, and then used for weighted selection. New routes are created through selection and mutation before being copied into the next generation.

The brute force implementation uses lexicographic permutation stepping to enumerate route orderings. That keeps the logic compact and makes the comparison with the genetic algorithm easier to understand.

# Dependency

The sketch depends on the PeasyCam library.

# Example

![tsp](https://github.com/Nuwantha005/TSP_BruteForce_and_Genetic_Comparison/assets/132461834/e5fcb87d-6ce8-46ab-b686-cfb975dddb2d)
