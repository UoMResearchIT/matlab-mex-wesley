function k = VatisasCore(h,rc,n)

% if the algebraic is not specifed use n=2 by default
if nargin == 2
    n = 2;
end 

% power term
two_n = 2*n; 

% denominator
denominator = h^two_n + rc^two_n;

% velocity correction
if denominator == 0
    k = 0;
else    
    k = h^2/denominator^(1/n);
end 

end 