classdef Individual
    properties 
        chromosome;
        fitness;
    end

    methods 
        function obj = Individual(chromosome)
            if length(chromosome) == 1
                obj.chromosome = ones(1, chromosome);
                
                for gene = 1 : chromosome
                    if 0.5 > rand(1)
                        obj.setGene(gene, 1);
                    else
                        obj.setGene(gene, 0);
                    end
                end
            else 
                obj.chromosome = chromosome;
            end   
        end

        function len = getChromosomeLength(obj) 
            len = length(obj.chromosome);
        end

        function setGene(obj, offset, gene) 
            obj.chromosome(offset) = gene;
        end

        function gene = getGene(obj, offset)
            gene = obj.chromosome(offset);
        end

        function obj = set.fitness(obj, fitness)
            obj.fitness = fitness;
        end


        function fit = get.fitness(obj)
            fit = obj.fitness;
        end
    end
end