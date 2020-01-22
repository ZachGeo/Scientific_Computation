function [r] = polyvalm_MV(p,A,b)
% Author: GEORGOPOULOS ZACHARIAS, ал: 235735, DATE: 7/1/2020
    
    % Megethos tou vector p kai arxikopoihsh metavlitwn.
    n = length(p);
    x = 0;
    Y = 0;
    
    % Algorithm.
    % Epanalhpseis gia ton ypologismo toy antistoixoy syntelesth toy
    % polywnymoy p * to vector b. 
    for i = 1:n
        x = p(i)*b; 
        % An eimaste sthn teleutaia epanalhpsh toy i, tote kane break 
        % kai vges exw apo to for, afou to teleytaio stoixeio toy 
        % polywnymoy den pollaplasiazetai me to matrix A.
        if i == n
            break;
        end
        % Epanalhpseis gia ton ypologismo toy A*p(i), n fores.
        % Dhladh, sto telos aytwn twn epanallhpsewn tha exw ypologisei
        % to (A.^(n-i))*p(i)*b me BLAS-2.
        for j = 1:n-i
            x = A*x;
        end
        % Prosthetw ta dianysmata poy proekypsan,
        % akoloythwntas tis epanalhpseis.
        Y = Y + x;
    end
    % To teliko vector prokyptei apo thn prosthesh toy dianysmatos Y
    % kai toy teleytaioy oroy toy polywnymoy p * toy vector b.
    r = Y + x;
end