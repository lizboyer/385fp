import numpy as np
import matplotlib.pyplot as plt
import sys
folder = input("Enter folder:")
file = input("Enter .mif file:")

with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/QuartusFiles/DogSVs/{}/{}'.format(folder,file), 'r') as dogmif:
    dogmifnew = dogmif.read()
    dogmif.close


if file == 'AssetsDogs2.mif' or file == 'AssetsDogs3.mif':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')

    dogmifnew = dogmifnew.replace('temp0;','3;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','4;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp4;','1;')

if file == 'AssetsDogs5.mif':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')

with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/QuartusFiles/DogSVs/{}/{}'.format(folder,file), 'w') as dogmif:
    dogmif.write(dogmifnew)
    dogmif.close

# with open('file.txt', 'r') as file :
#   filedata = file.read()

# # Replace the target string
# filedata = filedata.replace('abcd', 'ram')

# # Write the file out again
# with open('file.txt', 'w') as file:
#   file.write(filedata)