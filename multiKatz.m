function [X] = multiKatz(M2,alpha,mth,pcg__parms)
% Author: GEORGOPOULOS ZACHARIAS, ал: 235735, DATE: 16/1/2020

% л2 einai to mhtrwo email toy erwthmatos 3.1 .
% Dhmiourgia toy matrix I poy ta diagwnia stoixeia toy einai ola 1.
% Dhmioyrgia toy monadiaioy vector e. 
I = eye(length(M2));
e = ones(length(M2),1);
%alpha = (0.01:0.01:1);

% Xronometrhsh.
tic
for j = 1:5
    x = [];
    X = [];
    M = [];
    valid = [];

    % Gia osa alpha exw, ypologizw:
    for i = 1:length(alpha)
        % Gia ena sygkekrimeno alpha ypologizw to matrix л.
        M = (I-alpha(i)*M2);
        
        % An to matrix л poy vrhka apo panw exei orizousa diaforh toy 0,
        % tote einai antistrepsimo.
        if det(M)~=0
            
            % An h methodos epilyshs poy tha xrhsimopoihsoyme einai h 
            % anapodh kathetos.
            if mth == "direct"
                % Pragmatopoiw thn epilysh toy systhmatos, me anapodh 
                % katheto.
                % (I - alpha*л2)*x = e => x = (и-alpha*M2)*e
                x = M\e;
                
             % An h methodos epilyshs poy tha xrhsimopoihsoyme einai Г pcg.   
            elseif mth == "pcg"
                % Parametroi poy edwsa ws orismata gia thn pcg.
                tol = pcg__parms{1};
                maxit = pcg__parms{2};
                % Ektelesh ths pcg.    
                [x,flag,relres,iter] = pcg(sparse(M),e,tol,maxit);
            end
        
            % An ola ta stoixeia toy dianysmatos toy vector x einai thetika.
            if all((x)>0)
                % H timh toy alpha gia thn opoia ypologisa to
                % parapanw systhma einai egkyrh kai thn "eisagw"
                % sto vector valid, to opoio periexei oles tis  
                % egkyres times.
                valid = [valid,alpha(i)];
                % Gia kathe timh toy alpha, h opoia einai valid, "eisagw"
                % sto matrix X to vector x, apo thn epilysh toy systhmatos.
                X = [X,x];
            end
        end
    end
    t = toc/5;
end
