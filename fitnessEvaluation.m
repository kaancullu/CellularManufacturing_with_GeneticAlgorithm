function fitness=fitnessEvaluation(part_machine_Matrix,machinePopulation,partPopulation,populationSize)

% a=[0 1 0 1 0 1 0 0 0 1;
%       1 0 0 0 1 0 1 1 1 0;
%       1 0 0 0 1 0 1 1 0 0;
%       0 1 0 0 1 0 1 1 1 0;
%       0 0 1 1 0 1 0 0 0 1;
%       0 1 1 1 0 0 1 0 0 1;
%       1 0 0 0 1 0 0 1 1 0]    

global bestMachineCells;
global bestPartCells;
   %global bestFitness;
m=length(machinePopulation(1,:));    % m=makine sayisi
n=length(partPopulation(1,:));       % n=parca sayisi
% populationSize=length(machinePopulation(:,1));
fitness=[];
for i=1:populationSize
    n1=0;       %parca makine matrisindeki toplam 1 sayisi
n1out=0;    %hucre disinda kalan 1'lerin sayisi
n0in=0;     %hucre icinde kalan 0'larin sayisi
machineVector=machinePopulation(i,:);
partVector=partPopulation(i,:);
% machineVector
% partVector
for j=1:m
    for k=1:n
       if part_machine_Matrix(j,k)==1   % eger i. makinede j. parca isleniyorsa
           n1=n1+1;
           if machineVector(j)~=partVector(k)   % eger i. makine ve j. parca ayni hucrede degilse
               n1out=n1out+1;   % hucre disinda kalan 1 sayisini artir
           end
       else     % eger i. makinede j. parca islenmiyorsa
           if machineVector(j)==partVector(k)   % eger i. makine ve j. parca ayni hucredeyse 
               n0in=n0in+1;     % hucre icinde kalan sifir sayisini artir
           end
       end
    end
    
end
% n1
% n1out
% n0in
fitness(i)=((n1-n1out)/(n1+n0in))*100;


end

% bestMachineCells
% bestPartCells

end