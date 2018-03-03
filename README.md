# PageRank
Three approaches to PageRank algorithm implemented in Octave:
- Iterative
- Algebraic
- Power Method

## Description
PageRank is an algorithm that analyses hyperlinks on the Internet and was the foundation of Google search engine when it was created in 1998.
Given N pages (nodes), each of it has a number of links to other pages. The pages with more links towards itself have a greater probability to be accessed by a user.
A search engine should redirect to the user that pages relevant to his typed keywords with the most in-links, thus the most important ones.
Another thing to consider is the probability of one user to continue browsing - the damping factor, considered to have a mean value of 0.85.
### Intuition
We want to find the Importance Factor of page A.
We say that M(A) is the set of pages that contain a link to A.
We choose B such that B belongs to M(A).
The probability of reaching page B influence the probability to reach page A. B has high Importance Factor, thus probability to reach page A rises.
The number of links from B to another page influence the probability to reach A as well. B has a lot of links to variate pages, thus probability to reach page A falls.

## How to Use
Example:
```sh
$ octave --no-gui
> PageRank("tests/graph1", 0.85, 0.0001);
```
where **"tests/graph1"** is the input file, **0.85** is the damping factor and **0.0001** is the error degree that assures convergence (epsilon).

Results will be displayed in **"tests/graph1.out"** (the input file name with .out extension).

## Input / Output Files
Input format:
```
Number of nodes
An adjacency list representation of the graph
value1 
value2 (both used to calculate membership degree)
```
Output format:
```
Place in ranking      Node number     Importance Factor
```

## Documentation
https://en.wikipedia.org/wiki/PageRank

https://www.gnu.org/software/octave

