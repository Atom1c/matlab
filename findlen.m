function ans = findlen( lines ,imax)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a=sqrt(abs((lines(imax).point1(1)-lines(imax).point2(1))^2 + (lines(imax).point1(2)-lines(imax).point2(2))^2))
b=sqrt(abs((lines(imax).point1(1)-lines(imax).point2(1))^2 + (lines(imax).point1(2)-lines(imax).point1(2))^2))
ans=[a b]
end

