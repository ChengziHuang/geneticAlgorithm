classdef GeneticAlgorithm
    properties
        population;
        crossoverRate;
        mutationRate;
        populationSize;
        chromosomeLength;
        fitness;
        tournamentSize;
    end
    
    methods
        function obj = GeneticAlgorithm(population, crossoverRate, mutationRate, fitness, tournamentSize)
            obj.population = population;
            obj.crossoverRate = crossoverRate;
            obj.mutationRate = mutationRate;
            obj.populationSize = size(population, 1);
            obj.chromosomeLength = size(population, 2);
            obj.fitness = fitness;
            obj.tournamentSize = tournamentSize;
        end
        
        function parentIndex = select(obj)
            % candidate store the index of selected chromosome
            candidate = randperm(obj.populationSize, obj.tournamentSize);
            bestIndex = 1;
            for i = 2 : obj.tournamentSize
                if obj.fitness(candidate(i)) < obj.fitness(candidate(bestIndex))
                    bestIndex = i;
                end
            end
            parentIndex = candidate(bestIndex);
        end
        
        function [individual, bestFitness] = selectBestIndividual(obj)
            bestIndex = 1;
            for index = 2 : obj.populationSize
                if obj.fitness(index) < obj.fitness(bestIndex)
                    bestIndex = index;
                end
            end
            individual = obj.population(bestIndex, :);
            bestFitness = obj.fitness(bestIndex);
        end
        
        function newOffspring = mutation(obj, offspring)
            newOffspring = offspring;
            for i = 1 : obj.chromosomeLength
                if rand() < obj.mutationRate
                    newGenePos = randperm(obj.chromosomeLength, 1);
                    gene = newOffspring(newGenePos);
                    
                    newOffspring(newGenePos) = newOffspring(i);
                    newOffspring(i) = gene;
                end
            end
        end
        
        function offspring = crossover(obj,fatherIndex, motherIndex)
            father = obj.population(fatherIndex, :);
            mother = obj.population(motherIndex, :);
            if rand() < obj.crossoverRate
                offspring = zeros(1, obj.chromosomeLength);
                % get subset of parent chromosomes
                substrPos1 = randperm(obj.chromosomeLength, 1);
                substrPos2 = randperm(obj.chromosomeLength, 1);
                
                % make the smaller the start and the larger the end
                startSubstr = min([substrPos1 substrPos2]);
                endSubstr = max([substrPos1 substrPos2]);
                
                offspring(startSubstr : endSubstr) = father(startSubstr : endSubstr);
                
                empty = [1 : startSubstr - 1, endSubstr + 1 : obj.chromosomeLength];
                emptyIndex = 1;
                % Loop through parent2's city tour and add city
                for index = 1 : obj.chromosomeLength
                    geneIndex = index + endSubstr;
                    if geneIndex > obj.chromosomeLength
                        geneIndex = geneIndex - obj.chromosomeLength;
                    end    
                    
                    
                    % if offspring doesn't have the city add it
                    if ~ismember(mother(geneIndex), offspring)
                        offspring(empty(emptyIndex)) = mother(geneIndex);
                        emptyIndex = emptyIndex + 1;
                    end
                end
            else 
                if obj.fitness(fatherIndex) < obj.fitness(motherIndex)
                    offspring = father;
                else 
                    offspring = mother;
                end
            end
        end
    end
end