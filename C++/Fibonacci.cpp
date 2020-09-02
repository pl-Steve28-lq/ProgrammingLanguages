#include <iostream>

int fact(int n) {
  return n == 0 ? 1 : n*fact(n-1);
}

int main() {
  std::cout << fact(13) << std::endl;
}
