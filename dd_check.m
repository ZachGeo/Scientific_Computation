function [dflag,discrC,discrR] = dd_check(A)
% Author: GEORGOPOULOS ZACHARIAS, ал: 235735, DATE: 6/1/2020

% Mikos rows kai columns tou matrix A.
[numRows,numCols] = size(A);
discrC = 0;
discrR = 0;

% Dianysma sthlh poy periexei ta stoixeia 
% ths kyrias diagwnioy toy matrix A.
a = diag(A,0);
% Pairnw tis apolytes times toy vector a.
a = abs(a);

% Elegxw an to matrix A einai DK kata grammes.
adkR = 0;
for i = 1:numRows
    % Athroisma kata apolyth timh twn stoixeiwn ths i-osths grammhs.
    s1 = sum(abs(A(i,:)));
    % Elegxos an to i-osto stoixeio ths diagwnioy einai megalytero
    % apo to athroisma twn stoixeiwn ths antistoixhs grammhs.
    if (s1 - a(i)) < a(i)
        discrR = discrR+1;
    else
        % Elegxos Aysthrhs DK.
        if(s1 - a(i)) == a(i)
         discrR=discrR+1;
         % Timh gia endeixh oti den yparxei ADK.
         adkR = 1;
        end
    end
end

% Elegxw an to matrix A einai ADK kata sthles.
adkC = 0;
for i = 1:numCols
    % Athroisma kata apolyth timh twn stoixeiwn ths i-osths sthlhs.
    s2 = sum(abs(A(:,i)));
    % Elegxos an to i-osto stoixeio ths diagwnioy einai megalytero 
    % apo to athroisma twn stoixeiwn ths antistoixhs sthlhs.
    if (s2 - a(i)) < a(i)
        discrC = discrC+1;
    else
        % Elegxos Aysthrhs DK.
        if(s2 - a(i)) == a(i)
         discrC = discrC+1;
         % Timh gia endeixh oti den yparxei ADK.
         adkC = 1;
        end
    end
end

% An DK kata grammes kai sthles, tote dflag = 1.
if discrR == numRows && discrC == numCols
    dflag = 1;
    
    % An oxi ADK kata grammes, tote discrR = 0.
    if adkR == 1
        discrR = 0;
    end
    % An oxi ADK kata sthles, tote discrC = 0.
    if adkC == 1
        discrC = 0;
    end
else
    dflag = 0;
end

end