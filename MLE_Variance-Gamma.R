# Define the log-likelihood function for the Variance Gamma distribution
library(VarianceGamma)
log_likelihood_VG <- function(params, data) {
  mu <- params[1]
  sigma <- params[2]
  nu <- params[3]
  theta <- params[4]
  
  # Check for valid parameters
  if (sigma <= 0 || nu <= 0) return(1e-10)  # Large penalty for invalid parameters
  
  # Calculate log density and return negative log-likelihood
  -sum(log(dvg(data, mu = mu, sigma = sigma, nu = nu, theta = theta)))
}

# Initial guess for parameters
initial_guess <- c(mu = 0, sigma =1, nu = 0.5, theta = 0)

# Perform optimization to find MLE using the Nelder-Mead method
result <- optim(
  par = initial_guess,
  fn = log_likelihood_VG,
  data = dataset_COMMODITIES,  # Use the simulated data
  method = "Nelder-Mead"
)
result
log_likelihood_VG(result$par,dataset_REALTY)

