# 1 
# 1 2 
# 1 2 3 
# 1 2 3 4 
# 1 2 3 4 5 


for outer in range(1,6):
    for inner in range(1, outer + 1):
        print(inner , end=" ")
    print("")