
# Constants
N1_0 <- Msamp * Navogadro * (2 / Sm2O3);
N2_0 <- 0;
N3_0 <- 0;
N4_0 <- 0;
N4_0 <- 0;
N5_0 <- 0;
N6_0 <- 0;


N1 <- N1_0 * exp(-S12*phi*t);
N2 <- 	N1_0 * ((S12*phi)/((S23-S12)*phi + L24)) * (exp(-S12*phi*t) - exp(-(S23*phi + L24)*t)) + 
	N2_0 * exp(-(S23*phi+L24)*t);
N3 <- 	N1_0 * ((S12*phi*S23*phi)/((S23-S12)*phi+L24))*( (1-exp(-S12*phi*t))/(S12*phi) - (1-exp(-(S23*phi+L24)*t))/(S23*phi+L24) ) + 
	N2_0 * ((S23*phi)/((S23-S12)*phi*L24)) * (1-exp(-(S23*phi+L24)*t)) +
	N3_0;
N4b <- N1_0 * ((L24*S12*phi)/((S23-S12)*phi+L24))*( (1-exp(-S12*phi*t))/(S12*phi) - (1-exp(-(S23*phi+L24)*t))/(S23*phi+L24) ) +
	N2_0 * (L24/(S23*phi+L24))*(1-exp(-(S23*phi+L24)*t)) +
	N4_0;
N4 <- N1_0 * (S12*phi*L24/((S23-S12)*phi+L24))*( 
		(exp(-S12*phi*t) - exp(-S45*phi*t))/((S45-S12)*phi) - 
		(exp(-(S23*phi+L24)*t) - exp(-S45*phi*t))/((S45-S23)*phi-L24)) +
	N2_0 * (L24/((S45-S23)*phi-L24))*(exp(-(S23*phi+L24)*t) - exp(-S45*phi*t)) +
	N4_0 * exp(-S45*phi*t);
N5 <- N1_0 * (L24*phi*phi*S12*S45/((S23-S12)*phi+L24))*( 
		(exp(-S12*phi*t)		- exp(-(S56*phi+L58)*t)) / ((S45-S12)*phi*((S56-S12)*phi+L58)) - 
		(exp(-S45*phi*t)		- exp(-(S56*phi+L58)*t)) / ((S45-S12)*phi*((S56-S45)*phi+L58)) - 
		(exp(-(S23*phi+L24)*t) 	- exp(-(S56*phi+L58)*t)) / (((S45-S23)*phi-L24)*((S56-S23)*phi+L58-L24)) + 
		(exp(-S45*phi*t)		- exp(-(S56*phi+L58)*t)) / (((S45-S23)*phi-L24)*((S56-S45)*phi+L58)) ) + 
	N2_0 * (S45*phi*L24/((S45-S23)*phi+L24))*( 
		(exp(-(S23*phi+L24)*t) 	- exp(-(S56*phi+L58)*t)) / ((S56-S23)*phi+L58-L24) - 
		(exp(-S45*phi*t)		- exp(-(S56*phi+L58)*t)) / ((S56-S45)*phi+L58) ) +
	N4_0 * (S45*phi/((S56-S45)*phi+L58)) * (
		exp(-S45*phi*t)			- exp(-(S56*phi+L58)*t)) +
	N5_0 * exp(-(S56*phi+L58)*t);
N6 <- N1_0 * (S12*S45*S56*L24*phi*phi*phi/((S23-S12)*phi+L24)) * (
		(exp(-S12*phi*t) - exp(-L69*t))/((L69-S12*phi)*((S56-S12)*phi+L58)*(S45-S12)*phi) -
		(exp(-(S56*phi+L58)*t) - exp(-L69*t))/((L69-L58-S56*phi)*((S56-S12)*phi+L58)*(S45-S12)*phi) -
		(exp(-S45*phi*t) - exp(-L69*t))/((L69-S45*phi)*((S56-S45)*phi+L58)*(S45-S12)*phi) +
		(exp(-(S56*phi+L58)*t) - exp(-L69*t))/((L69-L58-S56*phi)*((S56-S45)*phi+L58)*(S45-S12)*phi) -
		(exp(-(S23*phi+L24)*t) - exp(-L69*t))/((L69-L24-S23*phi)*((S56-S23)*phi+L58-L24)*((S45-S23)*phi-L24)) +
		(exp(-(S56*phi+L58)*t) - exp(-L69*t))/((L69-L58-S56*phi)*((S56-S23)*phi+L58-L24)*((S45-S23)*phi-L24)) +
		(exp(-S45*phi*t) - exp(-L69*t))/((L69-S45*phi)*((S56-S45)*phi+L58)*((S45-S23)*phi-L24)) -
		(exp(-(S56*phi+L58)*t) - exp(-L69*t))/((L69-L58-S56*phi)*((S56-S45)*phi+L58)*((S45-S23)*phi-L24)) ) +
	N2_0 * (S45*S56*phi*phi*L24/((S45-S23)*phi+L24)) * (
		(exp(-(S23*phi+L24)*t) - exp(-L69*t))/((L69-L24-S23*phi)*((S56-S23)*phi+L58-L24)) -
		(exp(-(S56*phi+L58)*t) - exp(-L69*t))/((L69-L58-S56*phi)*((S56-S23)*phi+L58-L24)) -
		(exp(-S45*phi*t) - exp(-L69*t))/((L69-S45*phi)*((S56-S45)*phi+L58)) +
		(exp(-(S56*phi+L58)*t) - exp(-L69*t))/((L69-L58-S56*phi)*((S56-S45)*phi+L58)) ) +
	N4_0 * (S45*S56*phi*phi/((S56-S45)*phi+L58)) * ( 
		(exp(-S45*phi*t) - exp(-L69*t))/(L69-S45*phi) - 
		(exp(-(S56*phi+L58)*t) - exp(-L69*t))/(L69-L58-S56*phi) ) +
	N5_0 * (S56*phi/(L69-L58-S56*phi)) * (exp(-(S56*phi+L58)*t) - exp(-L69*t)) +
	N6_0 * exp(-L69*t);


N_analytic <- array(rep(0, 6*length(t)), dim=c(length(t), 6))
N_analytic[,1] <- N1;
N_analytic[,2] <- N2;
N_analytic[,3] <- N3;
N_analytic[,4] <- N4;
N_analytic[,5] <- N5;
N_analytic[,6] <- N6;
