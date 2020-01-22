function P = mask_band(n, type, p, q)
% Author: GEORGOPOULOS ZACHARIAS, ал: 235735, DATE: 5/1/2020

% Dimiourgia matrix me diagwnies times 1 kai ypoloipes 0. (Monadiaio).
P = eye(n,n);

if type == "band"
    % An to plithos twn eisodwn einai iso me 3, tote q = p.
    if nargin == 3
        q = p;
    end 
    
    % Kataskeuh anw eurous.
    k=0;
    % Rows iterations.
    for i = 1:n-1
        k = k+1;
        % Columns iterations.
        for j = i+1:q+k
            P(i,j)=1;
        end
    end
    
    a=0;
    % Rows iterations.
    for i = floor(n/2) + 1:n
        a=a+2;
            % Columns iterations.
            for j = i+1:i+q-a
                P(i,j)=1;
            end
    end
    
    % Kataskeuh katw eurous.
    b=1;
    % Rows iterations.
    for i = 2:n
        b=b+1;
        % Columns iterations.
        for j = b-p:n
            if i == j
                break
            end
            if j>0                
                P(i,j)=1;
            end
        end
    end
end

if type == "btdr"
    
    % Elegxos an to p diairei akrivws to n.
    if rem(n,p) ~= 0
        r = round(n/p)-1;
    else
        r = round(n/p);
    end
    
    % Algorithm
    for m = 1:r
        % Ftiaxnw ta diagwnia block pxp matrix.
        % Rows iterations.
        for i = 1+(m-1)*p:p*m
            % Columns iterations.
            for j = 1+(m-1)*p:p*m
                P(i,j)=1;
            end
        end 
        % Ftiaxnw ta ypodiagwnia block pxp matrix.
        % Rows iterations.
        for i = m+p*(m-1):m+2*p-2+m
            % Columns iterations.
            for j = 1+(m-1)*p:p*m+p
                P(i,j)=1; 
            end
        end
        % Ftiaxnw ta yperdiagwnia block pxp matrix.
        % Rows iterations.
        for i = (m-1)*p+1:p+m+1
            % Columns iterations.
            for j = p+m:p+m*p
                P(i,j)=1;
            end
        end
    end
end

% Krataw to matrix megethous nxn.
P = P(1:n,1:n);

end