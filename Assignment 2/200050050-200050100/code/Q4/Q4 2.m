clc ;
clear ;

set(0,'DefaultFigureVisible','off')

% Loading Data
load('MNIST.mat') ;

% Reshaping Data
data = im2double(reshape(digits_train, 28*28, 1, [])) ;

% imshow(reshape(data(:,:,1),28,28))

for j=0:9
    data1 = data(:, :, labels_train==j) ;
    M = length(data1) ;
    
    % Finding mean
    mu = zeros(784,1) ;

    for i=1:M
         mu = mu + data1(:,:,i)/M ;
    end

    % Finding Covariance matrix 
    C = zeros(784,784) ;
    
    data1 = data1-mu ;

    for i=1:M
        C = C + data1(:,:,i)*data1(:,:,i)'/M ;
    end

    % Finding Principle mode of variation
    [v1, lambda1] = eigs(C, 1);

    e = eig(C) ;
    e = sort(e, 'descend');
    
    % Digit images
    figure ;
    subplot(1,3,1) ;
    imshow(reshape(mu-sqrt(lambda1)*v1,28,28),'InitialMagnification', 600) ;
    axis equal ;
    axis tight ;
    title("\mu-sqrt(\lambda_1)*v_1") ;
    
    subplot(1,3,2) ;
    imshow(reshape(mu,28,28),'InitialMagnification', 600) ;
    axis equal ;
    axis tight ;
    title("\mu") ;
    
    subplot(1,3,3) ;
    imshow(reshape(mu+sqrt(lambda1)*v1,28,28),'InitialMagnification', 600) ;
    axis equal ;
    axis tight ;
    title("\mu+sqrt(\lambda_1)*v_1") ;
    saveas(gcf,'Q4_'+string(j)+'.png')
      
%    Plotting Eigenvalues
    figure ;
    plot(e) ;
    xlabel('Component Number') ;
    ylabel('Eigenvalue') ;
    ylim([-1 9])
    saveas(gcf,'Q4_'+string(j)+'eigen.png') ;
    
%    Calculating significant modes of variation 
    sum(e>=1) 
    
end

 




