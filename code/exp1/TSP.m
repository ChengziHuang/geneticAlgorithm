clear, clc
path = '../../data/TSPLIB95/tsp/berlin52.tsp';
[data, num] = readData(path);
%% parameterdc
mutationRate = 0.002;
crossoverRate = 0.9;
populationSize = 500;
tournamentSize = 5;
maxGeneration = 1500;
%% create and evaluate the random initial population
population = zeros(populationSize, num);
for i = 1 : populationSize
    population(i, :) = randperm(num);
end
fitness = calculateFitness(data, population);
ga = GeneticAlgorithm(population, crossoverRate, mutationRate, fitness, tournamentSize);

generation = 1;
[selectIndividual, currentFitness] = ga.selectBestIndividual();

visual = selectIndividual;
visualFit = currentFitness;
%% evolve
newPopulation = population;
while generation < maxGeneration
    for index = 1 : populationSize
        father = ga.select();    
        mother = ga.select();
        offspring = ga.crossover(father, mother);
        offspring = ga.mutation(offspring);
        newPopulation(index, :) = offspring;
    end
    % offspring and old population consist a new population
    fitness = calculateFitness(data, newPopulation);
    candidate = [fitness, ga.fitness];
    [fitness, I] = sort(candidate);
    % select individual by their fitness
    yeild = population;
    for i = 1 : ga.populationSize
        if I(i) <= ga.populationSize
            yeild(i, :) = newPopulation(I(i), :);
        else 
            yeild(i, :) = ga.population(I(i) - ga.populationSize, :);
        end
    end
    ga.population = yeild;
    ga.fitness = fitness(1 : ga.populationSize);
    
    selectIndividual = ga.population(1, :);
    currentFitness = ga.fitness(1);
    generation = generation + 1;
    visual(generation, :) = selectIndividual;
    visualFit(1, generation) = currentFitness;
end

x = 1 : generation;
bestFitness = min(visualFit);