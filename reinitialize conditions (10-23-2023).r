# Reinitialize Conditions (10-23-2023).r
#
# Update initial conditions with output from a previous solution
#
# Peter Norgard
# 23 October 2023
#

solCols <- 10;
solLength <- length(rk4sol);
last_step <- solLength/solCols;

init <- c(
	N1=rk4sol[last_step,2][[1]],   	# Sm-152
	N2=rk4sol[last_step,3][[1]],		# Sm-153
	N3=rk4sol[last_step,4][[1]],		# Sm-154
	N4=rk4sol[last_step,5][[1]],		# Eu-153
	N5=rk4sol[last_step,6][[1]],		# Eu-154
	N6=rk4sol[last_step,7][[1]],		# Eu-155
	N7=rk4sol[last_step,8][[1]],		# Eu-156
	N8=rk4sol[last_step,9][[1]],		# Gd-155
	N9=rk4sol[last_step,10][[1]]);	# Gd-156

