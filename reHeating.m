function[state,Wmov]=reHeating(state,stateI,r,pOut,eta_siT,turbineEfficiency,eta_gen,nF,nR)
%REHEATING
%% State calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pI = stateI.p;
Ti = stateI.T;
xI = stateI.x;
hI = stateI.h;
sI = stateI.s;
if nF == 0
    %pO=r*pI;
    [state(4,1),Wmov,~,~,~,~] = turbine(stateI,r*pI,eta_siT,turbineEfficiency);
    [state(4,2),Wmov,~,~,~,~] = turbine(stateI,pOut,eta_siT,turbineEfficiency);
    [state(5),~,~,~,~] = steamGenerator(state(4,1),Ti,eta_gen);
    [state(6),Wmov,~,~,~,~] = turbine(state(5),pOut,eta_siT,turbineEfficiency);
else    
    [state(4,1),Wmov,~,~,~,~] = turbine(stateI,r*pI,eta_siT,turbineEfficiency);
    [state(4,2),Wmov,~,~,~,~] = turbine(stateI,pOut,eta_siT,turbineEfficiency);
    [state(5),~,~,~,~] = steamGenerator(state(4,1),Ti,eta_gen);
    [state(8+2*nR),Wmov,~,~,~,~] = turbine(state(5),pOut,eta_siT,turbineEfficiency);
end
end