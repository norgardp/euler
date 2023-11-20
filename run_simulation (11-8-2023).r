# Run Simulation (11-8-2023)
# 
# Designed to iterate through the solution methods using a set
# of new step sizes: 5, 50, 500, 5000.
#
# Peter Norgard
# 8 Nov 2023
#

require(deSolve);

# Simulation steps
nstep <- c(1, 10, 100, 1000)* 5;

# Irradiation length (hours, time steps in seconds)
tirr <- 500;

# Material constants
# Atomic weight and starting sample mass
Sm2O3 <- 2*151.9197324+3*15.994914;
Msamp <- 1e-3;

# Define nuclear constants
if(!exists("constants_defined"))
	source("nuclear constants (10-19-2023).r");

results <- matrix(rep(0, 3*length(nstep)), nrow=length(nstep));

for(i in 1:length(nstep))
{
	t <- seq(from=0, to=tirr*3600, length=nstep[i]);

	# Run analytical solutions
	source("leibnitz solutions (7-16-2023).r");
	source("euler solutions (10-19-2023).r");
	source("rk solutions (10-19-2023).r");

	results[i,1] <- N_analytic[nstep[i], 2];
	results[i,2] <- N_euler[nstep[i], 3];
	results[i,3] <- N_rk4[nstep[i], 3];
}



