#data extractioon
library(quantmod)
getSymbols("XLE", src = "yahoo",from="2010-01-01",to="2022-05-30")
SP_weekly = to.weekly(`XLE`)
SP_weekly_omited=na.omit(SP_weekly)
SP500_close=diff(log(SP_weekly_omited$`XLE.Close`))
SP500_close
dataset_E=as.numeric(SP500_close)
dataset_E
summary(dataset_E)
dataset=na.omit(dataset_E)
library(stats)

#main file
log_likelihood = function(params, data) {
  a = params[1]
  b = params[2]
  mu = params[3]
  sigma = params[4]
# Define the PDF of the Kumaraswamy Laplace distribution here

# Ensure that sigma is positive to avoid invalid calculation
pdf = ifelse(data <=mu,
             (( a * b / (2^a * sigma)) * exp(a * (data - mu) / sigma) * 
                (1 - 1/(2^a) * exp(a * (data - mu) / sigma))^(b-1)),
             ((a * b / (2^a * sigma))* exp(-(data - mu) / sigma) * 
                (2 - exp(-(data - mu) / sigma))^(a - 1) * 
                (1 - (1 - 1/2 * exp(-(data - mu) / sigma))^a)^(b - 1)))



    # Example:
    # nll <- -sum(log(dkumaraswamy_laplace(data, a, b, mu, sigma)))
  # Example without full pdf formula:
nll = -sum(log(pdf +1e-8))
  
return(nll)
}
initial_guess = c(a = 1, b = 1, mu = median(dataset_E), sigma = sd(dataset_E))

# Optimize
result = optim(par = initial_guess, 
               fn = log_likelihood, 
               data = dataset_COMMODITIES, 
               method = "Nelder-Mead")

# Check the result
result
