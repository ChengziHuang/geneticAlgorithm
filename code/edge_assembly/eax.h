#ifndef eax_h
#define eax_h

#include "individual.h"

void judge_ABcycle(Tour& trace, std::vector<Tour>& Eset, int group){

    int end = trace.size - 1;
    Tour ABcycle;

    
    for(int i = 0; i < end; i++){
        if(trace.tour[i].id == trace.tour[end].id && (end - i) % 2 == 0){

            ABcycle.tour.insert(ABcycle.tour.begin(), trace.tour.begin() + i + 1, trace.tour.end());

            
            if((end - i) != 2){
                
                if(group == 0){
                    ABcycle.tour.push_back(ABcycle.tour[0]);
                    ABcycle.tour.erase(ABcycle.tour.begin());
                }
                ABcycle.size = end - i;
                Eset.push_back(ABcycle);
            }

            trace.tour.erase(trace.tour.begin() + i + 1, trace.tour.end());
            trace.size = i + 1;
            break;
        }
    }
}

void select_edge(Tour& trace, Tour& stock, int& current, int& next){

    std::uniform_int_distribution<> bit(0, 1);
    int side = bit(mt);

    
    if(side == 0){
        if(stock.tour[current - 1].left != 0){
            next = stock.tour[current - 1].left;
        }else{
            next = stock.tour[current - 1].right;
        }
    }else{
        if(stock.tour[current - 1].right != 0){
            next = stock.tour[current - 1].right;
        }else{
            next = stock.tour[current - 1].left;
        }
    }

    
    trace.tour.push_back(stock.tour[next - 1]);

    
    if(stock.tour[current - 1].left == next){
        stock.tour[current - 1].left = 0;
    }else{
        stock.tour[current - 1].right = 0;
    }
    if(stock.tour[next - 1].left == current){
        stock.tour[next - 1].left = 0;
    }else{
        stock.tour[next - 1].right = 0;
    }

    
    if(stock.tour[current - 1].left == stock.tour[current - 1].right) stock.tour[current - 1].id = 0;
    if(stock.tour[next - 1].left == stock.tour[next - 1].right) stock.tour[next - 1].id = 0;
}

void ABcycle(const Individual& parentA, const Individual& parentB, std::vector<Tour> &Eset){

    Tour stockA, stockB, trace;
    int group, current, next;   

    if(parentA == parentB) return;

    stockA = parentA.cycle;
    stockB = parentB.cycle;

    while(!stockA.fill_id()){

        
        std::uniform_int_distribution<> rand(1, stockA.size - 1);
        do{
            current = rand(mt);
        }while(stockA.tour[current - 1].id == 0);

        trace.tour.clear();
        trace.size = 0;
        trace.tour.push_back(stockA.tour[current - 1]);
        trace.size++;
        group = 0;

        do{

            
            if(group == 0){
                select_edge(trace, stockA, current, next);
                group = 1;
            }else{
                select_edge(trace, stockB, current, next);
                group = 0;
            }

            trace.size++;

            
            judge_ABcycle(trace, Eset, group);

            current = next;
        }while(trace.size != 1);
    }
}

Individual EAX(const Individual& parentA, const Individual& parentB, const std::vector<std::vector<int> >& cost, const std::vector<std::list<std::pair<int, int> > >& NNlist){

std::vector<Tour> Eset;
std::vector<Individual> children(CHILDREN, parentA);


ABcycle(parentA, parentB, Eset);

for(int i = 0; i < CHILDREN; i++){


children[i].divide_tour(Eset);


children[i].conect_subtour(cost, NNlist);


children[i].evaluate(cost);
}
children.push_back(parentA);
children.push_back(parentB);
return *min_element(children.begin(), children.end());;
}

#endif