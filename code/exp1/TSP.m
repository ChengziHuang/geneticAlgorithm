clear, clc
path = '../../data/TSPLIB95/tsp/ali535.tsp';
[data, num] = readData(path);
%% parameter
mutationRate = 0.001;
crossoverRate = 0.9;
populationSize = 100;
tournamentSize = 5;
maxGeneration = 30000;
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

newPopulation = ones(populationSize, num);
while generation < maxGeneration
    for index = 1 : populationSize
        father = ga.select();    
        mother = ga.select();
        offspring = ga.crossover(father, mother);
        offspring = ga.mutation(offspring);
        newPopulation(index, :) = offspring;
    end
    fitness = calculateFitness(data, newPopulation);
    ga.population = newPopulation;
    ga.fitness = fitness;
    [selectIndividual, currentFitness] = ga.selectBestIndividual();
    generation = generation + 1;
    visual(generation, :) = selectIndividual;
    visualFit(1, generation) = currentFitness;
end

x = 1 : generation;
plot(x, visualFit,'-*b');