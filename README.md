# euler
Radioisotope growth and decay predicted using forward Euler integration

This software is written using the R language and is intended to demonstrate a neutron-activation driven isotope growth and decay chain. Initial conditions for each isotope under investigation can be specified. Additional growth or decay channels can be implemented as additional differential equations, as required.

The code titled "run_simulation (11-8-2023).r" runs the entire lot of equations. This program requires the R package <b>deSolve</b>, which implements the Runge-Kutta methods in R in a portable way; this includes the Forward Euler and R-K 45 method used in the simulation.

Please cite this software if you use it. 
