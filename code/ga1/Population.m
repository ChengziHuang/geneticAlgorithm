classdef Population
    properties 
        population;
        populationFitness;
    end

    methods 
        function obj = Population(populationSize, chromosomeLength)
            obj.population(populationSize) = Individual(chromosomeLength);

            for individualCount = 1 : populationSize
                obj.population(individualCount) = Individual(chromosomeLength);
            end
        end
    end
end