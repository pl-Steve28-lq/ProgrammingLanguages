#Return the Block of Sudoku that includes (m, n)
def Block(sudoku, m, n):
    a = int(len(sudoku)**.5)
    M = a*(m//a+1)
    N = a*(n//a+1)
    MM = max(0, M-a)
    NN = max(0, N-a)
    return list(map(lambda x:x[NN:N], sudoku[MM:M]))

#Return Validation of Sudoku
def isValid(sudoku, m, n, v):
    a = sudoku[:]
    for i in a[m]:
        if i == v: return False
    for i in range(len(a)):
        if a[i][n] == v: return False
    T = ''.join(map(lambda x: ''.join(map(str, x)), Block(a, m, n))).replace('0','')
    for i in T:
        if T.count(i)-1: return False
    
    return True

#Print Solution of Sudoku, with Backtracking
def solver(su, Z=0):
    sudoku = su[:]

    m = Z // len(sudoku)
    n = Z % len(sudoku)

    if Z == len(sudoku)**2:
        for i in sudoku:
            print(' '.join(map(str, i)))
        return
    
    if sudoku[m][n]: solver(sudoku, Z+1)
    else:
        for i in range(1,len(sudoku)+1):
            #print(sudoku, isValid(sudoku, m, n, i),m,n,i)
            if isValid(sudoku, m, n, i):
                sudoku[m][n] = i  
                solver(sudoku, Z+1)
                sudoku[m][n] = 0

#Sudoku problem text
a='''530070000
600195000
098000060
800060003
400803001
700020006
060000280
000419005
000080079'''

#Change Sudoku problem into 2d list
sudoku = list(map(lambda x: list(map(int, list(x))), a.split("\n")))

solver(sudoku)
