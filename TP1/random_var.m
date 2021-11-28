m1 = [4 9];
m2 = [8.5 7.5];
m3 = [6 3.5];
s1 = [2 2 ; 2 5];
s2 = [2 -2; -2 5];
s3 = [7 -4; -4 7];

N=100;
d=2;
x1 = randn(N,d)*chol(s1)+m1;
x2 = randn(N,d)*chol(s2)+m2;
x3 = randn(N,d)*chol(s3)+m3;

plot(x1(:,1),x1(:,2),'r*');
hold on
plot(x2(:,1),x2(:,2),'g*');
hold on
plot(x3(:,1),x3(:,2),'b*');
stats_mean1 = mean(x1)
stats_cov1 = cov(x1)
stats_mean2 = mean(x2)
stats_cov2 = cov(x2)
stats_mean3 = mean(x3)
stats_cov3 = cov(x3)


%[V, S] = eig(c)
%M= V*S*inv(V)
%alpha=atan(2*c(1,2)/(c(1,1)-c(2,2)))/2

