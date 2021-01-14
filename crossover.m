function population=crossover(fitness,populationSize,machineOrPartPopulation,CR)

        total=sum(fitness);
        n_fitness=fitness/total;
        c_fitness(1)=n_fitness(1);
        for i=2:populationSize
            c_fitness(i)=n_fitness(i)+c_fitness(i-1);
        end
        
        
%         c_fitness
        
        
        uzunluk=length(machineOrPartPopulation(1,:)); % giren populasyonun satir uzunlugunu hesaplar
        c_count=0;
%         uzunluk
        population=[];
        while c_count<populationSize
            r=rand();
%             r
            for i=1:populationSize %length(c_fitness)
                if c_fitness(i)>=r
                    p1=i;
                    break
                end
            end
%             p1
            p2=p1;
            while p2==p1
                r=rand();
                for i=1:populationSize%length(c_fitness)
                    if c_fitness(i)>=r
                        p2=i;
                        break
                    end
                end
            end
%             p2
            r1=rand();
%             r1
            if r1<=CR
                parent1=machineOrPartPopulation(p1,:);
%                 parent1
                parent2=machineOrPartPopulation(p2,:);
%                 parent2
                point1=randi(uzunluk-1);
                
                point2=point1;
                while abs(point1-point2)<3
                    point2=randi(uzunluk-1);
                end
                
               if point2<point1
                    temp=point2;
                    point2=point1;
                    point1=temp;
               end
%                 point1
%                 point2
                child1=parent1;
%                 child1
                child2=parent2;
%                 child2
                counter=point1;
%                 i=0;
%                 exit=1;
%                 while i<uzunluk && exit==1
%                     i=i+1;
%                     for j=point1+1:point2
%                         if parent2(i)==parent1(j)
%                             counter=counter+1;
%                             child1(counter)=parent2(i);
%                             exit=0;
%                         end
%                     end
%                 end
                    temp1=[];
                    temp2=[];
                    a=randi(length(child1)-1);
                    for i=1:a
                        temp1(i)=child2(i);
                        temp2(i)=child1(i);
                    end
                    for i=a+1:length(child1)
                        temp1(i)=child1(i);
                        temp2(i)=child2(i);
                    end
%                 exit=1;
%                 i=0;
% %                 child1
%                 counter=point1;
%                 
%                 while i<uzunluk && exit==1
%                     i=i+1;
%                     for j=point1+1:point2
%                         if parent1(i)==parent2(j)
%                             counter=counter+1;
%                             child2(counter)=parent1(i);
%                             exit=0;
%                         end
%                     end
%                 end
%                 child2
            c_count=c_count+2;
            population(c_count-1,:)=temp1;
            population(c_count,:)=temp2;
            end
        end
end