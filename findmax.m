function ans= findmax( lenline )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[xmax,imax]=max(lenline)
lenline(imax)=0
[xmax1,imax1] =max(lenline)
ans = [xmax1,imax1]
end

