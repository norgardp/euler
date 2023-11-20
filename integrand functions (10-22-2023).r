# Integrand Functions (10-22-2023).r
#
# Equations to solve the irradiated and unirradiated portions of a week. Solving
# for Samarium 152 activation/decay chain (sm-a/dc)
#
# Peter Norgard
# 22 Oct 2023
#

smadc <- function(t, y, params)
{
	with(as.list(y), {
		dndt <- rep(0,length(y))
		dndt[1] <- -N1*S12*phi_t
		dndt[2] <-  N1*S12*phi_t - N2*(S23*phi_t + L24)
		dndt[3] <-  N2*S23*phi_t
		dndt[4] <-  N2*L24 - N4*S45*phi_t
		dndt[5] <-  N4*S45*phi_t - N5*(S56*phi_t + L58)
		dndt[6] <-  N5*S56*phi_t - N6*(S67*phi_t + L69)
		dndt[7] <-  N6*S67*phi_t
		dndt[8] <-  N5*L58
		dndt[9] <-  N6*L69
		return(list(dndt)) })
}

integrands_defined <- TRUE;
