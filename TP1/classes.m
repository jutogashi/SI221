x = linspace(0.27,12.5,57);
y = linspace(-2,15,57);
[X,Y] = meshgrid(x,y);
Points = [X(:) Y(:)];
dens1 = mvnpdf(Points,mean(x1),cov(x1));
dens1=reshape(dens1,length(y),length(x));
dens2 = mvnpdf(Points,mean(x2),cov(x2));
dens2=reshape(dens2,length(y),length(x));
dens3 = mvnpdf(Points,mean(x3),cov(x3));
dens3=reshape(dens3,length(y),length(x));
class=zeros(57);

for i=1:57
    for j=1:57
        if (dens1(i,j)>=dens2(i,j))&&(dens1(i,j)>=dens3(i,j))
            class(i,j)=1;
        elseif (dens2(i,j)>dens1(i,j))&&(dens2(i,j)>=dens3(i,j))
            class(i,j)=2;
        elseif (dens3(i,j)>dens1(i,j))&&(dens3(i,j)>dens2(i,j))
            class(i,j)=3;
        end
    end
end
%mesh(x,y,dens3.')

%hold on
%contour(x,y,dens1.');
%contour(x,y,dens2.');
contour(x,y,dens3.');
%contour(x,y,class.');
