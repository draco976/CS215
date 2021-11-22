rng(0)
%Part 1
res_part1=zeros([1,100000]); %To store the res_part2s of Part 1
for i=1:100000
    res_part1(1,i)=random_M(); 
    %Store 1e5 values of the distribution and plot 
    %histogram and cdf using these
end
fig1=figure(1);
histogram(res_part1,200) %Histogram with 200 bins
%saveas(fig1,'Q4_Histogram.png');
fig2=figure(2);
cdfplot(res_part1) %CDF Plot
%saveas(fig2,'Q4_CDF.png');
%For functions, refer to end of code
%Part 2
N=[1,2,4,8,16,32,64]; %Array storing the data set sizes
res_part2=zeros([7,10000]);
for i=1:7 %For each of the data set sizes
    for j=1:10000 %Calculate the random variable Y 1e4 times
        tmp=N(1,i);
        res_part2(i,j)=random_Y(tmp); %Store the values in res_part2
    end
end
%Functions to plot each of the histograms (with 200 bins) and save them
fig3=figure(3);
nexttile ;
histogram(res_part2(2:2,:),200)
title('N = 2') ;
%saveas(fig3,'Q4_Histogram_N=2');
nexttile ;
histogram(res_part2(3:3,:),200)
title('N = 4') ;
%saveas(fig3,'Q4_Histogram_N=4');
nexttile ;
histogram(res_part2(4:4,:),200)
title('N = 8') ;
%saveas(fig3,'Q4_Histogram_N=8');
nexttile ;
histogram(res_part2(5:5,:),200)
title('N = 16') ;
%saveas(fig3,'Q4_Histogram_N=16');
nexttile ;
histogram(res_part2(6:6,:),200)
title('N = 32') ;
%saveas(fig3,'Q4_Histogram_N=32');
nexttile ;
histogram(res_part2(7:7,:),200)
title('N = 64') ;
%saveas(fig3,'Q4_Histogram_N=64');
%Plotting the cdf curves for each of the data set sizes
fig4=figure(4);
for i=1:7
    cdfplot(res_part2(i:i,:))
    hold on;
end
legend('N=1','N=2','N=4','N=8','N=16','N=32','N=64')
%saveas(fig4,'Q4_CDF_Different_N');
%Function to generate random draws of Y (Part 2)
function g=random_Y(N)
    g=0;
    for i=1:N
        g=g+random_M();
    end
    g=g/N;
    %We find the average of g over n calls of random_M()
end
%Function to generate random draws of X (Part 1)
function f=random_M()
    %Calculated using Inverse Transform Sampling
    %Description given in report
    f=rand(); %f is any number in [0,1] with uniform distribution
    
    %Returning the value of the inverse of the CDF at f
    
    if 2*f-1>0
        f=(2*f-1)^0.5;
    else
        f=-(1-2*f)^0.5;
    end
end