clc;
clear all;

file = 'matrix.xlsx';
matrix = xlsread(file);
   

% matrix=[0 1 0 1 0 1 0 0 0 1;
%       1 0 0 0 1 0 1 1 1 0;
%       1 0 0 0 1 0 1 1 0 0;
%       0 1 0 0 1 0 1 1 1 0;
%       0 0 1 1 0 1 0 0 0 1;
%       0 1 1 1 0 0 1 0 0 1;
%       1 0 0 0 1 0 0 1 1 0] 

   global machineNumber;
   machineNumber=length(matrix(:,1));
   global partNumber;
   partNumber=length(matrix(1,:));
   global maxCellNumber;
   maxCellNumber=floor(min(machineNumber,partNumber));
   machinePopulation=[];
   partPopulation=[];
   bestMachineCells=[];
   bestPartCells=[];
    bestFitness=-1;
   
   populationSize=100;
   CR=0.9;
   MR=0.2;
   MaxIter=100000;
   
   machinePopulation=populationGeneration(machineNumber,maxCellNumber,populationSize);
   partPopulation=populationGeneration(partNumber,maxCellNumber,populationSize);
   machinePopulation;
   partPopulation;
   fitness=fitnessEvaluation(matrix,machinePopulation,partPopulation,populationSize);
    
    

        
    
iteration=0;
while iteration<MaxIter && bestFitness<100
    iteration=iteration+1;
    

    c_popMac=crossover(fitness,populationSize,machinePopulation,CR);
    m_popMac=mutation(populationSize,c_popMac,machineNumber,MR);

    c_popPart=crossover(fitness,populationSize,partPopulation,CR);
      m_popPart=mutation(populationSize,c_popPart,partNumber,MR);

       machinePopulation=m_popMac;
       partPopulation=m_popPart;
       fitness=fitnessEvaluation(matrix,machinePopulation,partPopulation,populationSize);
       for i=1:length(fitness)
           if bestFitness<fitness(i)
               bestFitness=fitness(i);
               bestMachineCells=machinePopulation(i,:);
               bestPartCells=partPopulation(i,:);
               
       machinePopulation;
       partPopulation;
       fitness;
       fprintf('%d. iterasyon',iteration);
       bestFitness
           end
       end

       machinePopulation(1,:)=bestMachineCells;
       partPopulation(1,:)=bestPartCells;

end
bestMachineCells
bestPartCells
bestFitness
fprintf('%d.Iteration\n',iteration);
% printCells(bestMachineCells,bestPartCells);