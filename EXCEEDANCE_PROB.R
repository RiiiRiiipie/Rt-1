
# Define the threshold
x0 <- 0.05  # Set your desired threshold
dataset_REALTY=na.omit(dataset_REALTY)
# Calculate observed exceedance probability
n_total <- length(dataset_REALTY)                  # Total number of observations
n_exceed <- sum(dataset_REALTY > x0)               # Number of values exceeding the threshold
observed_prob <- n_exceed / n_total      # Observed exceedance probability

print(observed_prob)



# Parameters
mu <- 0.000686  # location
b <- 0.035704   # scale
x0 <- 0.05 # threshold

# Exceedance probability
library(LaplacesDemon)
exceedance_prob <- 1 - plaplace(x0, location = mu, scale = b)
print(exceedance_prob)

#exceedance for kumarswamy-laplace

# Load necessary library
install.packages("pracma")
library(pracma)  # For numerical integration

# Define the Kumaraswamy-Laplace PDF function
kum_laplace_pdf <- function(x, mu, sigma, a, b) {
  ifelse(x <=mu,
         (( a * b / (2^a * sigma)) * exp(a * (x - mu) / sigma) * 
            (1 - 1/(2^a) * exp(a * (x - mu) / sigma))^(b-1)),
         ((a * b / (2^a * sigma))* exp(-(x - mu) / sigma) * 
            (2 - exp(-(x - mu) / sigma))^(a - 1) * 
            (1 - (1 - 1/2 * exp(-(x - mu) / sigma))^a)^(b - 1)))
 
}
mu <- -0.00098    # Location parameter
sigma <- 0.078318     # Scale parameter
a <- 2.405076    # Shape parameter
b <- 3.152569      # Shape parameter
x <- 0.05   # Threshold value
#kum_laplace_pdf(0,0.00515,0.042331,2.517673,4.114304)
# Define the CDF function by integrating the PDF from -Inf to x
kum_laplace_cdf <- function(x, mu, sigma, a, b) {
  # Use numerical integration to get the CDF
  integrate(function(x) kum_laplace_pdf(x, mu, sigma, a, b), -Inf, x)$value
}

# Define the exceedance probability function
exceedance_probability <- function(x, mu, sigma, a, b) {
  1 - kum_laplace_cdf(x, mu, sigma, a, b)
}

# Calculate exceedance probability
exceed_prob <- exceedance_probability(x, mu, sigma, a, b)
cat("Exceedance Probability P(X > x) =", exceed_prob, "\n")


#variance gamma 

library(VarianceGamma)

# Define the parameters for the Variance Gamma distribution
vgC <- 1.153554  # Location parameter
sigma <- 0.030878   # Scale parameter
nu <- 0.482339           # Shape parameter (set according to your case)
theta <- 0.001925        # Shape parameter (set according to your case)

# Define the threshold value for which we want the exceedance probability
x <- 0 # Change this value as needed
#exceed_prob for VG
cdf_value_VG <- pvg(x, vgC = vgC, sigma = sigma, nu = nu, theta = theta)
cdf_value_VG
exceed_prob_VG=1-cdf_value_VG
exceed_prob_VG
# Define the PDF function for the Variance Gamma distribution
VG_pdf <- function(t) {
  dvg(t, vgC = x, sigma = sigma, nu = nu, theta = theta)
}

# Calculate the CDF at x by integrating the PDF from -Inf to x
cdf_value <- integrate(VG_pdf, lower = -Inf, upper = x)$value

# Print the CDF value
cat("CDF P(X <= x) at x =", x, "is", cdf_value, "\n")
cdf_value_VG
exceed_prob_VG=1- cdf_value_VG
exceed_prob_VG

# Install and load the VarianceGamma package if not already installed
if (!requireNamespace("VarianceGamma", quietly = TRUE)) {
  install.packages("VarianceGamma")
}
library(VarianceGamma)

# Define the parameters for the Variance Gamma distribution
vgC <- 0.08625     # Location parameter (mean)
sigma <- 0.023063  # Scale parameter
nu <- 0.369849     # Shape parameter
theta <- 0.001762  # Shape parameter

# Define the PDF function for the Variance Gamma distribution
VG_pdf <- function(t) {
  dvg(t, vgC = vgC, sigma = sigma, nu = nu, theta = theta)
}

# Define the threshold value x up to which to calculate the CDF
x <- 0  # This is the value of X for which we want P(X <= x)

# Use a large negative number instead of -Inf to approximate -infinity
lower_bound <- -100000000000  # Adjust as necessary for your distribution’s range

# Calculate the CDF by integrating the PDF from a large negative number to x
cdf_value <- integrate(VG_pdf, lower = lower_bound, upper = x)$value

# Print the approximate CDF value
cat("Approximate CDF P(X <= x) at x =", x, "is", cdf_value, "\n")

