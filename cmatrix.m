
% Author: GEORGOPOULOS ZACHARIAS, ал: 235735, DATE: 7/1/2020

% Ypologismos 1ou Matrix.
n = 1000;
C = zeros(n);
th = 1/2;

for i=1:n
    for j=1:n
        % Ypologismos Diagwniwn stoixeiwn.
        if i==j
            C(i,j)=1+i.^th;
        % Ypologismos twn ypoloipwn stoixeiwn toy matrix.
        else
            C(i,j)= 1/(abs(i-j).^2);
        end
    end
end

% Ypologismos 2ou Matrix.
% (m,n) = (100,10)
m1 = 100;
n1 = 10;
In1 = eye(n1);
Tm1 = toeplitz([30 -16 1 zeros(1,m1-3)]);
Sn1 = toeplitz([24 -12 zeros(1,n1-2)]);
Im1 = eye(m1);
P1 = sparse(kron(In1,Tm1) + kron(Sn1,Im1));

% Ypologismos 3ou Matrix.
% (m,n) = (10,100)
m2 = 10;
n2 = 100;
In2 = eye(n2);
Tm2 = toeplitz([30 -16 1 zeros(1,m2-3)]);
Sn2 = toeplitz([24 -12 zeros(1,n2-2)]);
Im2 = eye(m2);
P2 = sparse(kron(In2,Tm2) + kron(Sn2,Im2));

% Ypologismos 4ou Matrix.
% (m,n) = (100,100)
m3 = 100;
n3 = 100;
In3 = eye(n3);
Tm3 = toeplitz([30 -16 1 zeros(1,m3-3)]);
Sn3 = toeplitz([24 -12 zeros(1,n3-2)]);
Im3 = eye(m3);
P3 = sparse(kron(In3,Tm3) + kron(Sn3,Im3));

% Load Matrix bcsstm07.
B = load('bcsstm07.mat','-mat');
M1=B.Problem.A;

% Load Matrox email.
E = load('email.mat','-mat');
M2=E.Problem.A;