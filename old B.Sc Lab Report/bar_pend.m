clear;
close;
clc;
figure;
hold on;

r1=[-45 -40 -35 -30 -25 -20 -15 -10 -5]
t1=[1.64 1.56 1.54 1.52 1.54 1.58 1.62 1.99 2.75]

f1=fit(r1.',t1.','gauss2');
plot(f1,r1,t1)

r2=[5 10 15 20 25 30 35 40 45]
t2=[2.75 1.99 1.62 1.58 1.54 1.52 1.54 1.56 1.64]

f2=fit(r2.',t2.','gauss2');

plot(f2,r2,t2)


figure;

t=[1.64 1.56 1.54 1.52 1.54 1.58 1.62 1.99 2.75];
r=[5 10 15 20 25 30 35 40 45];

x=r.*t.^2;
y=r.^2;
f=fit(x.',y.','poly1');
plot(f,x,y);
