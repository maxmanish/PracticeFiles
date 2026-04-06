# number=int(input("Enter the number of whose sqroot is required: "))
# sqrt = (number)**(0.5)
# print("Square root is:",sqrt)

# import math
# number=int(input("Enter the number of whose sqroot is required: "))
# sq = math.sqrt(number)
# print("Square root is:",sq)

# base=float(input("Enter the base value: "))
# height=float(input("Enter the height value: "))
# print("Area of the triange is:", (0.5)*base*height)

# x=12
# y=13
# x,y=y,x
# print("x=",x,"y=",y)

# n=float(input("Enter the number: "))
# if n>0:
#     print("Positive")
# elif n<0:
#     print("negative")
# elif n==0:
#     print("Zero")
# else:
#     print("Invalid input")

# n1=int(input("Enter the first number: "))
# n2=int(input("Enter the second number: "))
# n3=int(input("Enter the third number: "))
# if (n1>n2) and (n1>n3):
#     print(n1, "is largest")
# elif (n2>n1) and (n2>n3):
#     print(n2, "is largest")
# elif (n3>n1) and (n3>n2):
#     print(n3, "is largest")
# elif (n1==n2) and (n1>n3):
#     print (n1,"and", n2, "are largest")

# prime='Y'
# n=int(input("Enter the number: "))
# for i in range(2,n):
#     if (n%i==0):
#         prime='N'
# if (prime=='Y'):
#     print("prime number")
# else:
#     print("non-prime number")

# ls=[1,2,3,5,6,7,9,11,13,15,17,20,24,25,29]
# for val in ls:
#     if val>1:
#         for i in range(2,val):
#             if (val%i==0):
#                 break
#         else:
#             print(val, end=" ")

# n=int(input("Enter the number to find factorial: "))
# fact=1
# for val in range(1,n+1):
#     fact=fact*val
# print(fact)

# def calc_fact(n):
#     if n==1:
#         return 1 # base case
#     fact=n*calc_fact(n-1)
#     return fact

# print(calc_fact(6))

# n=int(input("Enter the number whose multiplication table is required: "))
# for val in range(1,11):
#     print(n,"X",val,"=",n*val)

# n=int(input("Enter the number whose multiplication table is required: "))
# val=1
# while val<=10:
#     print(n,"X",val,"=",n*val)
#     val+=1

# n=int(input("Enter the number whose fibbonacci sequence is required: "))
# a=0
# b=1
# for i in range(n):
#     if(a==0):
#         print(a, end=" ")
#     a,b=b,(a+b)
#     print(a,end=" ")

# n=input("Enter the number to check whether given number is armstrong number or not: ")
# sum=0
# for val in n:
#     #print(val)
#     sum=sum+(int(val)**len(n))
# if sum==int(n):
#     #print("sum of its own digits, each raised to the power of the total number of digits: ",sum)
#     print("It is an Armstrong number")
# else:
#     #print("sum of its own digits, each raised to the power of the total number of digits: ",sum)
#     print("It is NOT an Armstrong number")

# print("Program to check armstrong in a list")
# ls=[153,155,370,375,407,410]
# for n in ls:
#     sum=0
#     for val in str(n):
#         sum=sum+(int(val)**len(str(n)))
#     if sum==n:
#         #print("sum of its own digits, each raised to the power of the total number of digits: ",sum)
#         print(n,"It is an Armstrong number")
#     else:
#         #print("sum of its own digits, each raised to the power of the total number of digits: ",sum)
#         print(n,"It is NOT an Armstrong number")

# print("Program to find the sum of natural numbers")
# n=int(input("Enter a natural number to find the sum: "))
# sum=0
# i=1
# while (i<=n):
#     sum=sum+i
#     i+=1
# print(sum)

# print("Program to find numbers divisible by a given number")
# n=int(input("Enter the number: "))
# ls=[23,34,45,67,78,89,56,43,76,67,41,39]
# result = list(filter(lambda x : x % n == 0,ls))
# print("the number divisible by",n,"are:",result)
# 
#  for i in ls:
#     if i%n==0:
#         print(i,"is divisible by",n)
#     else:
#         print(i,"is NOT divisible by",n)

# import random, itertools
# deck = list(itertools.product(range(1,14),["Spade","Club","Hearts","Diamonds"]))
# random.shuffle(deck)
# for i in deck:
#     print (i[0],"of",i[1])

# import calendar
# year=int(input("Enter year: "))
# month=int(input("Enter month: "))
# cal1 = calendar.month(year,month)
# print(cal1)

#print("sume of natural numbers using recursion function")
#n=int(input("Enter the number: "))
# sum=0
# for i in range(n+1):
#     sum=sum+i
# print(sum)

# sum=0
# def sum_nat(n):
#     if (n==0):
#         return 0
#     else:
#         return (n+sum_nat(n-1))
# n=int(input("Enter the number: "))
# print(sum_nat(n))

# print("Check whether string is Palindrome or not")
# s=input("Enter the String: ")
# l=len(s)
# i=0
# flag=1
# while i<int(l/2):
#     if s[i] != s[l-i-1]:
#         flag=0
#         break
#     i+=1
# if(flag==1):
#     print("Palindrome")
# else:
#     print("Not Palindrome")
