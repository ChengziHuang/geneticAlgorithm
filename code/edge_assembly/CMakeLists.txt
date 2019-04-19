cmake_minimum_required(VERSION 3.12)
project(TSP)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(TSP
        eax.h
        individual.h
        main.cpp
        node.h
        parameter.h
        tour.h)
