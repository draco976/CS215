rng(0)

%Calculation for part 1 begins
N1 = 1e6 ;

x=poissrnd(3,1,N1); %Poisson Distribution with rate=3
y=poissrnd(4,1,N1); %Poisson Distribution with rate=4
z=x+y; %Making the random variable z from x and y

for i=0:25
    X=sprintf('P(Z=%d) = %d',i,sum(z(:)==i));
    disp(X)
    %Counting the number of occurrences of each number from 0 to 25 in z
end

%Calculation for part 2 begins
N2 = 1e5 ;

y=poissrnd(4,1,N2); %Poisson Distribution with rate = 4

z=zeros([1 N2]); %To store the Random Variable Z derived from Y

for i=1:N2
   z(1,i)=binornd(y(1,i),0.8); 
   %Calculating Z from Y, by taking only a part of the particles arriving
   %which is decided by binomial distribution
end

M=sprintf('Distribution for Part B\n');
fprintf(M)

for i=0:25
    X=sprintf('P(Z=%d) = %d',i,sum(z(:)==i));
    disp(X)
    %Counting occurrences of each number from 0 to 25 in z 
end