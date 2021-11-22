rng(0);

%Array for dataset sizes
N=[5,10,20,40,60,80,100,500,1000,10000];

%Number of repetitions
M=100;

pdf=makedist('Normal'); %Making normal distribution
%By default parameters are mu=0 and sigma=1

result=zeros([M,10]);

for i=1:10
    for j=1:M
        sample=random(pdf,1,N(1,i));
        %Generating array of N(1,i) random numbers, total of M times
        result(j,i)=abs(mean(sample));
        %Taking absolute error between computed and true mean, and storing 
        %it 
    end
end

fig=figure;
boxplot(result,N)
saveas(fig,'Q5_Gaussian_Box_Plot.png')
%Plotting the final result