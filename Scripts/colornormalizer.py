import numpy as np
import matplotlib.pyplot as plt
import sys
file = input("Enter file:")

with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/QuartusFiles/DuckSVs/{}/{}.mif'.format(file,file), 'r') as dogmif:
    dogmifnew = dogmif.read()
    dogmif.close

if file == 'AssetsDogs2.mif' or file == 'AssetsDogs3.mif' or file == 'AssetsDogs6.mif':
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

if file == 'AssetsDogs7.mif':
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')

    dogmifnew = dogmifnew.replace('temp1;','3;')
    dogmifnew = dogmifnew.replace('temp2;','1;')
    dogmifnew = dogmifnew.replace('temp3;','4;')
    dogmifnew = dogmifnew.replace('temp4;','2;')

if file == 'AssetsDogs8.mif':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')


    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','4;')
    dogmifnew = dogmifnew.replace('temp4;','0;')

if file == 'AssetsDucks1.mif':
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')


    dogmifnew = dogmifnew.replace('temp3;','4;')
    dogmifnew = dogmifnew.replace('temp4;','3;')
    dogmifnew = dogmifnew.replace('temp5;','1;')
    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','0;')

if file == 'AssetsDucks2.mif':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')


    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','0;')
    dogmifnew = dogmifnew.replace('temp5;','0;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp13;','2;')
    dogmifnew = dogmifnew.replace('temp14;','1;')

if file == 'AssetsDucks3.mif' or file == 'AssetsDucks7.mif' or file == 'AssetsDucks16.mif' or file == 'AssetsDucks18.mif':
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')


    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','0;')

if file == 'AssetsDucks4.mif':
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp5;','1;')
    dogmifnew = dogmifnew.replace('temp6;','1;')
    dogmifnew = dogmifnew.replace('temp7;','1;')
    dogmifnew = dogmifnew.replace('temp8;','1;')
    dogmifnew = dogmifnew.replace('temp9;','1;')
    dogmifnew = dogmifnew.replace('temp10;','1;')
    dogmifnew = dogmifnew.replace('temp11;','1;')
    dogmifnew = dogmifnew.replace('temp13;','4;')
    dogmifnew = dogmifnew.replace('temp15;','1;')


if file == 'AssetsDucks5.mif':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')

    dogmifnew = dogmifnew.replace('temp0;','4;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp4;','1;')
    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','0;')

if file == 'AssetsDucks6.mif':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')

    dogmifnew = dogmifnew.replace('temp0;','4;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','1;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp4;','3;')
    dogmifnew = dogmifnew.replace('temp5;','1;')
    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','0;')

if file == 'AssetsDucks8.mif':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')


    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp5;','2;')
    dogmifnew = dogmifnew.replace('temp6;','2;')
    dogmifnew = dogmifnew.replace('temp7;','2;')
    dogmifnew = dogmifnew.replace('temp8;','2;')
    dogmifnew = dogmifnew.replace('temp9;','2;')
    dogmifnew = dogmifnew.replace('temp10;','2;')
    dogmifnew = dogmifnew.replace('temp11;','2;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp13;','2;')
    dogmifnew = dogmifnew.replace('temp14;','2;')
    dogmifnew = dogmifnew.replace('temp15;','2;')

if file == 'AssetsDucks9.mif':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')


    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp5;','0;')
    dogmifnew = dogmifnew.replace('temp6;','0;')
    dogmifnew = dogmifnew.replace('temp7;','0;')
    dogmifnew = dogmifnew.replace('temp8;','0;')
    dogmifnew = dogmifnew.replace('temp9;','0;')
    dogmifnew = dogmifnew.replace('temp10;','0;')
    dogmifnew = dogmifnew.replace('temp11;','0;')
    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','0;')
    dogmifnew = dogmifnew.replace('temp14;','0;')
    dogmifnew = dogmifnew.replace('temp15;','0;')

if file == 'AssetsDucks10.mif':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')


    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp5;','2;')
    dogmifnew = dogmifnew.replace('temp6;','2;')
    dogmifnew = dogmifnew.replace('temp7;','2;')
    dogmifnew = dogmifnew.replace('temp8;','2;')
    dogmifnew = dogmifnew.replace('temp9;','2;')
    dogmifnew = dogmifnew.replace('temp10;','2;')
    dogmifnew = dogmifnew.replace('temp11;','2;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp13;','2;')
    dogmifnew = dogmifnew.replace('temp14;','2;')
    dogmifnew = dogmifnew.replace('temp15;','2;')

if file == 'AssetsDucks11.mif':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')


    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp7;','1;')
    dogmifnew = dogmifnew.replace('temp8;','1;')
    dogmifnew = dogmifnew.replace('temp9;','1;')
    dogmifnew = dogmifnew.replace('temp10;','1;')
    dogmifnew = dogmifnew.replace('temp11;','0;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp13;','4;')
    dogmifnew = dogmifnew.replace('temp14;','4;')
    dogmifnew = dogmifnew.replace('temp15;','0;')

if file == 'AssetsDucks12.mif':
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')


    dogmifnew = dogmifnew.replace('temp5;','1;')
    dogmifnew = dogmifnew.replace('temp6;','0;')
    dogmifnew = dogmifnew.replace('temp7;','4;')
    dogmifnew = dogmifnew.replace('temp8;','4;')
    dogmifnew = dogmifnew.replace('temp9;','4;')
    dogmifnew = dogmifnew.replace('temp10;','4;')
    dogmifnew = dogmifnew.replace('temp11;','4;')
    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','4;')
    dogmifnew = dogmifnew.replace('temp14;','4;')
    dogmifnew = dogmifnew.replace('temp15;','4;')

if file == 'AssetsDucks13.mif':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')

    dogmifnew = dogmifnew.replace('temp2;','0;')
    dogmifnew = dogmifnew.replace('temp5;','4;')
    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','0;')

if file == 'AssetsDucks14.mif':
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')


    dogmifnew = dogmifnew.replace('temp5;','0;')
    dogmifnew = dogmifnew.replace('temp7;','4;')
    dogmifnew = dogmifnew.replace('temp8;','4;')
    dogmifnew = dogmifnew.replace('temp9;','4;')
    dogmifnew = dogmifnew.replace('temp10;','4;')
    dogmifnew = dogmifnew.replace('temp11;','4;')
    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp14;','4;')
    dogmifnew = dogmifnew.replace('temp15;','4;')

if file == 'AssetsDucks15.mif':
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')


    dogmifnew = dogmifnew.replace('temp5;','4;')
    dogmifnew = dogmifnew.replace('temp7;','1;')
    dogmifnew = dogmifnew.replace('temp8;','1;')
    dogmifnew = dogmifnew.replace('temp9;','1;')
    dogmifnew = dogmifnew.replace('temp10;','1;')
    dogmifnew = dogmifnew.replace('temp11;','1;')
    dogmifnew = dogmifnew.replace('temp13;','4;')
    dogmifnew = dogmifnew.replace('temp14;','1;')
    dogmifnew = dogmifnew.replace('temp15;','1;')

if file == 'AssetsDucks17.mif':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','1;')
    dogmifnew = dogmifnew.replace('temp5;','1;')
    dogmifnew = dogmifnew.replace('temp6;','0;')
    dogmifnew = dogmifnew.replace('temp7;','1;')
    dogmifnew = dogmifnew.replace('temp8;','1;')
    dogmifnew = dogmifnew.replace('temp9;','1;')
    dogmifnew = dogmifnew.replace('temp10;','1;')
    dogmifnew = dogmifnew.replace('temp11;','1;')
    dogmifnew = dogmifnew.replace('temp12;','1;')
    dogmifnew = dogmifnew.replace('temp13;','1;')
    dogmifnew = dogmifnew.replace('temp14;','1;')
    dogmifnew = dogmifnew.replace('temp15;','1;')

if file == 'AssetsDucks19.mif':
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp5;','0;')
    dogmifnew = dogmifnew.replace('temp6;','4;')
    dogmifnew = dogmifnew.replace('temp7;','2;')
    dogmifnew = dogmifnew.replace('temp8;','2;')
    dogmifnew = dogmifnew.replace('temp9;','2;')
    dogmifnew = dogmifnew.replace('temp10;','2;')
    dogmifnew = dogmifnew.replace('temp11;','4;')
    dogmifnew = dogmifnew.replace('temp12;','4;')
    dogmifnew = dogmifnew.replace('temp13;','2;')
    dogmifnew = dogmifnew.replace('temp14;','2;')
    dogmifnew = dogmifnew.replace('temp15;','4;')

with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/QuartusFiles/DuckSVs/{}/{}.mif'.format(file,file), 'w') as dogmif:
    dogmif.write(dogmifnew)
    dogmif.close

# with open('file.txt', 'r') as file :
#   filedata = file.read()

# # Replace the target string
# filedata = filedata.replace('abcd', 'ram')

# # Write the file out again
# with open('file.txt', 'w') as file:
#   file.write(filedata)