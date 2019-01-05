function Offspring = ALO(Population,Random,Elite,upper,lower,gen,maxgen)
    
    %% Parameter setting
    PopulationDec = Population.decs;
    RandomDec     = Random.decs;
    EliteDec      = Elite.decs;
    
    I             = GetRatio(gen, maxgen);
    %% Antlion optimization
    RA = RandomWalk(RandomDec, lower, upper, gen, maxgen, I);
    RE = RandomWalk(EliteDec, lower, upper, gen, maxgen, I);
    OffDec = (RA + RE) / 2;
    Offspring = INDIVIDUAL(OffDec);
end
