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
# print(l)

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
