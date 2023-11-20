# nuclear constants (10-22-2023).r
#
# Nuclear constants used in the numerical analysis.
#
# Peter Norgard
# 19 Oct 2023
#

# Neutron flux magnitude
phi <- 0.8e14;							  # Sample position flux, #/cm^2/s

# Nuclear cross sections
S12 <- 206 *1e-24;						# Sm-152 (n,g) Sm-153
S23 <- 420 * 1e-24;						# Sm-153 (n,g) Sm-154
S45 <- 358 * 1e-24;						# Eu-153 (n,g) Eu-154
S56 <- 1469 * 1e-24;					# Eu-154 (n,g) Eu-155
S67 <- 3760 * 1e-24;					# Eu-155 (n,g) Eu-156

# Decay constants
L24 <- log(2)/(46.28*3600);				# Sm-153/Eu-153
L58 <- log(2)/(8.601*365.25*24*3600);	# Eu-154/Gd-154
L69 <- log(2)/(4.573*365.25*24*3600);	# Eu-155/Gd-155


Navogadro <- 6.02214076e23

constants_defined <- TRUE;
