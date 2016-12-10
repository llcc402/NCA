# The Neighbourhood Components Analysis

We are given a set of observations and their labels and we want to build a classification model (KNN). The task is to learn a metric for the observations. The basic assumption is that for every pair x_i and x_j, their distance is 

	D(x_i,x_j) = (x_i - x_j)' M (x_i - x_j)

where M is a positive definite matrix, which should be learned from the dataset.

We assume that the probability of x_j is a neighbour of x_i is

	                  exp(-D(x_i, x_j))
	p_{i,j} = ----------------------------------
                      sum_{k~=i}exp(-D(x_i, x_k))

and we want to maximize p_i which is

	p_i = sum_{j \in c_i} p_{i,j}

where c_i is the set of the observations who has the same label of x_i. The learning procedure is to use the gradient ascent method.

This method is proposed by Goldberger, Jacob; Roweis, Sam T; Hinton, Geoffrey E ;Salakhutdinov, Ruslan; Roweis, Sam T; Salakhutdinov, Rusla, titled Neighbourhood Component Analysis, published by Advances in Neural Information Processing Systems, 2004, p513-520.

## Functions included 

1. data_generate.m : generate two classes of observations.

2. get_distance.m : get the Mahalanobis distance between all pairs of observations, for a given M.

3. get_gradient.m : get the gradient of the learning function.

4. get_prob.m : get the probability p_{i,j}

5. cell_image.m : compute the transpose of a triangular cell and combine it with the original cell to form a new cell.

6. outer.m : compute the outer product of all pairs of (x_i - x_j) * (x_i - x_j)', and store them in a cell.

7. NCA.m : learn M for the Mahalanobis metric.c.
