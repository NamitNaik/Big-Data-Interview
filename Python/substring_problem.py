# Write a python function to find out no.of times the string s2 appears in string s1

s1 = "timisverytimidbuthasnotime"
s2 = "tim"

length1 = len(s1)
length2 = len(s2)
count = 0

for i in range(length1):
    substr = s1[i:i + length2]
    if i == length1 - (length2 - 1):
        break

    if s2 == substr:
        count = count + 1

print("Total Occurrence: ", count)
