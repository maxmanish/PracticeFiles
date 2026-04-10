# x=input("Enter an String to find number of vowels: ")
# vowelc=0
# for i in x:
#     if i in ("a","e","i","o","u"):
#         vowelc=vowelc+1
# print("Vowel count is: ", vowelc)


#Write a program to remove duplicate elements from a list.
# ls=[1,2,3,4.5,4,3,3,3,4,4,2,1,9,23,23,2,3,4,5,5]
# ls1=[]
# for i in ls:
#     if i not in ls1:
#         ls1.append(i)
#     else:
#         continue
# print(ls1)

#Remove duplicates without using another list
# ls=[1,2,3,4,5,4,3,3,3,4,4,2,1,9,23,23,2,3,4,5,5]
# i = 0
# while i < len(ls):
#     j = i + 1
#     while j < len(ls):
#         if ls[i] == ls[j]:
#             ls.pop(j)   # remove duplicate
#         else:
#             j += 1
#     i += 1
# print(ls)

#Count how many times each word appears in a sentence
# s = "Mr Kumar of number of Kumar Mr Kumar number"
# ls = s.split()
# word_count = {}
# for word in ls:
#     if word in word_count:
#         word_count[word] += 1
#     else:
#         word_count[word] = 1
# print(word_count)

# Merge Two Lists into a Dictionary
# key = ["a","b","c"]
# val = [1,2,3]
# Output: {"a":1, "b":2, "c":3}
# dict1 = {}
# for i in range(len(key)):
#     dict1[key[i]] = val[i]
# print(dict1)

# if 1 in dict1.values():
#     print("value exists")
# if "a" in dict1:
#     print("key exists")

# print("Create a dictionary that stores numbers from 1 to 5 as keys and their squares as values")
# dict1 = {}
# for i in range(1,6):
#     dict1[i] = i**2
# print(dict1)

# print("Take a sentence as input and create a dictionary that stores each word and its length")
# s= input("Enter a sentence: ")
# l=s.split()
# mydict = {}
# for i in range(len(l)):
#     mydict[l[i]] = len(l[i])
# print(mydict)

# l = [1,4,5,6,7,8,9,6,54,3,4,67,8,89,67,5,4,56]
# dict1 = {}
# for i in l:
#     dict1[i] = "Even" if i%2==0 else "Odd"
# print(dict1)

# Create a dictionary from a list
# l = ["apple", "banana", "cherry"]
# dict1 = {}
# for i in l:
#     dict1[i] = True
# print(dict1)

# Student marks problem
# l = {"Manish":94, "Rohit":43, "Vivek":76, "Aloo": 90}
# for i in l:
#     if l.get(i) > 70:
#         print(i)

# Count the frequency of each character in a string (ignore spaces)
# s = "Mr Kumar of number"
# dict1 = {}
# for i in s:
#     if i == " ":
#         continue
#     if i in dict1:
#         dict1[i] += 1
#     else:
#         dict1[i] = 1
# print(dict1)

# Count the frequency of each character in a string (ignore spaces, ignore case)
# s = "Mr Kumar of number"
# dict1 = {}
# for i in s:
#     if i == " ":
#         continue
#     if i.lower() in dict1:
#         dict1[i.lower()] += 1
#     else:
#         dict1[i.lower()] = 1
# print(dict1)

# # Create a dictionary of items and prices
# items = ["pen", "book", "eraser"]
# prices = [10, 50, 5]
# d = {}
# for i in range(len(items)):
#     d[items[i]] = prices[i]
# print(d)

# # create a dictionary where key = word, value = number of vowels in that word
# items = ["pen", "book", "eraser"]
# d = {}
# for words in items:
#     vc=0
#     for ch in words:
#         if ch in ("a","e","i","o","u"):
#             vc = vc+1
#     d[words] = vc
# print(d)

# items1 = ["pen", "book", "eraser"]
# def vo_calc(items):
#     for i in items:
#         vc=0
#         for j in i:
#             if j in ("a","e","i","o","u"):
#                 vc = vc+1
#         return vc
# print(vo_calc(items1))

# Given a dictionary, swap keys and values
# d = {"a": 1, "b": 2, "c": 3}
# new_d = {}
# for key, value in d.items():
#     new_d[value] = key
# print(new_d)
