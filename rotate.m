filename = 'nop.png'
I = imread(filename);
figure(1),
imshow(I);
level=graythresh(I)
BW=im2bw(I,level);
BW = edge(BW,'canny');
[H,theta,rho] = hough(BW);
 P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
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
					i1=imrotate(I,-fi,'bilinear');
					fi2 = real(acos(b2/a2))*180/pi
					figure(2),imshow(i1)

