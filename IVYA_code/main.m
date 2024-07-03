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
clear all
clc
for ii=1:23 %% the number of function
    for jj=1:20 %% the number of run for any function
        SearchAgents_no=45; % Number of search agents
        Max_iteration=1333; % Maximum numbef of iterations
        if ii==1
            Function_name='F1'; %
        end
        if ii==2
            Function_name='F2';
        end
        if ii==3
            Function_name='F3';
        end
        if ii==4
            Function_name='F4';
        end
        if ii==5
            Function_name='F5';
        end
        if ii==6
            Function_name='F6';
        end
        if ii==7
            Function_name='F7';
        end
        if ii==8
            Function_name='F8';
        end
        if ii==9
            Function_name='F9';
        end
        if ii==10
            Function_name='F10';
        end
        if ii==11
            Function_name='F11';
        end
        if ii==12
            Function_name='F12';
        end
        if ii==13
            Function_name='F13';
        end
        if ii==14
            Function_name='F14';
        end
        if ii==15
            Function_name='F15';
        end
        if ii==16
            Function_name='F16';
        end
        if ii==17
            Function_name='F17';
        end
        if ii==18
            Function_name='F18';
        end
        if ii==19
            Function_name='F19';
        end
        if ii==20
            Function_name='F20';
        end
        if ii==21
            Function_name='F21';
        end
        if ii==22
            Function_name='F22';
        end
        if ii==23
            Function_name='F23';
        end


        % Load details of the selected benchmark function
        [lb,ub,dim,fobj]=Get_Functions_details(Function_name);

        [Best_score,Best_pos,cg_curve]=IVY(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

        K(ii,jj)= Best_score;
    end
    Meann(ii)=mean(K(ii,:));
    Stdd(ii)=std(K(ii,:));
    Bestt(ii)=min(K(ii,:));
end
