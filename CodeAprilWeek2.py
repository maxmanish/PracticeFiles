#Given a list of integers, find all pairs whose sum is equal to a given number
# l=[3,5,8,9,2,1,6,8,3,2,5,7,4]
# num=12
# for i in range(len(l)):
#     for j in range(i+1,len(l)):
#         if (l[i]+l[j]==num):
#             print(l[i],"and", l[j], "are pairs!")

#Question: Given a sentence, find the first non‑repeating character
# s="manishkumar"
# nrc="Not found"
# for i in range(len(s)):
#     for j in s[i+1:]:
#         if s[i] != j:
#             nrc="Found"
# if nrc=="Found":
#     print("nrc found as:", s[i])


# s = "manishkumar"
# freq = {}
# for ch in s:
#     freq[ch] = freq.get(ch, 0) + 1
# print(freq)

# for ch in s:
#     if freq[ch] == 1:
#         print("First non-repeating character:", ch)
#         break

#Remove consecutive duplicate characters from a string (without using another list)
# s="aaabbcca"
# l=list(s)
# i=0
# while i < (len(l)-1):
#     if l[i]==l[i+1]:
#         l.pop(i+1)
#     else:
#         i=i+1
# s2="".join(l)
# print(s2)

#Remove consecutive duplicate characters from a string
# s="aaabbccaadddeeeffffeerr"
# l=list(s)
# l1 = []
# for i in range(len(l)):
#     if i==0:
#         l1.append(l[i])
#     elif l[i-1]!=l[i]:
#         l1.append(l[i])
# s2 = "".join(l1)
# print(s2)

#Given a string, reverse it without using any loop
# s="abcdef"
# s1=s[::-1]
# print(s1)

#Check if a string is a palindrome with and without using a loop
#with loop
# s="madama"
# flag="N"
# for i in range(len(s)):
#     if s[i] == s[len(s)-i-1]:
#         flag="Y"
# if (flag=="Y"):
#     print("Palindrome")
# else:
#     print("Not palindrome")

# #without loop
# s="moom"
# if s==s[::-1]:
#     print("Palindrome")
# else:
#     print("Not palindrome")


#Count the number of vowels in a string without using a loop
# s="madaemen2kemdkemnfhkwmcruiasmw"
# l=list(s)
# vowels = "aeiouAEIOU"
# count = l.count('a') + l.count('e') + l.count('i') + l.count('o') + l.count('u')
# print(count)
# count1 = sum(ch in vowels for ch in s)
# print(count)


#Given a sentence, find the number of words without looping
# s="Manish Kumar"
# l=s.split()
# print(len(l))

#Remove all spaces from a string without using loops
# s="Manish Kumar Barnwal"
# l=s.split()
# s1="".join(l)
# print(s1)

#Given a list, find the maximum and minimum values with/without using loops
#using loop
# l=[3,5,8,9,2,1,6,8,3,22,5,7,4]
# maxx=l[0]
# for i in range(1,len(l)):
#     if l[i] > maxx:
#         maxx=l[i]
# print(maxx)

# #without loop
# l=[3,5,8,9,2,1,6,8,3,22,5,7,4]
# maxx=l[0]
# x = filter(lambda x : x if x>maxx else max , l)
# print(maxx)

# l=[3,5,8,9,2,1,6,8,3,22,5,7,4]
# l1=sorted(l)
# print(l1[-1])

#Given a list of numbers, return a new list containing only even numbers (no loops)
# l=[3,5,8,9,2,1,6,8,3,22,5,7,4]
# l1 = list(filter(lambda x : x%2==0, l))
# print(l1)

# #Keep numbers greater than 10
# l=[3,5,8,9,2,1,6,8,3,22,5,72,4]
# l2 = list(filter(lambda x : x>10, l))
# print(l2)

# #Convert all numbers to squares (using map)
# l=[3,5,8,9,2,1,6,8,3,22,5,72,4]
# l3 = list(map(lambda x : x**2, l))
# print(l3)

# #From a list, square only even numbers
# l=[3,5,8,9,2,1,6,8,3,22,5,72,4]
# l4 = list(map(lambda x : x**2 if x%2==0 else x, l))
# print(l4)

#Given a number n, determine whether it is a Harshad number (number divisible by the sum of its digits)
# n=input("Enter the number: ")
# sum=0
# for val in n:
#     sum=sum+int(val)
# if int(n)%sum==0:
#     print("harshad number")
# else:
#     print("NOT harshad number")

#Check whether a number is an Armstrong number
# n=input("Enter the number: ")
# sum=0
# for val in n:
#     sum=sum+(int(val)**len(n))
# if sum==int(n):
#     print("Arstrong number")
# else:
#     print("NOT Arstrong number")

#Input a number and check if its binary representation is a palindrome
# n=input("Enter the number: ")
# n_b = bin(int(n))[2:]
# if n_b==n_b[::-1]:
#     print("Binary is Palindrome")
# else:
#     print("Binary is Not palindrome")

#Write a recursive function to calculate factorial
# def fact(n):
#     if n==1:
#         return 1
#     else:
#         return (n*fact(n-1))
# print(fact(6))

#Write a recursive function to calculate the sum of first N natural numbers
# def sum1(n):
#     if n==1:
#         return 1
#     else:
#         return (n + sum1(n-1))
# print(sum1(7))

#Write a recursive function to count digits in a number
# def dcount(n):
#     l=len(n)
#     if len(n) == 1:
#         return 1
#     else:
#         return (dcount(n[:(l-1)]) + 1)
# print(dcount("12345"))

#Remove duplicate elements from a list (order should be preserved)
# l=[3,5,8,9,2,1,6,8,3,22,5,72,4]
# l2 = []
# #l2.append(l[0])
# for i in range(len(l)):
#     if l[i] not in l2:
#         l2.append(l[i])
# print(l2)

#Find the second largest element in a list
# l=[3,5,8,9,2,1,6,8,33,22,5,72,4]
# lr=0
# lr2=0
# for i in l:
#     if i > lr:
#         lr2 = lr
#         lr = i
# print("Second largest:",lr2)

#Given a list of numbers, separate even and odd numbers into two lists
# l= [1,2,3,4,5,6,7,8,9,10]
# ls1 = []
# ls2 = []
# for i in l:
#     if i % 2 == 0:
#         ls1.append(i)
#     else:
#         ls2.append(i)
# print(ls1)
# print(ls2)

#Reverse the order of words in a sentence
# s="apple banana mango"
# ls = s.split()
# ls.reverse()
# s1=" ".join(ls)
# print(s1)

#Convert a list of keys and values into a dictionary
# k=[1,2,3,4,5]
# v=["a","b","c","d","e"]
# dict1 = {}
# for i in range(len(k)):
#     dict1[k[i]] = v[i]
# print(dict1)

#Given a string, find the longest word
# s = "a ab abc abcd xy xyz zyc pq"
# ls = s.split()
# print(ls)
# longest = ""
# for i in range(len(ls)):
#     if len(ls[i]) > len(longest):
#         longest = ls[i]
# print(longest)

#Given a number n, generate a pattern where numbers mirror around the center
# num=int(input("Enter a positive number"))
# for i in range(1,num+1):
#     for j in range(1,i+1):
#         print(j,end="")
#     for j in range(i-1,0,-1):
#         print(j,end="")
#     print("\n")

#Given a list, compress it into (element, count) format. Example: [a,a,b,b,b,c] → [('a',2),('b',3),('c',1)]
lst = ['a','a','b','b','b','c']
result = []
count = 1
for i in range(1, len(lst)):
    if lst[i] == lst[i-1]:
        count += 1
    else:
        result.append((lst[i-1], count))
        count = 1
result.append((lst[-1], count))
print(result)
