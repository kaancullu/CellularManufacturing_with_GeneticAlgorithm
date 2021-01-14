function population=mutation(populationSize,machineOrPartPopulation,machineOrPartNumber,MR)

%  global machineNumber
%  global partNumber
  global maxCellNumber;
 
population=machineOrPartPopulation;

 for i=1:populationSize
        r=rand();
        if r<=MR
            partOrMachineNo=randi(machineOrPartNumber);
            newCell=randi(maxCellNumber);
            population(i,partOrMachineNo)=newCell;
%             cell1=randi(machineOrPartNumber);
%             cell2=cell1;
%             while cell2==cell1
%                 cell2=randi(machineOrPartNumber);
%             end
%             temp=population(i,cell1);
%             population(i,cell1)=population(i,cell2);
%             population(i,cell2)=temp;
%               partOrMachineNo=randi(length(population(1,:)));
%               population(i,partOrMachineNo)=randi(maxCellNumber);
        end
    end
end