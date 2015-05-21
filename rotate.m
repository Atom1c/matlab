filename = 'nop.png'
I = imread(filename);
im=rot(I);
imshow(im);
eps=0.0001
ang=100
while abs(ang)>0.01
tform = projective2d([1 0+eps 0; 0 1 0; 2 0 1])
outputImage = imwarp(im,tform);
im=outputImage;
imshow(outputImage);
%im1=rot(outputImage);
%imshow(im1)
I=outputImage;

level=graythresh(I) -0.25
BW=im2bw(I,level);
BW = edge(BW, 'prewitt',level);
[H,theta,rho] = hough(BW);
P = houghpeaks(H,5,'Threshold', 0.5*max(H(:)));
x = theta(P(:,2)); 
y = rho(P(:,1));
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
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
fi=real(acos(b/a))*180/pi
a2 = sqrt(abs((lines(imax1).point1(1)-lines(imax1).point2(1))^2 + (lines(imax1).point1(2)-lines(imax1).point2(2))^2))
b2 = sqrt(abs((lines(imax1).point1(1)-lines(imax1).point2(1))^2 + (lines(imax1).point1(2)-lines(imax1).point1(2))^2))
fi2 = real(acos(b2/a2))*180/pi
ang=abs(fi-fi2)
end
i1=imrotate(outputImage,-ang,'bilinear');
imshow(i1)
