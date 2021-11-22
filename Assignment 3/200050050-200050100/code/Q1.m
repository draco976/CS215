rng(0);

% Size of data sample = N

N = [5,10,20,40,60,80,100,500,1000,10000];

M = 100;

MLE = zeros([length(N) M]);
MAP_1 = zeros([length(N) M]);
MAP_2 = zeros([length(N) M]);

MLE_err = zeros([length(N) M]);
MAP_1_err = zeros([length(N) M]);
MAP_2_err = zeros([length(N) M]);

%Known variance
var = 4*4;

% True Mean
mu = 10;

for i=1:length(N)
    n=N(1,i);

    for j=1:M
        
        %Generating data sample to be used for estimation
        data_sample=4*randn([n 1])+10;
        
        %Calculating summation of all the given data instances
        %for use in calculation of estimates
        data_sum = sum(data_sample,'all');
        
        % Maximum Likelihood Estimate for:-
        % Mean of Gaussian with known variance = Sample Mean
        %                                      = data_sum/n
       
        MLE(i,j) = (data_sum)/n;

        % MAP_1 = (data_sum + var * 10.5)/(var + n)
        % Proof in Report

        MAP_1(i,j) = (data_sum + var * 10.5)/(var + n);
        
        % MAP_2 = (data_sum)/n if 9.5<=(data_sum)/n<=11.5
        %       = 9.5 if (data_sum)/n<9.5
        %       = 11.5 if (data_sum)/n>11.5
        % Proof in report
        
        MAP_2(i,j) = (data_sum)/n;

        if MAP_2(i,j)>11.5
            MAP_2(i,j)=11.5;
        end
        if MAP_2(i,j)<9.5
            MAP_2(i,j)=9.5;
        end
        
        % Calculating Relative Errors
        MLE_err(i,j) = abs(MLE(i,j)-mu)/mu;
        MAP_1_err(i,j) = abs(MAP_1(i,j)-mu)/mu;
        MAP_2_err(i,j) = abs(MAP_2(i,j)-mu)/mu;
    end
end

fig1=figure;
boxplot(MLE_err.','Colors','b','Labels',N,'Widths',0.2,'Positions',(1:numel(N)))
hold on;
boxplot(MAP_1_err.','Colors','r','Labels',N,'Widths',0.2,'Positions',(1:numel(N))+0.2)
hold on;
boxplot(MAP_2_err.','Colors','g','Labels',N,'Widths',0.2,'Positions',(1:numel(N))+0.4)
xlabel("N")
ylabel("Relative Error")
title("Relative Error in Estimates")
plot(NaN,1,'Color','b')
plot(NaN,1,'Color','r')
plot(NaN,1,'Color','g')
legend({'MLE Error','MAP1 Error','MAP2 Error'})
saveas(fig1,"Q1_Boxplot.png")