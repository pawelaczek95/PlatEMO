function RW = RandomWalk(Antlion, lower, upper, gen, maxgen, I)
    [N, D] = size(Antlion);
    upper = repmat(upper, N, 1) / I;
    lower = repmat(lower, N, 1) / I;
    
    if rand < 0.5
        lower = lower + Antlion;
    else
        lower = -lower + Antlion;
    end
    
    if rand >= 0.5
        upper = upper + Antlion;
    else
        upper = -upper + Antlion;
    end
    
    for i = 1:D
        X = [0 cumsum(2*(rand(maxgen,1)>0.5)-1)'];
        for j=1:N-1
            X = [X; [0 cumsum(2*(rand(maxgen,1)>0.5)-1)']]; 
        end
        a = min(X, [], 2);
        b = max(X, [], 2);
        c = lower(:, i);
        d = upper(:, i);
        X_norm=((X-a).*(d-c))./(b-a)+c;
        RW(:, i) = X_norm(:, gen);
    end
end
