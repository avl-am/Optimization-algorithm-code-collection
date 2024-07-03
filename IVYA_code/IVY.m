%%      Optimization based on the smart behavior of plants with its engineering applications: %%
%%                               Ivy Algorithm (IVYA)                                         %%
%%                    Mojtaba Ghasemi, Mohsen Zare, Pavel Trojovský,                          %%
%%              Ravipudi Venkata Rao, Eva Trojovsk´,Venkatachalam Kandasamy                   %%
%%                           Knowledge-Based Systems (2024)                                   %%
%%                   DOI:https://doi.org/10.1016/j.knosys.2024.111850                         %%
%%                        https://www.optim-app.com/projects/ivya                             %%
%%             visit our website for more algorithms and their source code:                   %%
%%                             https://www.optim-app.com                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Destination_fitness,Destination_position,Convergence_curve]=IVY(N,Max_iteration,lb,ub,dim,fobj)


CostFunction = @(x) fobj(x);

VarMin = lb;       %Variables Lower Bound
VarMax =ub ;       %Variables Upper Bound

%% IVYA Parameters

MaxIt = Max_iteration;        % Maximum Number of Iterations
nPop = N;                     % Population Size
VarSize = [1 dim];            % Decision Variables Matrix Size

%% Initialization

% Empty Plant Structure
empty_plant.Position = [];
empty_plant.Cost = [];
empty_plant.GV= [];
pop = repmat(empty_plant, nPop, 1);    % Initial Population Array

for i = 1:numel(pop)

    % Initialize Position
    %% Eq.(1)
    pop(i).Position = unifrnd(VarMin, VarMax, VarSize);
    %% Eq.(6)-upper condition
    pop(i).GV=(pop(i).Position /(VarMax-VarMin));  

    % Evaluation
    pop(i).Cost = CostFunction(pop(i).Position);

end

% Initialize Best Cost History
BestCosts = zeros(MaxIt, 1);

%% Ivy Main Loop

for it = 1:MaxIt

    % Get Best and Worst Cost Values
    Costs = [pop.Cost];
    % Best and worst costs
    BestCost = min(Costs);
    WorstCost = max(Costs);

    % Initialize new Population
    newpop = [];

    for i = 1:numel(pop)

        ii=i+1;
        if i==numel(pop)
            ii=1;
        end

        newsol = empty_plant;

        beta_1=1+(rand/2); % beta value in line 8 of "Algorithm 1 (Fig.2 in paper)"

        if  pop(i).Cost<beta_1*pop(1).Cost
            %% Eq.(5)-(6)
            newsol.Position =pop(i).Position +abs(randn(VarSize)) .*( pop(ii).Position - pop(i).Position )+ randn(VarSize) .*(pop(i).GV);
        else
            %% Eq.(7)
            newsol.Position =pop(1).Position .*(rand+randn(VarSize).*(pop(i).GV));
        end
        
        %% Eq.(3)
        pop(i).GV=(pop(i).GV).*((rand^2)*(randn(1,dim)));

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        newsol.Position = max(newsol.Position, VarMin);
        newsol.Position = min(newsol.Position, VarMax);
        %% Eq.(8)
        newsol.GV=(newsol.Position /(VarMax-VarMin));

        %% Evaluate new population
        newsol.Cost = CostFunction(newsol.Position);

        newpop = [newpop
                  newsol];

    end

    % Merge Populations
    pop = [pop
        newpop];

    % Sort Population
    [~, SortOrder]=sort([pop.Cost]);
    pop = pop(SortOrder);

    % Competitive Exclusion (Delete Extra Members)
    if numel(pop)>nPop
        pop = pop(1:nPop);
    end

    % Store Best Solution Ever Found
    BestSol = pop(1);
    BestCosts(it) = BestSol.Cost;
    Convergence_curve(it) =pop(1).Cost;

    %     Display Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCosts(it))]);

end


%% Results
Destination_fitness=pop(1).Cost;
Destination_position=pop(1).Position;
%% plot
% plot( Convergence_curve, 'LineWidth', 2); hold on
end