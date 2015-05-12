filename = 'pro1.png'
I = imread(filename);
figure(1),
imshow(I);
level=graythresh(I)
BW=im2bw(I,level);
BW = edge(BW,'canny');
[H,theta,rho] = hough(BW);
%figure(2),
%imshow(H,[],'XData',theta,'YData',rho,...
   %     'InitialMagnification','fit');
   %xlabel('\theta'), ylabel('\rho');
   %axis on, axis normal, hold on;
    P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
    x = theta(P(:,2)); 
    y = rho(P(:,1));
    %plot(x,y,'s','color','white');
    lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);
    %figure, imshow(I), hold on
    max_len = 0;
    for k = 1:length(lines)
	       xy = [lines(k).point1; lines(k).point2];
	          %plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

		     % Отображение начала и конца линий
		       % plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
		          %plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

			     % Определение конечной точки
			        len = norm(lines(k).point1 - lines(k).point2);
				   if ( len > max_len)
					         max_len = len;
						       xy_long = xy;
						          end
						  end

						  a=sqrt(abs((lines(1).point1(1)-lines(1).point2(1))^2 + (lines(1).point1(2)-lines(1).point2(2))^2))
						  b=sqrt(abs((lines(1).point1(1)-lines(1).point2(1))^2 + (lines(1).point1(2)-lines(1).point1(2))^2))
						  fi=real(acos(b/a))*180/pi
						  i1=imrotate(I,-fi,'bilinear');
						  figure(2),imshow(i1)

