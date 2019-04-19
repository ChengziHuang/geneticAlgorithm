import os

for root, dirs, files in os.walk('./'):  
    for file in files:   
        if os.path.splitext(file)[1] == '.tsp':
            command = './TSP' + ' ' + file
            os.system(command)