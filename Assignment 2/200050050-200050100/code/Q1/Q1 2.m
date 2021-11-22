rng(0);

% Part 1

a = 1; %semi_major_axis
b = 0.5; %semi_minor_axis

% Using parametric formula for point inside ellipse centred at origin:
% x= r cos(theta), y=(r/a)*b sin(theta)
% where 0<=r<=a and 0<=theta<2*pi

% Since a is 1, we can directly use rand() function
% to generate random values between 0 and 1

r = sqrt(rand([1,10000000])).*a; % Detailed Explanation of Algorithm given in document     
theta = rand([1,10000000]).*2.*pi; % Detailed explanation of Algorithm given in document

x = r.*cos(theta); % Generating cartesian coordinates from polar coordinates
y = r.*(b/a).*sin(theta); % Generating cartesian coordinates from polar coordinates

fig1=figure()
histogram2(x,y,'DisplayStyle','tile') % Plotting the histogram
xlabel('X Axis')
ylabel('Y Axis')
saveas(fig1,'Q1_0_Ellipse.png');


% Part 2

u = [pi,0]; % Vector u
v = [pi/3,exp(1)]; % Vector v

a = rand([1,10000000]);
b = rand([1,10000000]);

x = [1,0];
y = [1,0];

for i=1:10000000
    if a(1,i)+b(1,i) <= 1 
        x(1,i) = a(1,i).*u(1,1)+b(1,i).*v(1,1) ;
        y(1,i) = b(1,i).*v(1,2) ;
    else
        x(1,i) = (1-a(1,i)).*u(1,1)+(1-b(1,i)).*v(1,1) ;
        y(1,i) = (1-b(1,i)).*v(1,2) ;
    end
end

fig2=figure();
histogram2(x,y,'DisplayStyle','tile')
xlabel('X Axis')
ylabel('Y Axis')
saveas(fig2,'Q1_1_Triangle.png');
