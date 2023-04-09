import math
import numpy as np


##CLEAR COLOR.H FILE
with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/NIOSIIfiles/text_mode_vga_color.h', 'w') as colorfile_h:
    colorfile_h.write(" \n")
    colorfile_h.close

##WRITE MODULE DECLARATION
with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/NIOSIIfiles/text_mode_vga_color.h', 'a') as colorfile_h:
    colorfile_h.write("\n #ifndef TEXT_MODE_VGA_COLOR_H_ \n #define TEXT_MODE_VGA_COLOR_H_\n #define COLUMNS 80\n #define ROWS 30\n\n #include <system.h>\n #include <alt_types.h>\n struct TEXT_VGA_STRUCT {\n	alt_u8 VRAM [ROWS*COLUMNS*2]; //Week 2 - extended VRAM\n	//modify this by adding const bytes to skip to palette, or manually compute palette\n	alt_u8 unused [0x1fff - 0x12bf]; //unused memory\n	alt_u8 palette [32];\n\n};\n\n struct COLOR{\n 	char name [20];\n 	alt_u8 red;\n 	alt_u8 green;\n 	alt_u8 blue;\n };\n \n \n //you may have to change this line depending on your platform designer\n static volatile struct TEXT_VGA_STRUCT* vga_ctrl = VGA_TEXT_MODE_CONTROLLER_0_BASE;\n \n //CGA colors with names\n static struct COLOR colors[]= \n")
    colorfile_h.close

with open("colorscripty.txt", "r") as colorfile:    #imports color r g b file
    colortext = colorfile.read()

colortext = colortext.split("\n")   #formats color r g b file
for i in range(len(colortext)):
    colortext[i] = colortext[i].split(" ")

# temp = np.zeros([len(colortext), len(colortext[i])])

temp = [ [0]* (len(colortext[i])) for i in range(len(colortext))]
# temp.size = (len(colortext), len(colortext[i]))

print(temp)
for i in range(len(colortext)): #strings into ints, rounds to 12-bit coloration rather than 24-bit, and turns it into hex
    for j in range(len(colortext[i])):
        if (j>0):
            colortext[i][j] = int(colortext[i][j])
            colortext[i][j] = math.floor(colortext[i][j] / 16)
            colortext[i][j] = hex(colortext[i][j])
            # colortext[i][j] = str(colortext[i][j])

    temp[i] = ', '.join(colortext[i])
    temp[i].replace("[","{")
    temp[i].replace("]","}")


print(temp)

with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/NIOSIIfiles/text_mode_vga_color.h', 'a') as colorfile_h:
    colorfile_h.write("{")
    for k in range(len(temp)):
        colorfile_h.write("{")
        colorfile_h.write("{}".format(temp[k]))
        colorfile_h.write("}\n")
    colorfile_h.write("}")
    colorfile_h.close



# temp = ''.join(colortext)
# print(temp)




##INSERT COLORS INTO ARRAY
# colorarray = np.array(colortext)
# print(colorarray)
