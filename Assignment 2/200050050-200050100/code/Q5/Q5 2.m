clc ;
clear ;

% Loading Data
load('MNIST.mat') ;

% Reshaping Data
data = im2double(reshape(digits_train, 28*28, 1, [])) ;

for j=0:9
% Retrieving digit j from the training data 
    data1 = data(:, :, labels_train==j) ;
    M = length(data1) ;
    
% Finding mean of the data
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

% Getting the 84 dimensional basis v
% Lambda are the eigenvalues corresponding to eigenvectors in v
    [v, lambda] = eigs(C, 84);
    
% Reducing the dimensions of the data by 
% projecting the data onto the hyperplane formed by basis
% Taking the 12th image from the dataset
    data2 = v'*data1(:,:,12) ;
    
% Original Image
    figure ;
    subplot(1,2,1) ;
    imshow(reshape(data1(:,:,12)+mu,28,28),'InitialMagnification', 600) ;
    title('Original Image') ;
    
% Reconstructed Image
    subplot(1,2,2) ;
    imshow(reshape(v*data2+mu,28,28),'InitialMagnification', 600) ;
    title('Reconstructed Image') ;
    saveas(gcf,'Q5_'+string(j)+'.png') ;
end


