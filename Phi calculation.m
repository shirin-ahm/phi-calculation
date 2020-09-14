clc 
clear
A = [6.9066 6.9546 ];
B = [1211.033 1344.8];
C = [220.79 219.48];
P = 760;
T = 95;
z = [.5 .5 ];
psat = 10.^( A - B./(T+C)) %baraye zarb moalefei bayad . gozasht
k = psat/P

r = @(phi) z(1)*(k(1)-1)./(1+ phi*(k(1)-1)) + ...
                         z(2)*(k(2)-1)./(1+ phi*(k(2)-1)); %@ yani moteghayere mostaghel

phi0 = fzero(r,.5)
x = z./(1+phi0*(k-1))
y = k.*x

phi = linspace(0,1,100) ;        %in ghesmat baraye rasm plot tarif shude ast
R = [z(1)*(k(1)-1)./(1+ phi*(k(1)-1)) + ...
                         z(2)*(k(2)-1)./(1+ phi*(k(2)-1))];
plot(phi ,R )
