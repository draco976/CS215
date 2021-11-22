clc ;
clear ;

set(0,'DefaultFigureVisible','off')

% Loading data
imagefiles = dir('data_fruit/*.png') ;      
nfiles = length(imagefiles) ;    % Number of files found

data = zeros(80*80*3,nfiles) ;

for ii=1:nfiles
   filename = imagefiles(ii).name ;
   fullFileName = fullfile('data_fruit', filename);
   imagedata = imread(fullFileName);
   
%    Reshaping the data into a vector of length 19200
   data(:,ii) = im2double(reshape(imagedata, 80*80*3, 1, 1)) ;
end

% Finding mean of the daaset
mu = zeros(80*80*3,1) ;

for ii=1:nfiles
   mu = mu + data(:,ii)/nfiles ;
end

data = data-mu ;

% Mean Image
figure ;
subplot(1,5,1) ;
image(rescale(reshape(mu, 80, 80, 3))) ;
title('Mean') ;
axis equal ;
axis tight ;

% Finding Covariance matrix 
C = zeros(19200,19200) ;

for i=1:nfiles
    C = C + data(:,i)*data(:,i)'/nfiles ;
end

% Getting Top 10 eigenvalues and corresponding eigenvectors 
[v, lambda] = eigs(C, 10);

% Images of top 4 principle eigenvectors
for i=1:4
    subplot(1,5,i+1) ;
    image(rescale(reshape(v(:,i), 80, 80, 3))) ;
    title('Eigenvector '+string(i)) ;
    axis equal ;
    axis tight ;
end
saveas(gcf,'Q6_MeanAnd4Eigenvectors.png') ;

% Plot of top ten eigenvectors 
figure ;
plot(diag(lambda),'o-') ;
xlabel('Component Number') ;
ylabel('Eigenvalue') ;
saveas(gcf,'Q6_eigenvalues.png') ;

for i=1:nfiles
    figure ;
    subplot(1,2,1) ;
    image(rescale(reshape(data(:,i)+mu, 80, 80, 3))) ;
    title('original') ;
    axis equal ;
    axis tight ;
    
%     Projected image on 4 principle eigenvectors

    subplot(1,2,2) ;
%     Generated image = Projection of image along the eigenvectors + mean of the data
    img = v(:,1:4)*v(:,1:4)'*data(:,i) + mu ;
    image(rescale(reshape(img, 80, 80, 3))) ;
    title('regenerated');
    axis equal ;
    axis tight ;
    saveas(gcf,'Q6_fruit'+string(i)+'.png') ;
end

% Random Number Generator Seed
rng(0) ;

% Generating New fruit Images
lambda(1:4,1:4)
figure ;
for i=1:3
    subplot(1,3,i) ;
    img = mu ;
%     Adding Eigenvector multipled by a random variable 
    for j=1:4
        img = img + sqrt(lambda(j,j))*v(:,j)*randn ;
    end
    image(rescale(reshape(img, 80, 80, 3))) ;
    axis equal ;
    axis tight ;
end
saveas(gcf,'Q6_generated_fruits.png') ;





