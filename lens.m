function lenline = lens( start,lines,k )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
lenline=[start sqrt(abs((lines(k).point1(1)-lines(k).point2(1))^2 + (lines(k).point1(2)-lines(k).point2(2))^2))]
start=lenline

end

