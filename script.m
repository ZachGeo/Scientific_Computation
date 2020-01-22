
% Author: GEORGOPOULOS ZACHARIAS, ал: 235735, DATE: 11/1/2020    

p = [1,14,71,154,120];

% Explicit Section:

% Dimioyrgia monadiaioy dianysmatos b, 
% megethoys oso to matrix M1.
c = ones(length(C),1);
% To matrix C (ч P1 ч P2 ч P3 ч M1) toy erwthmatos 3.1 to anathetw sto A,
% etsi wste parakatw na trexei h synarthsh moy
% polyvalm_MV me ta antistoixa orismata.
A = C;
    

% Apo thn stigmh poy to c einai monadiaio
% dianysma, tote to p(A)*c = p(A).
% Ara b = p(A)
b = polyvalm_MV(p,A,c);
% Ypologismos C = p(A), me xrhsh ths 
% Matrix polynomial evaluation (Function).
C = polyvalm(p,A);

   
% Ypologismos C*x=b, me xrhsh anapodhs kathetoy.
% Xekinaw thn xronometrhsh.
tic
for times = 1:20
    x = C\b;
end
t1 = toc/20;
% Stamataw thn xronometrhsh.

% Ypologismos sfalmatos.
e1=norm(x-c,2);
    
% Serial Section:
% Ypologismos rizwn toy p(z).
r = roots(p);
k = length(A);
I = eye(k);

% Xekinaw thn xronometrhsh.
tic
for times = 1:20
    y = b;
    for j = 1:length(r)
        l = length(r)-j+1;
        % Ypologismos me anapodh katheto.
        z = (A - r(l)*I)\y;
        y = z;
    end
end
t2 = toc/20;
% Stamataw thn xronometrhsh.

% Ypologismos sfalmatos.
e2=norm(z-c,2);

% PCG Method.

% Thelw na epityxw sfalma mikrotero toy 1e-7 gia na
% thewrhtei epityxhs mia methodos. Gi'ayto thetw thn metavlhth
% tol.
tol = 1e-7;
% An exw epanalhptikh methodo thelw na epitygxanw to parapanw
% sfalma se ligoteres apo 50 epanalhpseis. Gi'ayto thetw thn metavlhth
% maxit.
maxit = 50;

% XWRIS PRORRYTHMISH.

% Xekinaw thn xronometrhsh.
tic
for times = 1:20
    y = b;
    for j = 1:length(r)
       l = length(r)-j+1;
       P1 = (A - r(l)*I);
       p1 = pcg(P1,y,tol,maxit);
    end
end
t3 = toc/20;
% Stamataw thn xronometrhsh.

% Ypologismos sfalmatos.
e3=norm(p1-c,2);

% ME PRORRYTHMISH BLOCK JACOBI.

c = size(C);
M = zeros(c(1),c(2));
% Dhmioyrgia diagwnioy matrix M me times diagwnioy,
% tis antistoixes toy matrix C
for i = 1:c(1)
    for j = 1:c(2)
        if i == j
            M(i,j) = C(i,j);
        end
    end
end

% Xekinaw thn xronometrhsh.
tic
for times = 1:20
    y = b;
    for j = 1:length(r)
       l = length(r)-j+1;
       P2 = (A - r(l)*I);
       p2 = pcg(P2,y,tol,maxit,M);
    end
end
t4 = toc/20;
% Stamataw thn xronometrhsh.

% Ypologismos sfalmatos
e4=norm(p2-c,2);