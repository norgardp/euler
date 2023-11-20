
# Irradiation Constants and Time
nstep <- 2e3;
tirr <- 150;
t <- seq(from=0, to=tirr*3600, length=nstep);
tstep <- t[2]-t[1];
phi <- 0.8e14;

# Plotting Constants
#  - Golden Ratio for figure dimensions
#  - Color-blind compatible colors
#goldrat <- (1+sqrt(5))/2;
#colors <- c(rgb(0,0,0), rgb(0, 90/255, 181/255), rgb(220/255, 50/255, 32/255));


# Atomic and Sample Constants
Navogadro <- 6.02214076e23
Sm2O3 <- 2*151.9197324+3*15.994914;
Msamp <- 1e-3;


# Nuclear Constants
S12 <- 206 * 1e-24;
S23 <- 420 * 1e-24;
S45 <- 358 * 1e-24;
S56 <- 1469 * 1e-24;
S67 <- 3760 * 1e-24;

L24 <- log(2)/(46.28*3600);
L58 <- log(2)/(8.601*365.25*24*3600);
L69 <- log(2)/(4.573*365.25*24*3600);

# =============================================================================
# Driving Equations
dN1_dt <- function(N1)
{
	-N1*S12*phi
}

dN2_dt <- function(N1, N2)
{
	N1*S12*phi - N2*(S23*phi + L24);
}

dN3_dt <- function(N2, N3)
{
	N2*S23*phi;
}

dN4_dt <- function(N2, N4)
{
	N2*L24 - N4*S45*phi;
}

dN5_dt <- function(N4, N5)
{
	N4*S45*phi - N5*(S56*phi + L58);
}

dN6_dt <- function(N5, N6)
{
	N5*S56*phi - N6*(S67*phi + L69);
}

# =============================================================================
# Problem Set-Up

# Allocation of memory for each "vector" of data
N1_f <- rep(0, length(nstep));
N2_f <- rep(0, length(nstep));
N3_f <- rep(0, length(nstep));
N4_f <- rep(0, length(nstep));
N5_f <- rep(0, length(nstep));
N6_f <- rep(0, length(nstep));


# Setting boundary conditions (note, this is where you can set initial
# populations for any species involved in the simulation)
N1 <- rep(0, nstep);
N1[1] <- Msamp * Navogadro * (2 / Sm2O3);
N2 <- rep(0, nstep);
N3 <- rep(0, nstep);
N4 <- rep(0, nstep);
N5 <- rep(0, nstep);
N6 <- rep(0, nstep);

# The Simulation
for(i in 2:nstep)
{
	N1[i] <- N1[i-1] + tstep * dN1_dt(N1[i-1]);
	N2[i] <- N2[i-1] + tstep * dN2_dt(N1[i-1], N2[i-1]);
	N3[i] <- N3[i-1] + tstep * dN3_dt(N2[i-1], N3[i-1]);
	N4[i] <- N4[i-1] + tstep * dN4_dt(N2[i-1], N4[i-1]);
	N5[i] <- N5[i-1] + tstep * dN5_dt(N4[i-1], N5[i-1]);
	N6[i] <- N6[i-1] + tstep * dN6_dt(N5[i-1], N6[i-1]);
}

# Accumulating data into a single data structure for easier exportation
N_numeric <- array(rep(0, 6*length(t)), dim=c(length(t), 6));
N_numeric[,1] <- N1;
N_numeric[,2] <- N2;
N_numeric[,3] <- N3;
N_numeric[,4] <- N4;
N_numeric[,5] <- N5;
N_numeric[,6] <- N6;

# Cleanup
rm(N1, N2, N3, N4, N5, N6, N1_f, N2_f, N3_f, N4_f, N5_f, N6_f);
rm(dN1_dt, dN2_dt, dN3_dt, dN4_dt, dN5_dt, dN6_dt);
rm(S12, S23, S45, S56, S67, L24, L58, L69);