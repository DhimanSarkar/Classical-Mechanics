x=[0 50 100 150 200];
y=[0 .8 1.8 3.15 4.4]


x0 = 0;
y0 = 0;


x = x(:); %reshape the data into a column vector
y = y(:);
% 'C' is the Vandermonde matrix for 'x'
n = 1; % Degree of polynomial to fit
V(:,n+1) = ones(length(x),1,class(x));
for j = n:-1:1
     V(:,j) = x.*V(:,j+1);
end
C = V;
% 'd' is the vector of target values, 'y'.
d = y;
% There are no inequality constraints in this case, i.e., 
A = [];
b = [];
% We use linear equality constraints to force the curve to hit the required point. In
% this case, 'Aeq' is the Vandermoonde matrix for 'x0'
Aeq = x0.^(n:-1:0);
% and 'beq' is the value the curve should take at that point
beq = y0;
p = lsqlin( C, d, A, b, Aeq, beq )
% We can then use POLYVAL to evaluate the fitted curve
yhat = polyval( p, x );
% Plot original data
plot(x,y,'.b-') 
hold on
% Plot point to go through
plot(x0,y0,'gx','linewidth',4) 
% Plot fitted data
plot(x,yhat,'r','linewidth',2) 
hold off