import numpy as np
import matplotlib.pyplot as plt
#does referencing like this work lol
import sys

##CLEAR SPRITE FILE
with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.sv', 'w') as spritefile:
    spritefile.write(" \n")
    spritefile.close
with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.txt', 'w') as spriteholder:
    spriteholder.write(" \n")
    spriteholder.close

##WRITE MODULE DECLARATION
with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.sv', 'a') as spritefile:
    # spritefile.write("\n module sprite_rom ( input CLK, \n output [7:0]	data \n); \n \n	parameter ADDR_WIDTH = 11; \n   parameter DATA_WIDTH =  8; \n	logic [ADDR_WIDTH-1:0] addr_reg; \n				 \n	// ROM definition				 \n	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = \n")
    spritefile.write("\n module sprite_rom ( input CLK, \n ")
    spritefile.close

# ITERATE THROUGH SPRITE FILES (change if file order changes)
# folder = np.array = ["Dog","Duck","Background"]
# numfolders = 3  #number of folders
# numfiles = [21,3,3] #how many files are in each folder


folder = np.array = ["Dogs", "Bgs"]
numfolders = 2  #number of folders
numfiles = [4, 1] #how many files are in each folder

# folder = np.array = ["Bgs"]
# numfolders = 1  #number of folders
# numfiles = [2] #how many files are in each folder

hexa = 0
hexb = 0

for i in range(numfolders): #looping through general asset folders (DOG, DUCK, BACKGROUND)
     hexa = hexa+1
     for j in range(numfiles[i]): #looping through numbered asset files (ASSETDOGn) (THIS HAS TO CHANGE FOR DOG, DUCK, BACKGROUND)
        hexb = hexb+1
        # image = plt.imread('/Users/liz/Library/CloudStorage/OneDrive-Personal/Desktop/After Glitch/Desktop/385fp/Assets/{}/Assets{}{}.png'.format(folder[i],folder[i],j))
        image = plt.imread('/Users/liz/Library/CloudStorage/OneDrive-Personal/Desktop/After Glitch/Desktop/385fp/Assets/{}/{}{}.png'.format(folder[i],folder[i],j))

        x,y,z = image.shape
        np.set_printoptions(threshold=sys.maxsize, linewidth = y)

        bw = np.zeros((x,y))

        ##BLACK AND WHITE GENERATOR
        for k in range(len(image)):
            for l in range(len(image[k])):
                sum = 0
                for m in range(3):
                    sum += (image[k][l][m])**2
                sum = sum/3
                bw[k][l] = sum

        ##COLORMAP GENERATOR
        # colormap = np.zeros((x,y))
        ysize = y-1
        xsize = x-1
        z = 3

        with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.sv', 'a') as spritefile:
            if i == numfolders - 1:
                spritefile.write(" output [{}:0][{}:0][{}:0] {}{} \n); \nalways_comb\nbegin" .format(xsize,ysize,z,folder[i],j))
            else:
                spritefile.write(" output [{}:0][{}:0][{}:0] {}{}, \n" .format(x,y,z,folder[i],j))
            spritefile.close

        
        colormap = [ [0]* (len(image[g])) for g in range(len(image))] #creates temp of size colortext
        temp = [ [0]* (len(colormap[k])) for k in range(len(colormap))] #creates temp of size colortext

        for n in range(len(bw)):
            for o in range(len(bw[n])):
                    if (bw[n][o]) < 0.00001:  #BLACK
                        colormap[n][o] = 0
                    if (bw[n][o]) > 0.99 and (bw[n][o]) < 1.001: #WHITE
                        colormap[n][o] = 1
                    if (bw[n][o]) > 0.335 and (bw[n][o]) < .336: #GREEN
                        colormap[n][o] = 2
                    # if (image[i][j]) == 0: #PINK
                    #      image[i][j] == 3
                    if (bw[n][o]) > 0.152 and (bw[n][o]) < .153: #LIGHTBROWN
                        colormap[n][o] = 4
                    if (bw[n][o]) > 0.0400 and (bw[n][o]) < 0.0401: #DARKBROWN
                        colormap[n][o] = 5
                    # if (image[i][j]) == 0: #TAN
                    #      image[i][j] == 6
                    if (bw[n][o]) > 0.536 and (bw[n][o]) < .537: #BLUE
                        colormap[n][o] = 7
                    if (bw[n][o]) > 0.152 and (bw[n][o]) < .153: #DARKGREEN
                        colormap[n][o] = 8  
                    if (bw[n][o]) > 0.116 and (bw[n][o]) < .118: #DARKGREEN
                        colormap[n][o] = 9
                    # if (image[i][j]) == 0: #PALEGREEN
                    #      image[i][j] == 10
                    # if (image[i][j]) == 0: #RED
                    #      image[i][j] == 11
                    # print (colormap[n][o])
                    colormap[n][o] = str(colormap[n][o])

            temp[n] = ', '.join(colormap[n])
            temp[n].replace("[","{")
            temp[n].replace("]","}")

        ##APPEND EACH SPRITE
        # print(colormap)

        
        # colormapstr = np.array2string(colormap)
        with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.txt', 'a') as spriteholder:
            spriteholder.write(" {}{} <= \n".format(folder[i],j))
            spriteholder.write("'{")
            for c in range(len(temp)):
                spriteholder.write("{")
                spriteholder.write("{}".format(temp[c]))
                spriteholder.write("}")
                if c == len(temp) - 1:
                    spriteholder.write("\n")
                else:
                    spriteholder.write(",\n")
            spriteholder.write("};\n")
            spriteholder.write("\n \n //code {} \n" .format(hex(hexb * (hexa))))
            spriteholder.close

with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.txt') as spriteholder:
    with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.sv', 'a') as spritefile:
        for line in spriteholder:
            spritefile.write(line)
            spritefile.close

##APPEND ENDMODULE
with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.sv', 'a') as spritefile:
    spritefile.write(" \n \nend \n \n endmodule  ")
    spritefile.close

# import numpy as np
# import matplotlib.pyplot as plt
# #does referencing like this work lol
# import sys

# ##CLEAR SPRITE FILE
# with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.sv', 'w') as spritefile:
#     spritefile.write(" \n")
#     spritefile.close

# ##WRITE MODULE DECLARATION
# with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.sv', 'a') as spritefile:
#     spritefile.write("\n module font_rom ( input [10:0]	addr, \n output [7:0]	data \n); \n \n	parameter ADDR_WIDTH = 11; \n   parameter DATA_WIDTH =  8; \n	logic [ADDR_WIDTH-1:0] addr_reg; \n				 \n	// ROM definition				 \n	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = \n")
#     spritefile.close

# # ITERATE THROUGH SPRITE FILES (change if file order changes)
# # folder = np.array = ["Dog","Duck","Background"]
# # numfolders = 3  #number of folders
# # numfiles = [21,3,3] #how many files are in each folder


# folder = np.array = ["Dogs", "Bgs"]
# numfolders = 2  #number of folders
# numfiles = [4, 1] #how many files are in each folder

# # folder = np.array = ["Bgs"]
# # numfolders = 1  #number of folders
# # numfiles = [2] #how many files are in each folder

# hexa = 0
# hexb = 0

# for i in range(numfolders): #looping through general asset folders (DOG, DUCK, BACKGROUND)
#      hexa = hexa+1
#      for j in range(numfiles[i]): #looping through numbered asset files (ASSETDOGn) (THIS HAS TO CHANGE FOR DOG, DUCK, BACKGROUND)
#         hexb = hexb+1
#         # image = plt.imread('/Users/liz/Library/CloudStorage/OneDrive-Personal/Desktop/After Glitch/Desktop/385fp/Assets/{}/Assets{}{}.png'.format(folder[i],folder[i],j))
#         image = plt.imread('/Users/liz/Library/CloudStorage/OneDrive-Personal/Desktop/After Glitch/Desktop/385fp/Assets/{}/{}{}.png'.format(folder[i],folder[i],j))

#         x,y,z = image.shape
#         np.set_printoptions(threshold=sys.maxsize, linewidth = y)

#         bw = np.zeros((x,y))

#         ##BLACK AND WHITE GENERATOR
#         for k in range(len(image)):
#             for l in range(len(image[k])):
#                 sum = 0
#                 for m in range(3):
#                     sum += (image[k][l][m])**2
#                 sum = sum/3
#                 bw[k][l] = sum

#         print(bw)

#         with open('/Users/liz/OneDrive/Desktop/After Glitch/Desktop/385fp/Sprites/sprites.sv', 'a') as spritefile:
#             spritefile.write("{")
#             for c in range(len(bw)):
#                 spritefile.write("{")
#                 spritefile.write("{}".format(bw[c]))
#                 spritefile.write("}")
#                 if c == len(bw) - 1:
#                     spritefile.write("\n")
#                 else:
#                     spritefile.write(",\n")
#             spritefile.write("};\n")
#             spritefile.write("\n \n //code {} \n" .format(hex(hexb * (hexa))))
#             spritefile.close

#         ##COLORMAP GENERATOR
#         colormap = np.zeros((x,y))

#         for n in range(len(bw)):
#             for o in range(len(bw[n])):
#                     if (bw[n][o]) < 0.00001:  #BLACK
#                         colormap[n][o] = 0
#                     if (bw[n][o]) > 0.99 and (bw[n][o]) < 1.001: #WHITE
#                         colormap[n][o] = 1
#                     if (bw[n][o]) > 0.335 and (bw[n][o]) < .336: #GREEN
#                         colormap[n][o] = 2
#                     # if (image[i][j]) == 0: #PINK
#                     #      image[i][j] == 3
#                     if (bw[n][o]) > 0.152 and (bw[n][o]) < .153: #LIGHTBROWN
#                         colormap[n][o] = 4
#                     if (bw[n][o]) > 0.0400 and (bw[n][o]) < 0.0401: #DARKBROWN
#                         colormap[n][o] = 5
#                     # if (image[i][j]) == 0: #TAN
#                     #      image[i][j] == 6
#                     if (bw[n][o]) > 0.536 and (bw[n][o]) < .537: #BLUE
#                         colormap[n][o] = 7
#                     if (bw[n][o]) > 0.152 and (bw[n][o]) < .153: #DARKGREEN
#                         colormap[n][o] = 8  
#                     if (bw[n][o]) > 0.116 and (bw[n][o]) < .118: #DARKGREEN
#                         colormap[n][o] = 9
#                     # if (image[i][j]) == 0: #PALEGREEN
#                     #      image[i][j] == 10
#                     # if (image[i][j]) == 0: #RED
#                     #      image[i][j] == 11
# # print (colormap)
