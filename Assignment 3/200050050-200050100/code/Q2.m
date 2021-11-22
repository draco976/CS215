% Setting seed for random generator
rng(0)

N = [5 10 20 40 60 80 100 500 1000 10000] ;

% Declaring constants
lambda = 5 ;
alpha = 5.5 ;
beta = 1 ;
M = 100 ;


MLE = zeros(length(N), M) ;
PME = zeros(length(N), M) ;

j = 1 ;
for n = N
  
    for i = 1:M
%         Generating data from uniform distribution
        x = rand([n 1]) ;
        
%         Transformation 
        y = -(1/lambda) * log(x) ;
        
%         Maximum Likelihood Estimate
        MLE(j,i) = n/sum(y) ;

%         Posterior Mean Estimate
        PME(j,i) = (1 + (alpha)/n) / (sum(y)/n + beta/n);
        
        
    end
    
    j = j+1 ;
end

% Finding relative error
MLE_error = abs(MLE-lambda)/lambda ;
PME_error = abs(PME-lambda)/lambda ;


% Making a Box Plot

figure ;
boxplot(MLE_error.','Colors','b','Labels',N,'Widths',0.2,'Positions',(1:numel(N)))
hold on;
boxplot(PME_error.','Colors','r','Labels',N,'Widths',0.2,'Positions',(1:numel(N))+0.2)
xlabel("N")
ylabel("Relative Error")
title("Relative Error in Estimates")
plot(NaN,1,'Color','b')
plot(NaN,1,'Color','r')
legend({'MLE Error','MPE Error'})

saveas(gcf,'Q2_Boxplot.png')

