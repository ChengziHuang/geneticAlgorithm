import os

result = []
for root, dirs, files in os.walk('./'):  
    for file in files:   
        if os.path.splitext(file)[1] == '.txt':
            result.append(file.split('.')[0])

for root, dirs, files in os.walk('../TSPLIB'):
    for file in files:
        if (file.split('.')[0]) in result:
            command = 'cp ' + '../TSPLIB/' + file + ' ../use/'
            os.system(command)  