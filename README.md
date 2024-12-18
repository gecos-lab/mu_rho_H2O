# mu_rho_H<sub>2</sub>O

A [Matlab](https://www.mathworks.com/products/matlab.html) wrapper to [CoolProp](https://github.com/CoolProp/CoolProp/tree/master/wrappers/MATLAB) to calculate and plot viscosity and mass density of an acqueous saline fluid (H2O-NaCl model fluid) for PT values in the Earth crust.

Fluid density is calculated using the equations of: Driesner (2007, Geochimica et Cosmochimica Acta 71, 4902-4919) and Driesner and Heinrich (2007, Geochimica et Cosmochimica Acta 71, 4880-4901).

Viscosity referred exclusively to a pure H2O fluid (approximation) is calculated using Haar et al. (1984, Steam Tables. Hemisphere Publishing Corporation).

**mu_rho_H<sub>2</sub>O** can be used standalone to simply plot tabulated data, but a working version of [CoolProp](https://github.com/CoolProp/CoolProp/tree/master/wrappers/MATLAB) is required if new tables must be produced to extend the plot at different PT or salinity conditions.

@ Andrea Bistacchi 2016
