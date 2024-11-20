% plots viscosity mu and density rho based on the
% assumptions specified below

% @ Andrea Bistacchi 2016-12-07
% last modified 2024-11-20

% initialize
clear, clc, clf, close all

% print some info
disp('Calculations for a H2O-NaCl model fluid')
disp(' ')
disp('rho. Fluid density calculated using the equations of:')
disp('Driesner (2007). Geochimica et Cosmochimica Acta 71, 4902-4919')
disp('Driesner and Heinrich (2007). Geochimica et Cosmochimica Acta 71, 4880-4901')
disp(' ')
disp('mu: Viscosity referred exclusively to H2O fluid (approximation) and calculated using')
disp('Haar et al, 1984, Steam Tables. Hemisphere Publishing corporation')
disp(' ')
disp('molar fraction NaCl: 0.016')
disp('molar fraction H2O: 0.984')
disp('NaCl: 5 wt%')
disp(' ')

% import data
load mu_rho_plot.mat

% parameters for geothermal gradient profile
rho_rock = 2700;
t_surf = 293.15;
t_grad = 35;
depth = 0:2:16;
lambdaLitho = 1;
lambdaHydro = 0.4;

% calculate geothermal gradient profile
tGeot = t_surf + t_grad * depth;
pGeotLitho = lambdaLitho*depth*1000*9.80665*rho_rock/1e6;
pGeotHydro = lambdaHydro*depth*1000*9.80665*rho_rock/1e6;

% set plot limits
% Tlim = [min(min(T_rho(T_rho>=273.15)),min(T_mu(T_mu>=273.15))) max(tGeot)]; % T in K
% Plim = [min(min(P_rho(P_rho>=10)),min(P_mu(P_mu>=10))) max(pGeotLitho)]; % P in MPa
Tlim = [293.15 800]; % T in K
Plim = [0 400]; % P in MPa
TClim = Tlim - 273.15; % T in °C
PKMlim = Plim/(1000*9.80665*rho_rock)*1e6 % P in km depth

% plot (clabel is used to manually select which countours
% should be labeled)
figure; hold on; grid on; ax = gca; ax.Box = 'on';

[C,H]=contour(T_mu,P_mu,mu'*1000,[10 15 20 30 40 60 80 120 160]*1e-2,'-b','LineWidth',1.5)
clabel(C,H,'manual','Color','b','BackgroundColor','w');

[c,h]=contour(T_rho,P_rho,rho',500:50:1150,'-r','LineWidth',1.5)
clabel(c,h,'manual','Color','r','BackgroundColor','w');

xlabel('T [K]','FontWeight','bold')
ylabel('P [MPa]','FontWeight','bold')

plot(tGeot,pGeotLitho,'--k','LineWidth',2)

plot(tGeot,pGeotHydro,':k','LineWidth',2)

xlim(Tlim)
ylim(Plim)

plot(647,22.064,'ok','MarkerSize',10,'MarkerEdgeColor','k','MarkerFaceColor','c')
text(660,30,'Critical point','FontSize',12)

% gtext('Lithostatic','Rotation',atan2(pGeotLitho(end)-pGeotLitho(1),tGeot(end)-tGeot(1))*180/pi,'FontSize',14,'BackgroundColor','w')
% gtext('Hydrostatic','Rotation',atan2(pGeotHydro(end)-pGeotHydro(1),tGeot(end)-tGeot(1))*180/pi,'FontSize',14,'BackgroundColor','w')

legend({'viscosity [mPa s]','density [kg/m^3]', 'Lithostatic 35K/km 2700kg/m^3', 'Hydrostatic \lambda = 0.4'},'FontSize',12,'Location','northwest')

title('\mu and \rho of an aqueous fluid with molar fraction NaCl = 0.016')
disp('Plotting completed')
disp(' ')

