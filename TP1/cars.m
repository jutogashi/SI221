format long g
s = load('voitures.mat');
cars=s.cars;
c1=find(cars( :,8)==1);
c2=find(cars( :,8)==2);
c3=find(cars( :,8)==3);

class1=cars(c1,[1 5])
class2=cars(c2,[1 5]);
class3=cars(c3,[1 5]);
m1=mean(class1)
s1=cov(class1)
m2=mean(class2)
s2=cov(class2)
m3=mean(class3)
s3=cov(class3)

x = linspace(-100,100,100);
y = linspace(500,6000,100);
[X,Y] = meshgrid(x,y);
Points = [X(:) Y(:)];
dens1 = mvnpdf(Points,m1,s1);
dens1=reshape(dens1,length(y),length(x));
dens2 = mvnpdf(Points,m2,s2);
dens2=reshape(dens2,length(y),length(x));
dens3 = mvnpdf(Points,m3,s3);
dens3=reshape(dens3,length(y),length(x));
class=zeros(100);

for i=1:100
    for j=1:100
        if (dens1(i,j)>=dens2(i,j))&&(dens1(i,j)>=dens3(i,j))
            class(i,j)=1;
        elseif (dens2(i,j)>dens1(i,j))&&(dens2(i,j)>=dens3(i,j))
            class(i,j)=2;
        elseif (dens3(i,j)>dens1(i,j))&&(dens3(i,j)>dens2(i,j))
            class(i,j)=3;
        end
    end
end
%mesh(x,y,class.')

%hold on
%contour(x,y,dens1);
%contour(x,y,dens2);
%contour(x,y,dens3);
contour(x,y,class.');