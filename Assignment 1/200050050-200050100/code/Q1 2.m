%Part 1 (Laplace PDF)

interval=0.001; %Setting the width of the Riemann Boxes

xa = -25:interval:29; %Setting the length over which 
%the graph is to be plotted

%Defining the probability density function

mu = 2 ;
b = 2 ;
val=1/(2*b) * exp(-abs(xa-mu)/b) ; %Finding values of pdf corresponding to xa

fig1=figure(1);
plot(xa,val,'linewidth',2) %Plotting the probability density function
fig2=figure(2);
val=val*interval;
plot(xa,cumsum(val),'linewidth',2) %Using cumulative sum to calculate the 
%Riemann Sum Approximation

M=double(sum(xa.*val)); %Calculating Mean
E=double(sum((xa.*xa).*val)); %Calculating Mean of Squares

Var=E-M*M %Finding Variance

%Part 2 (Gumbel PDF)

xa=-15:interval:30; %Setting the length over which 
%the graph is to be plotted

%Defining the probability density function

mu = 1 ;
beta = 2 ;
val=exp(-(xa-mu)/beta-exp(-(xa-mu)/beta))/beta ; %Finding values of pdf corresponding to xa

fig3=figure(3);
plot(xa,val,'linewidth',2) %Plotting the probability density function
fig4=figure(4);
val=val*interval;
plot(xa,cumsum(val),'linewidth',2) %Using cumulative sum to calculate the 
%Riemann Sum Approxinmation

M=double(sum(xa.*val)); %Calculating Mean
E=double(sum((xa.*xa).*val)); %Calculating Mean of Squares 

Var=E-M*M %Calculating Variance

%Part 3 (Cauchy PDF)

xa=-70:interval:70; %Setting the length over which 
%the graph is to be plotted

%Defining the probability density function

x0 = 0 ;
gamma = 1 ;
val=1/(pi*gamma) * (gamma.^2 ./ ((xa-x0).^2 + gamma.^2)) ; %Finding values of pdf corresponding to xa

fig5=figure(5);
plot(xa,val,'linewidth',2) %Plotting the probability density function
fig6=figure(6);
val=val*interval;
plot(xa,cumsum(val),'linewidth',2) %Using cumulative sum to calculate the 
%Riemann Sum Approxinmation

%Variance is undefined, so not computed