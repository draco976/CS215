rng(0)

%Part 1

steps = binornd(1000,0.5,1,10000); 
%Modelling 1000 steps as a binomial distribution, and taking the "ones"
%to be steps to the right and "zeroes" to be steps to the left

dist=double((steps/500)-1);
%As length of each step is 0.001, and considering x steps to the right,
%Final location=x*0.001-(1000-x)*0.001 (x steps to right,1000-x to left)
%So, Final Location=x/500-1

edges=-0.3:0.01:0.3;
%Defining a step of 0.01 (So that graph may be seen clearly, defined over
%an interval or -0.3 to 0.3 as towards the extremes, walkers are almost 0.

fig1=figure(1);

histogram(dist,edges)
%Plotting the histogram
%saveas(fig1,"Q3_Histogram.png");
%Saving the histogram

%Part 2

fig2=figure(2);

%Running a loop for each of the 1000 walkers
for i=1:1000
    %Generating 1000 instances of Bernoulli Random Variable where 1
    %represents step to the right and 0 represents a step to the left
    direction_of_step_taken=binornd(1,0.5,1,1000);
    
    %Cumulative sum gives the total steps taken to the right after given
    %number of steps
    total_steps_taken_to_the_right=cumsum(direction_of_step_taken);
    
    %Creating a final array to actually store the distances
    final_dist=zeros([1,1000]);
    for j=1:1000
       final_dist(1,j)=double(total_steps_taken_to_the_right(1,j)/500.0-j/1000.0);
       %This formula has already been explained in Part 1
    end
    %Plotting the distance
    plot(final_dist)
    %Making sure that all plots are plotted on the same figure
    hold on;
end

%saveas(fig2,"Q3_Space-Time_Curves.png");
%Saving the final figure

%Part 3 - Mean and Variance

%We shall be using the "dist" variable from Part 1

fprintf("Empirically Computed Mean: %d\n",mean(dist));
fprintf("Empirically Computed Variance: %d\n",var(dist));
