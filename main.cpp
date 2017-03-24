#include <iostream>
#include <stdio.h>
#include <string>

using namespace std;

int main() {
  cout << "Hello World!" << endl;
  string s = "Hello Strings\n";
  printf(s.c_str());

  char a[10];
  a[10] = 'f';
  return a[4];
}
