CC = g++
CPPFLAGS = -O3 -std=c++11
TRAGET = eax.h individual.h node.h parameter.h tour.h
TSP: main.cpp $(TRAGET)
	$(CC) main.cpp $(TRAGET) $(CPPFLAGS) -o TSP
clean: 
	rm TSP
