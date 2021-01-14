function population=populationGeneration(machineOrPartNumber,maxCellNumber,populationSize)
population=[];
for i=1:populationSize
    for j=1:machineOrPartNumber
population(i,j)=randi(maxCellNumber);
    end
end
end