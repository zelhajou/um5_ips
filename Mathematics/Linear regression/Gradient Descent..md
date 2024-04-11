Gradient Descent is an optimization algorithm commonly used in machine learning and deep learning for minimizing a loss function to find the best-fitting parameters (coefficients or weights) of a model. It is particularly valuable when training models with a large number of parameters or features. 


**1. Loss Function:**

Gradient Descent begins with a loss function, also known as a cost function or objective function, denoted as J(θ). This function quantifies how well the model's predictions match the actual target values. The goal is to minimize this loss function by adjusting the model's parameters.

**2. Initialize Parameters:**

The algorithm starts with an initial guess for the model's parameters, denoted as θ (theta). These parameters can be coefficients in linear regression, weights in a neural network, or any other tunable values in the model.

**3. Calculate the Gradient:**

The gradient of the loss function with respect to the parameters, denoted as ∇J(θ), represents the direction of the steepest increase in the loss. In other words, it tells us how to adjust the parameters to reduce the loss. The gradient is calculated by taking the partial derivative of J with respect to each parameter.

**4. Update Parameters:**

Gradient Descent updates the parameters iteratively using the gradient information. The update rule is as follows:

θ=θ−α⋅∇J(θ)

- θ represents the current parameter values.
- α (alpha) is the learning rate, a hyperparameter that controls the step size during each iteration. It determines how large a step we take along the gradient direction.
  
The choice of learning rate is crucial. If it's too small, the algorithm may converge very slowly; if it's too large, the algorithm might not converge or even diverge. It's a hyperparameter that needs to be tuned.

**5. Repeat Iteratively:**

Steps 3 and 4 are repeated iteratively until a stopping criterion is met. Common stopping criteria include reaching a maximum number of iterations or observing a small change in the loss function (convergence).

**6. Convergence:**

When Gradient Descent converges, it means that the parameters have been adjusted to a point where the loss function is minimized. At this point, the model's predictions are as accurate as possible given the data and the chosen model structure.

There are different variants of Gradient Descent, such as:

- **Batch Gradient Descent:** Updates the parameters using the entire dataset in each iteration. It is computationally expensive for large datasets but guarantees convergence.
    
- **Stochastic Gradient Descent (SGD):** Updates the parameters using one random data point (or a small batch) in each iteration. It's computationally efficient but can have more oscillations in the loss function.
    
- **Mini-Batch Gradient Descent:** A compromise between Batch GD and SGD. It updates the parameters using a small random subset (mini-batch) of the data in each iteration.
    

Gradient Descent is a fundamental optimization technique used not only for training machine learning models but also in various other fields, such as physics, engineering, and economics, whenever an optimization problem needs to be solved.

![[Pasted image 20230903180054.png]]

![[Pasted image 20230903180539.png]]