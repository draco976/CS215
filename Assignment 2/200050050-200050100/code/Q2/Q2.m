rng(0);

set(0,'DefaultFigureVisible','on')

N = [10,100,1000,10000,100000]; % Number of Observations 

mu = [1;2]; % Mean

cov_matrix=[1.6250,-1.9486;-1.9486,3.8750]; % Covariance Matrix

% Calculating matrix A such that A(A')=C
a = sqrt(1.6250);
b = -1.9486/a;
c = sqrt(3.8750-b.*b);

A = [a,0;b,c]; % AA' = C 

errors_mean = zeros(5,100);
errors_var = zeros(5,100);

for i=1:5
    
    for j=1:100
        gen = A*randn(2,N(1,i))+mu; % Generated values
        estimate_mean = sum(gen,2)/N(1,i); % Estimated Mean
        estimate_variance = (gen-estimate_mean)*((gen-estimate_mean).')/(N(1,i)); % Estimated Variance

        err_mean = norm(mu-estimate_mean)/norm(mu); % Error in Estimated Mean
        err_cov = norm(cov_matrix-estimate_variance,'fro')/norm(cov_matrix,'fro'); % Error in Estimated Covariance Matrix 

        errors_mean(i,j) = err_mean;
        errors_var(i,j) = err_cov;
    end

end

fig1=figure();
boxplot(errors_mean.')
xlabel('log(N) at base 10')
ylabel('Mean Error Measure')
title('Mean Error')
%saveas(fig1,'Q2_MeanError.png')

fig2=figure();
boxplot(errors_var.')
xlabel('log(N) at base 10')
ylabel('Covariance Error Measure')
title('Covariance Error')
%saveas(fig2,'Q2_CovarianceError.png')

for i=1:5
    gen = A*randn(2,N(1,i))+mu; % Generated values
    estimate_mean = sum(gen,2)/N(1,i); % Estimated Mean
    estimate_variance = (gen-estimate_mean)*((gen-estimate_mean).')/(N(1,i)); % Estimated Variance
    [eigenvectors,eigenvalues] = eig(estimate_variance);

    figure;
    scatter(gen(1,:),gen(2,:),'filled');
    xlim([-8 12])
    ylim([-8 12])
    stx = estimate_mean(1,1);
    sty = estimate_mean(2,1);
    end1mat = (eigenvectors(:,1).*sqrt(eigenvalues(1,1)))+estimate_mean;
    end2mat = (eigenvectors(:,2).*sqrt(eigenvalues(2,2)))+estimate_mean;

    line([stx end1mat(1,1)],[sty end1mat(2,1)],'Color','red','LineWidth',2)
    line([stx end2mat(1,1)],[sty end2mat(2,1)],'Color','red','LineWidth',2)    
end