# ls= ["My", "name", "is", "Manish"]
# s="Harry Potter and the Goblet of Fire"
# ls1=s.split()
# print(ls1)
# for i in range(len(ls1)):
#     ls1[i] = ls1[i].lower()
# ls1.sort()
# print(ls1)

# print("program to count the number of each vowel")
# s="Harry Potter and the Goblet of Fire"
# a_count,e_count,i_count,o_count,u_count=0,0,0,0,0
# for val in s:
#     if(val=='a'):
#         a_count+=1
#     if(val=='e'):
#         e_count+=1
#     if(val=='i'):
#         i_count+=1
#     if(val=='o'):
#         o_count+=1
#     if(val=='u'):
#         u_count+=1
# print(a_count,e_count,i_count,o_count,u_count)

# print("program to merge two dictionaries")
# dict1={"name":"Manish","age":35,"work":"Wipro","hometown":"Giridih"}
# dict2={"name":"Rahul","age":40,"work":"TCS","City":"bangalore","hobby":"cricket"}
# dict1.update(dict2)
# print(dict1)

# ls=[1,3,5,6,7,8,87,6,54,5,445,5,66,5]
# print("find index of first occurance of a value")
# idx=1
# for i in range(len(ls)):
#     if ls[i]==5:
#         print("Index",idx,"of 5 is:",i)
#         idx+=1

# dict={"name":"Rahul","age":40,"work":"TCS","City":"bangalore","hobby":"cricket"}
# for x in dict:
#     print(x, ":", dict[x])

# ls=[1,3,5,6,7,8,87,6,54,5,445,5,66,5]
# if len(ls)==0:
#     print("Empty")
# else:
#     print("Not empty")

# ls1=[54,5,445,5,66,5]
# ls2=[1,3,5,6,7,8,87,6]
# ls3=ls1+ls2
# print(ls3)

# dict={"name":"Rahul","age":40,"work":"TCS","City":"bangalore","hobby":"cricket"}
# for i in dict:
#     if (i=="name"):
#         print("Present")
#     else:
#         print("Not present")

# dict={"name":"Rahul","age":40,"work":"TCS","City":"bangalore","hobby":"cricket"}
# for i in dict:
#     if (i=="hobby"):
#         print("Present")
#         break
#     else:
#         print("Not present")

# print("parse a string to a float or an Integer")
# s="123.78"
# f=float(s)
# i=int(f)
# print(i)

# s="Using Iterator"
# #s={1,2,3,4,56,7,8,9,9,9,10}
# it=iter(s)
# for i in s:
#     print(next(it), end=".")

# l=["Spade","Club","Hearts","Diamonds"]
# new_l=[i.upper() for i in l]
# print(new_l)

# for i in l:
#     print(i.upper())
