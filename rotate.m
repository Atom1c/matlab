filename = 'im.jpg'
I = imread(filename);
[im loc]=rot(I);
imshow(im);
%eps=0.0001
l=size(im);
%while abs(ang)>0.1
t = maketform('projective',[1 1;300 1;300 300;1 300],[20 20;300 20; 300 300;20 300]);
r=makeresampler('cubic','circular');
outputImage = imtransform(im,t);
%im=outputImage;
%imshow(outputImage);
%im1=rot(outputImage);
%imshow(im1)
%I=outputImage;

level=graythresh(I) -0.15
BW=im2bw(I,level);
BW = edge(BW, 'prewitt',level);
[H,theta,rho] = hough(BW);
P = houghpeaks(H,5,'Threshold', 0.5*max(H(:)));
x = theta(P(:,2)); 
y = rho(P(:,1));
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',30);
%figure, imshow(I), hold on
max_len = 0;
lenline=[]
for k = 1:length(lines)
    lenline=[lenline sqrt(abs((lines(k).point1(1)-lines(k).point2(1))^2 + (lines(k).point1(2)-lines(k).point2(2))^2))]
   xy = [lines(k).point1; lines(k).point2];
   % Определение конечной точки
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
[xmax,imax]=max(lenline)
lenline(imax)=0
[xmax1,imax1] =max(lenline)
a=sqrt(abs((lines(imax).point1(1)-lines(imax).point2(1))^2 + (lines(imax).point1(2)-lines(imax).point2(2))^2))
b=sqrt(abs((lines(imax).point1(1)-lines(imax).point2(1))^2 + (lines(imax).point1(2)-lines(imax).point1(2))^2))

a2 = sqrt(abs((lines(imax1).point1(1)-lines(imax1).point2(1))^2 + (lines(imax1).point1(2)-lines(imax1).point2(2))^2))
b2 = sqrt(abs((lines(imax1).point1(1)-lines(imax1).point2(1))^2 + (lines(imax1).point1(2)-lines(imax1).point1(2))^2))
fi=real(acos(b/a))*180/pi
fi2 = real(acos(b2/a2))*180/pi
%i1=imrotate(outputImage,ang,'bilinear');
imshow(outputImage)
