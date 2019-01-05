function I = GetRatio(gen, maxgen)
    I = 1;
    
    if gen > maxgen * 0.1
        I = 1 + 100 * (gen/maxgen);
    elseif gen > maxgen * 0.5
        I = 1 + 1000 * (gen/maxgen);
    elseif gen > maxgen * 0.75
        I = 1 + 10000 * (gen/maxgen);
    elseif gen > maxgen * 0.9
        I = 1 + 100000 * (gen/maxgen);
    elseif gen > maxgen * 0.95
        I = 1 + 1000000 * (gen/maxgen);
    end
end
