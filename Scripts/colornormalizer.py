import numpy as np
import matplotlib.pyplot as plt
import sys
file = input("Enter file:")

with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/QuartusFiles/DuckSVs/{}/{}.mif'.format(file,file), 'r') as dogmif:
    dogmifnew = dogmif.read()
    dogmif.close

if file == 'AssetsDogs2' or file == 'AssetsDogs3' or file == 'AssetsDogs6':
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

if file == 'AssetsDogs5' or file == 'AssetsDucks47' or file == 'AssetsDucks58':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')

if file == 'AssetsDogs7':
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')

    dogmifnew = dogmifnew.replace('temp1;','3;')
    dogmifnew = dogmifnew.replace('temp2;','1;')
    dogmifnew = dogmifnew.replace('temp3;','4;')
    dogmifnew = dogmifnew.replace('temp4;','2;')

if file == 'AssetsDogs8':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')


    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','4;')
    dogmifnew = dogmifnew.replace('temp4;','0;')

if file == 'AssetsDogs9':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp0;','3;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','4;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp4;','14;')
    dogmifnew = dogmifnew.replace('temp5;','1;')
    dogmifnew = dogmifnew.replace('temp6;','15;')
    dogmifnew = dogmifnew.replace('temp15;','0;')

if file == 'AssetsDogs10':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
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

    dogmifnew = dogmifnew.replace('temp0;','4;')
    dogmifnew = dogmifnew.replace('temp1;','4;')
    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp4;','1;')
    dogmifnew = dogmifnew.replace('temp5;','0;')
    dogmifnew = dogmifnew.replace('temp6;','2;')
    dogmifnew = dogmifnew.replace('temp7;','4;')
    dogmifnew = dogmifnew.replace('temp8;','2;')
    dogmifnew = dogmifnew.replace('temp9;','4;')
    dogmifnew = dogmifnew.replace('temp10;','4;')
    dogmifnew = dogmifnew.replace('temp11;','4;')
    dogmifnew = dogmifnew.replace('temp12;','4;')
    dogmifnew = dogmifnew.replace('temp13;','4;')
    dogmifnew = dogmifnew.replace('temp14;','4;')
    dogmifnew = dogmifnew.replace('temp15;','4;')

if file == 'AssetsDogs11':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
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

    dogmifnew = dogmifnew.replace('temp0;','3;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','4;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp4;','1;')
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

if file == 'AssetsDucks1':
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

if file == 'AssetsDucks2':
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

if file == 'AssetsDucks3':
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')


    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','0;')


if file == 'AssetsDucks5':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')

    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','0;')

if file == 'AssetsDucks6' or file == 'AssetsDucks17':
    dogmifnew = dogmifnew.replace('5;','temp5;')

    dogmifnew = dogmifnew.replace('temp5;','1;')

if file == 'AssetsDucks8':
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

if file == 'AssetsDucks9':
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

if file == 'AssetsDucks10':
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

if file == 'AssetsDucks11':
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

if file == 'AssetsDucks12':
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

if file == 'AssetsDucks13':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')

    dogmifnew = dogmifnew.replace('temp2;','0;')
    dogmifnew = dogmifnew.replace('temp5;','4;')
    dogmifnew = dogmifnew.replace('temp12;','0;')
    dogmifnew = dogmifnew.replace('temp13;','0;')

if file == 'AssetsDucks14':
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

if file == 'AssetsDucks15':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('5;','temp5;')

    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp5;','1;')

if file == 'AssetsDucks19':
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

if file == 'AssetsDucks20':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp12;','1;')
    dogmifnew = dogmifnew.replace('temp13;','3;')

if file == 'AssetsDucks22':
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp5;','0;')
    dogmifnew = dogmifnew.replace('temp12;','1;')
    dogmifnew = dogmifnew.replace('temp15;','1;')

if file == 'AssetsDucks23' or file == 'AssetsDucks47':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')

    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')

if file == 'AssetsDucks24':
    dogmifnew = dogmifnew.replace('1;','temp2;')
    dogmifnew = dogmifnew.replace('2;','temp1;')

    dogmifnew = dogmifnew.replace('temp1;','2;')
    dogmifnew = dogmifnew.replace('temp2;','1;')

if file == 'AssetsDucks25':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
    dogmifnew = dogmifnew.replace('6;','temp6;')

    dogmifnew = dogmifnew.replace('temp0;','4;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','1;')
    dogmifnew = dogmifnew.replace('temp4;','2;')
    dogmifnew = dogmifnew.replace('temp6;','5;')

if file == 'AssetsDucks26':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('5;','temp5;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp5;','0;')

if file == 'AssetsDucks27':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
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
    dogmifnew = dogmifnew.replace('temp6;','5;')
    dogmifnew = dogmifnew.replace('temp7;','0;')
    dogmifnew = dogmifnew.replace('temp8;','1;')
    dogmifnew = dogmifnew.replace('temp9;','1;')
    dogmifnew = dogmifnew.replace('temp10;','1;')
    dogmifnew = dogmifnew.replace('temp11;','1;')
    dogmifnew = dogmifnew.replace('temp12;','1;')
    dogmifnew = dogmifnew.replace('temp13;','1;')
    dogmifnew = dogmifnew.replace('temp14;','1;')
    dogmifnew = dogmifnew.replace('temp15;','1;')

if file == 'AssetsDucks28':
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
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

    dogmifnew = dogmifnew.replace('temp3;','4;')
    dogmifnew = dogmifnew.replace('temp4;','3;')
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

if file == 'AssetsDucks29':
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
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

    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','1;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp4;','2;')
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

if file == 'AssetsDucks30':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')

    dogmifnew = dogmifnew.replace('temp2;','2;')
    dogmifnew = dogmifnew.replace('temp3;','3;')
    dogmifnew = dogmifnew.replace('temp4;','0;')

if file == 'AssetsDucks31':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')

    dogmifnew = dogmifnew.replace('temp0;','3;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','1;')
    dogmifnew = dogmifnew.replace('temp3;','2;')

if file == 'AssetsDucks32':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp7;','3;')
    dogmifnew = dogmifnew.replace('temp8;','3;')
    dogmifnew = dogmifnew.replace('temp9;','3;')
    dogmifnew = dogmifnew.replace('temp10;','3;')
    dogmifnew = dogmifnew.replace('temp11;','3;')
    dogmifnew = dogmifnew.replace('temp12;','3;')
    dogmifnew = dogmifnew.replace('temp13;','3;')
    dogmifnew = dogmifnew.replace('temp14;','3;')
    dogmifnew = dogmifnew.replace('temp15;','3;')

if file == 'AssetsDucks33':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp0;','5;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp3;','3;')
    dogmifnew = dogmifnew.replace('temp5;','2;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp15;','2;')

if file == 'AssetsDucks34':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp0;','2;')
    dogmifnew = dogmifnew.replace('temp2;','0;')
    dogmifnew = dogmifnew.replace('temp3;','4;')
    dogmifnew = dogmifnew.replace('temp4;','3;')
    dogmifnew = dogmifnew.replace('temp7;','3;')
    dogmifnew = dogmifnew.replace('temp8;','3;')
    dogmifnew = dogmifnew.replace('temp9;','3;')
    dogmifnew = dogmifnew.replace('temp10;','3;')
    dogmifnew = dogmifnew.replace('temp11;','3;')
    dogmifnew = dogmifnew.replace('temp13;','3;')
    dogmifnew = dogmifnew.replace('temp14;','3;')
    dogmifnew = dogmifnew.replace('temp15;','3;')

if file == 'AssetsDucks35' or file == 'AssetsDucks56':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')

if file == 'AssetsDucks36':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('6;','temp6;')

    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp6;','5;')


if file == 'AssetsDucks38' or file == 'AssetsDucks27':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('6;','temp6;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp6;','5;')

if file == 'AssetsDucks39':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
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

    dogmifnew = dogmifnew.replace('temp2;','4;')
    dogmifnew = dogmifnew.replace('temp3;','3;')
    dogmifnew = dogmifnew.replace('temp4;','2;')
    dogmifnew = dogmifnew.replace('temp6;','0;')
    dogmifnew = dogmifnew.replace('temp7;','3;')
    dogmifnew = dogmifnew.replace('temp8;','2;')
    dogmifnew = dogmifnew.replace('temp9;','2;')
    dogmifnew = dogmifnew.replace('temp10;','2;')
    dogmifnew = dogmifnew.replace('temp11;','2;')
    dogmifnew = dogmifnew.replace('temp12;','3;')
    dogmifnew = dogmifnew.replace('temp13;','3;')
    dogmifnew = dogmifnew.replace('temp14;','2;')
    dogmifnew = dogmifnew.replace('temp15;','2;')


if file == 'AssetsDucks44':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('12;','temp12;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp12;','1;')

if file == 'AssetsDucks45' or file == 'AssetsDucks46':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')

    dogmifnew = dogmifnew.replace('temp0;','1;')
    dogmifnew = dogmifnew.replace('temp1;','0;')

if file == 'AssetsDucks48':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('5;','temp5;')
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp2;','4;')
    dogmifnew = dogmifnew.replace('temp5;','1;')
    dogmifnew = dogmifnew.replace('temp6;','1;')
    dogmifnew = dogmifnew.replace('temp7;','1;')
    dogmifnew = dogmifnew.replace('temp8;','1;')
    dogmifnew = dogmifnew.replace('temp9;','1;')
    dogmifnew = dogmifnew.replace('temp10;','1;')
    dogmifnew = dogmifnew.replace('temp11;','2;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp15;','2;')

if file == 'AssetsDogs49':
    dogmifnew = dogmifnew.replace('4;','temp4;')
    dogmifnew = dogmifnew.replace('3;','temp3;')

    dogmifnew = dogmifnew.replace('temp4;','3;')
    dogmifnew = dogmifnew.replace('temp3;','4;')

if file == 'AssetsDucks50':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
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
    dogmifnew = dogmifnew.replace('temp3;','4;')
    dogmifnew = dogmifnew.replace('temp4;','2;')
    dogmifnew = dogmifnew.replace('temp5;','3;')
    dogmifnew = dogmifnew.replace('temp6;','3;')
    dogmifnew = dogmifnew.replace('temp7;','3;')
    dogmifnew = dogmifnew.replace('temp8;','3;')
    dogmifnew = dogmifnew.replace('temp9;','3;')
    dogmifnew = dogmifnew.replace('temp10;','3;')
    dogmifnew = dogmifnew.replace('temp11;','3;')
    dogmifnew = dogmifnew.replace('temp12;','3;')
    dogmifnew = dogmifnew.replace('temp13;','3;')
    dogmifnew = dogmifnew.replace('temp14;','3;')
    dogmifnew = dogmifnew.replace('temp15;','3;')

if file == 'AssetsDogs42':
    dogmifnew = dogmifnew.replace('12;','temp12;')

    dogmifnew = dogmifnew.replace('temp12;','1;')

if file == 'AssetsDucks41':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('2;','temp2;')

    dogmifnew = dogmifnew.replace('temp0;','2;')
    dogmifnew = dogmifnew.replace('temp1;','0;')
    dogmifnew = dogmifnew.replace('temp2;','1;')

if file == 'AssetsDucks40':
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

if file == 'AssetsDucks51':
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('11;','temp11;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp6;','1;')
    dogmifnew = dogmifnew.replace('temp7;','1;')
    dogmifnew = dogmifnew.replace('temp8;','1;')
    dogmifnew = dogmifnew.replace('temp9;','1;')
    dogmifnew = dogmifnew.replace('temp11;','3;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp13;','2;')
    dogmifnew = dogmifnew.replace('temp15;','2;')

if file == 'AssetsDucks53':
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp12;','3;')
    dogmifnew = dogmifnew.replace('temp15;','3;')

if file == 'AssetsDucks54' or file == 'AssetsDucks52':
    dogmifnew = dogmifnew.replace('6;','temp6;')
    dogmifnew = dogmifnew.replace('7;','temp7;')
    dogmifnew = dogmifnew.replace('8;','temp8;')
    dogmifnew = dogmifnew.replace('9;','temp9;')
    dogmifnew = dogmifnew.replace('10;','temp10;')
    dogmifnew = dogmifnew.replace('12;','temp12;')
    dogmifnew = dogmifnew.replace('13;','temp13;')
    dogmifnew = dogmifnew.replace('14;','temp14;')
    dogmifnew = dogmifnew.replace('15;','temp15;')

    dogmifnew = dogmifnew.replace('temp6;','2;')
    dogmifnew = dogmifnew.replace('temp7;','2;')
    dogmifnew = dogmifnew.replace('temp8;','2;')
    dogmifnew = dogmifnew.replace('temp9;','2;')
    dogmifnew = dogmifnew.replace('temp10;','2;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp13;','2;')
    dogmifnew = dogmifnew.replace('temp14;','2;')
    dogmifnew = dogmifnew.replace('temp15;','2;')

if file == 'AssetsDucks55':
    dogmifnew = dogmifnew.replace('2;','temp2;')
    dogmifnew = dogmifnew.replace('3;','temp3;')
    dogmifnew = dogmifnew.replace('12;','temp12;')

    dogmifnew = dogmifnew.replace('temp2;','3;')
    dogmifnew = dogmifnew.replace('temp3;','2;')
    dogmifnew = dogmifnew.replace('temp12;','1;')



if file == 'AssetsDucks59':
    dogmifnew = dogmifnew.replace('0;','temp0;')
    dogmifnew = dogmifnew.replace('1;','temp1;')
    dogmifnew = dogmifnew.replace('4;','temp4;')
    dogmifnew = dogmifnew.replace('6;','tem64;')
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
    dogmifnew = dogmifnew.replace('temp4;','2;')
    dogmifnew = dogmifnew.replace('temp6;','2;')
    dogmifnew = dogmifnew.replace('temp7;','3;')
    dogmifnew = dogmifnew.replace('temp8;','3;')
    dogmifnew = dogmifnew.replace('temp9;','3;')
    dogmifnew = dogmifnew.replace('temp10;','3;')
    dogmifnew = dogmifnew.replace('temp11;','2;')
    dogmifnew = dogmifnew.replace('temp12;','2;')
    dogmifnew = dogmifnew.replace('temp13;','3;')
    dogmifnew = dogmifnew.replace('temp14;','3;')
    dogmifnew = dogmifnew.replace('temp15;','2;')


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