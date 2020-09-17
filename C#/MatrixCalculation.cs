using System;
using System.Collections.Generic;

class MainClass {
  public static void Main (string[] args) {
    List<double> a = new List<double> {1,2};
    List<double> b = new List<double> {3,4};
    Matrix m = new Matrix(new List<List<double>> {a,b});
    Console.WriteLine((m.pow(5)).text());
  }
}

class Matrix {
  public Matrix(List<List<double>> a) {
    m = a.Count;
    n = a[0].Count;
    arr = a;
  }

  public Matrix(int N) {
    m = N;
    n = N;
    arr = new List<List<double>>();
    for (int i=0; i<N; i++) {
      List<double> p = new List<double>();
      for (int j=0; j<N; j++) {
        if (i==j) { p.Add(1.0); }
        else { p.Add(0.0); }
      }
      arr.Add(p);
    }
  }

  public int m;
  public int n;
  public List<List<double>> arr;

  public static Matrix operator + (Matrix a, Matrix b) {
    int M = Math.Max(a.m, b.m);
    int N = Math.Max(a.n, b.n);
    List<List<double>> res = new List<List<double>>();

    for (int i=0; i<N; i++) {
      List<double> p = new List<double>();
      for (int j=0; j<M; j++) {
        p.Add(a.arr[i][j]+b.arr[i][j]);
      }
      res.Add(p);
    }

    return new Matrix(res);
  }

  public static Matrix operator * (double a, Matrix b) {
    List<List<double>> res = new List<List<double>>();

    for (int i=0; i<b.m; i++) {
      List<double> p = new List<double>();
      for (int j=0; j<b.n; j++) {
        p.Add(a*b.arr[i][j]);
      }
      res.Add(p);
    }

    return new Matrix(res);
  }

  public static Matrix operator * (Matrix a, double b) {
    return b*a;
  }

  public static Matrix operator * (Matrix a, Matrix b) {
    List<List<double>> res = new List<List<double>>();

    for (int i=0; i<a.m; i++) {
      List<double> p = new List<double>();
      for (int j=0; j<b.n; j++) {
        double Q = 0.0;
        for (int k=0; k<a.n; k++) {
          Q += a.arr[i][k]*b.arr[k][j];
        }
        p.Add(Q);
      }
      res.Add(p);
    }

    return new Matrix(res);
  }

  public Matrix pow(int n) {
    if (n==0) { return new Matrix(n); }
    if (n==1) { return new Matrix(arr); }
    return new Matrix(arr)*new Matrix(arr).pow(n-1);
  }

  public string text () {
    string res = "";
    string indent = "    ";
    for (int i=0; i<m; i++) {
      res += "#" + (i+1).ToString() + ": \n";
      for (int j=0; j<n; j++) {
        res += indent + "#" + (j+1).ToString() + ": " + arr[i][j].ToString() + "\n";
      }
    }

    return res;
  }
}
