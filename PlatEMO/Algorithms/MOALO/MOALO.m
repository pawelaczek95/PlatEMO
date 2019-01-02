function MOALO(Global)
% <algorithm> <M>
% Multi-objective ant lion optimizer
% div --- 10 --- The number of divisions in each objective

%------------------------------- Reference --------------------------------
% Mirjalili, Seyedali, Pradeep Jangir, and Shahrzad Saremi, Multi-objective 
% ant lion optimizer: a multi-objective optimization algorithm for solving 
% engineering problems, Applied Intelligence, 2017, 79-95.
%--------------------------------------------------------------------------

    %%
    div = Global.ParameterSet(10);
    
    %%
    Population = Global.Initialization();
    Archive    = UpdateArchive(Population, Global.N, div);
    
    %%
    while Global.NotTermination(Archive)
        Random     = datasample(Archive, Global.N); % random antlions from archive
        Elite      = REPSelection(Archive.objs, Global.N, div); % elite antlions ind from archive
        Population = ALO(Population, Random, Archive(Elite), Global.lower, Global.upper, Global.gen, Global.maxgen);
        Archive    = UpdateArchive([Archive, Population], Global.N, div);
    end
end

