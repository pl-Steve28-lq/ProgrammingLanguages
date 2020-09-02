from mpl_toolkits.mplot3d import Axes3D
from matplotlib import pyplot as plt
from matplotlib import cm
from numpy import *
from sympy import *

def complexgraph(ctx, xst, xend, yst, yend, re, im):
    plt.clf()
    try:
        F = plt.figure()
        A = F.gca(projection='3d')
        UR = arange(float(xst), float(xend), 0.002*(float(xend)-float(xst)))
        VR = arange(float(yst), float(yend), 0.002*(float(yend)-float(yst)))
        plt.xlabel("x-axis")
        plt.ylabel("y-axis")
        u, v = meshgrid(UR, VR)
        U = eval(re.replace('^', '**'))
        V = eval(im.replace('^', '**'))
        CV = (V - float(yst))/(float(yend) - float(yst))
        S = A.plot_surface(u, v, U, facecolors=cm.jet(CV))
        plt.show()
    except Exception as ex:
        print(str(ex))
