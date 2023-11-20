# Numerical Solution (10-22-2023).r
# 
# Compute the numerical solution of the irradiation/decay involving multiple MURR
# fuel cycles.
#
# Peter Norgard
# 22 October 2023
#

# Load the functions
source("integrand functions (10-22-2023).r");

# Compute the integration
rk4sol <- rk(y=init, times=t, func=smadc, parms=NULL, verbose=TRUE, method="ode45");
