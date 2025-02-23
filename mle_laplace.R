# Define the log-likelihood function for the Laplace distribution
log_likelihood_laplace <- function(params, data) {
  mu <- params[1]
  b <- params[2]
  
  # Check for valid parameters
  if (b <= 0) return(1e10)  # Return a large penalty for invalid scale
  
  # Calculate the log-likelihood
  n <- length(data)
  log_likelihood <- -n * log(2 * b) - sum(abs(data - mu) / b)
  
  return(-log_likelihood)  # Return negative log-likelihood
}

# Initial guess for parameters
initial_guess <- c(mu = 0, b = 1)  # Make sure b > 0

# Perform optimization to find MLE using the Nelder-Mead method
result <- optim(
  par = initial_guess,
  fn = log_likelihood_laplace,
  data = dataset_REALTY,
  method = "Nelder-Mead"
)
result
log_likelihood_laplace(initial_guess,dataset_REALTY)
