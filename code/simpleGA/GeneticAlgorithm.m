classdef GeneticAlgorithm
    properties 
        population;
        crossoverRate;
        mutationRate;
        populationSize;
        chromosomeLength;
        fitness;
    end

    methods 
        function obj = GeneticAlgorithm(population, crossoverRate, mutationRate, fitness)
            obj.population = population;
            obj.crossoverRate = crossoverRate;
            obj.mutationRate = mutationRate;
            obj.populationSize = size(population, 1);
            obj.chromosomeLength = size(population, 2);
            obj.fitness = fitness;
        end


        function parent = select(obj)
            candidate = ceil(rand(1, 3) * obj.populationSize);

            parentIndex = candidate(1,1);

            if obj.fitness(parentIndex) < obj.fitness(candidate(1,2))
                parentIndex = candidate(1,2);
            else 
                if obj.fitness(parentIndex) < obj.fitness(candidate(1,3))
                    parentIndex = candidate(1,3);
                end
            end

            parent = obj.population(parentIndex, :);
        end

        function offspring = crossover(obj,father, mother)
            if rand() > obj.crossoverRate
                offspring = ones(1, obj.chromosomeLength);
                for gene = 1 : obj.chromosomeLength
                    if 0.5 > rand()
                        offspring(1, gene) = father(1, gene);
                    else 
                        offspring(1, gene) = mother(1, gene);
                    end
                end
            else 
                if calculateFitness(father) > calculateFitness(mother)
                    offspring = father;
                else 
                    offspring = mother;
                end
            end
        end

        function newOffspring = mutation(obj,offspring)
            newOffspring = offspring;
            for geneIndex = 1 : obj.chromosomeLength
                if rand() < obj.mutationRate
                    if newOffspring(geneIndex) == 1
                        newOffspring(geneIndex) = 0;
                    else 
                        newOffspring(geneIndex) = 1;
                    end
                end
            end
        end

        function [individual, bestFitness] = selectBestIndividual(obj)
            bestIndex = 1;
            for index = 2 : obj.populationSize
                if obj.fitness(index) > obj.fitness(bestIndex)
                    bestIndex = index;
                end
            end
            individual = obj.population(bestIndex, :);
            bestFitness = obj.fitness(bestIndex);
        end
    end
end