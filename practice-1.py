# supermarket billing system

while True:
    name = input("Enter Customer's name: ")
    total = 0

    while True:
        print("Enter the amount and quantity:")
        amount = float(input("Enter amount: "))
        qty = int(input("Enter quantity: "))
        total = total + ( amount * qty )
        repeat = input("do you want to add more items? (yes | no): ")
        if repeat == "no" or repeat == "No" or repeat == "NO":
            break

    print("-----------------------------------------------")
    print("Name: ", name)
    print("Amount to be paid: ", total)
    print("-----------------------------------------------")
    print("*************Happy Shopping********************")

    nextBill = input("Do you want to proceed with next customer? (yes | no): ")
    if nextBill == "no" or nextBill == "No" or nextBill == "NO":
        break