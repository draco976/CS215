% Q3 PCA
clc ;
clear ;

% Load data
load('points2D_Set1.mat') ;
% load('points2D_Set2.mat') ;

N = length(x) ;

% Transforming data to get mean as 0
mu_x = 0 ;
mu_y = 0 ;

for i=1:N
   mu_x = mu_x + x(i)/N ;
   mu_y = mu_y + y(i)/N ;
end

x1 = x - mu_x ;
y1 = y - mu_y ;

z = [x1(:), y1(:)] ;


% Finding Covariance matrix 
C = [0, 0; 0, 0] ;

for i=1:N
    C = C + z(i,:)'*z(i,:)/N ;
end

% Eigen decomposition
[V, D] = eig(C) ;

if D(2,2)>D(1,1)
    v = V(:,2) ;
else 
    v = V(:,1) ;
end 

% Plotting
fig=scatter(x,y) ;
hold on ;
x2 = linspace(min(x),max(x),1000) ;
y2 = v(2)/v(1) * (x2-mu_x) + mu_y ;
plot(x2,y2) ;
hold off ;

% error calculation
error = 0 ;
size(z(1,:)')
for i=1:N 
    error = error + (z(i,:)*z(i,:)'-(z(i,:)*v)^2)/N ;
end

error
    


