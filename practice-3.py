# 1
# 2  2
# 3  3  3
# 4  4  4  4
# 5  5  5   5   5


for outer in range(1, 6):
    for inner in range(1, outer + 1):
        print(outer, end= " ")
    print()