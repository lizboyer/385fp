import math
import numpy as np

with open("colorscripty.txt", "r") as colorfile:    #imports color r g b file
    colortext = colorfile.read()

colortext = colortext.split("\n")   #formats color r g b file
for i in range(len(colortext)):
    colortext[i] = colortext[i].split(" ")

for i in range(len(colortext)): #strings into ints, rounds to 12-bit coloration rather than 24-bit
    for j in range(len(colortext[i])):
        if (j>0):
            colortext[i][j] = int(colortext[i][j])
            colortext[i][j] = math.floor(colortext[i][j] / 16)
print(colortext)


##INSERT COLORS INTO ARRAY
colorarray = np.array(colortext)
print(colorarray)

