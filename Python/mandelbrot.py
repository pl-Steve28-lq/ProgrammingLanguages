from PIL import Image
import numpy as np

def mandel(c,n):
    z=[0]
    for i in range(n):
        if abs(z[-1])>2: break;
        else: z.append(z[-1]**2+c)
    return len(z) != n+1

def mandelbrotvisual():
    for i in range(-33,34):
        a = []
        for j in range(-69,34):
            if mandel(complex(j/33,i/33),200): a.append("□")
            else: a.append("■")
        print(''.join(a))

mandelbrotvisual()

