# convexOptimization
This repository contains implementations of various convex optimization algorithms and applications

# Algorithms

# Basic Gradient Descent Methods
	--Gradient Descent
	  	-- Fixed Step Size
	  	-- Backtracking Line Search
	  	-- Exact Line Search
  	--Coordinate Gradient Descent
  	--Steepest Descent
  	
# Newton/ Quasi-Newton Methods
  	--Newton's Method
  		--Interior Point Method
  		--Conjugate Gradient Method
  	--Quasi-Newton Methods
  		-- BFGS
  		-- LBFGS

# Advanced Methods
	  Projected Gradient Descent -- Smooth
	  Projected Sub-gradient Descent - Non Smooth & Lipschitz(bounded gradient descent)
	  Proximal Gradient Descent (& Dual Proximal Gradient Descent) also known as ISTA -- Smooth + Simple Non Smooth
	  Accelerated Gradient Descent -- Smooth , Accelerates to O(1/t^2)
	  Accelerated Proximal Gradient Descent also known as FISTA -- Accelerates ISTA
	  Conditional Gradient Descent (Frank Wolfe Method) -- Constrained and Smooth same as Projected Gradient Descent. But Projection
	  replaced by linear optimization over the same set. Can adapt to smooth in arbitrary norm and sparse iterates
	  Mirror Descent -- Convex and  Lipscitz with respected to arbitrary norm (not necessary Eucliedean Norm)

# Randomization
	  --Stochastic Gradient Descent (SGD)
	  --Stochastic Variance Reduced Gradient Descent (SVRG)
  

# Applications
	Undetermined Least Squares using Lasso Formulation
	  -- Solved using Proximal Gradient Descent (ISTA), FISTA and Sub-Gradient Descent
	Logistic Regression
	Univariate Polynomial Optimization
	Max-Cut
	Signal Denoising using Dual Proximal Gradient Descent
	Maxtrix Completion (Low Rank)
	  -- Low Rank Matrix + Sparse Matrix -- recover original 2 matrices
	    -- Can be used for Background Subtraction






