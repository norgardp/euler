# RK Solutions (10-19-2023).r
#
# This R script contains the numerical integration routines that are used for
# the analysis phase of the NIM-B manuscript I have submitted. This version of
# the program considers a Runge-Kutta integration algorithm
#
# Peter Norgard
# 19 October 2023
#

# Define initial conditionsif
init <- c(
	N1=Msamp * Navogadro * (2 / Sm2O3), 	# Sm-152
	N2=0, 									# Sm-153
	N3=0, 									# Sm-154
	N4=0, 									# Eu-153
	N5=0, 									# Eu-154
	N6=0,									  # Eu-155
	N7=0,									  # Eu-156
	N8=0,									  # Gd-155
	N9=0);									# Gd-156

