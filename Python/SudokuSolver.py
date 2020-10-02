class Sudoku:
    def __init__(self, arr):
        self.arr = arr
        self.sol = []
        self.isEnd = False
    
    #Return the Block of Sudoku that includes (m, n)
    def Block(self, sudoku, m, n):
        a = int(len(sudoku)**.5)
        M = a*(m//a+1)
        N = a*(n//a+1)
        MM = max(0, M-a)
        NN = max(0, N-a)
        return list(map(lambda x:x[NN:N], sudoku[MM:M]))

    #Return Validation of Sudoku
    def isValid(self, sudoku, m, n, v):
        a = sudoku[:]
        for i in a[m]:
            if i == v: return False
        for i in range(len(a)):
            if a[i][n] == v: return False
        T = ''.join(map(lambda x: ''.join(map(str, x)), self.Block(a, m, n))).replace('0','')
        for i in T:
            if T.count(i)-1: return False
        
        return True

    #Print Solution of Sudoku, with Backtracking
    def solver(self, sudoku, Z=0): 
        m = Z // len(sudoku)
        n = Z % len(sudoku)

        if Z == len(sudoku)**2:
            self.sol = sudoku[:]
            self.isEnd = True
            return 
        
        if sudoku[m][n]: self.solver(sudoku, Z+1)
        else:
            for i in range(1,len(sudoku)+1):
                if self.isValid(sudoku, m, n, i):
                    sudoku[m][n] = i  
                    self.solver(sudoku, Z+1)
                    if not self.isEnd: sudoku[m][n] = 0

    def Solve(self):
        self.__init__(self.arr)
        self.solver(self.arr)
        return self.sol



if __name__ == "__main__":
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
    sudoku = Sudoku(list(map(lambda x: list(map(int, list(x))), a.split("\n"))))

    a = sudoku.Solve()
    
    for i in a:
        print(' '.join(map(str,i)))
