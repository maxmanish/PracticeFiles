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

l=[3,5,8,9,2,1,6,8,3,22,5,7,4]
l1=sorted(l)
print(l1[-1])
