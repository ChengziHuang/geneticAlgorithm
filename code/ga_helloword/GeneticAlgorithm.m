classdef  GeneticAlgorithm 
    properties 
        populationSize;
        mutationRate;
        crossoverRate;
        elitismCount;
    end
    

    methods 
        function obj = GeneticAlgorithm(populationSize, mutationRate, crossoverRate, elitismCount)
            obj.populationSize = populationSize;
            obj.mutationRate = mutationRate;
            obj.crossoverRate = crossoverRate;    
            obj.elitismCount = elitismCount;
        end

        
    end


end