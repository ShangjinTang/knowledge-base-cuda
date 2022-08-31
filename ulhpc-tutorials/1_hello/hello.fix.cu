#include <iostream>
#include <cstdio>
#include "cuda.h"

using namespace std;

void helloCPU()
{
  std::cout<<"Hello from Cpu.\n";
}

__global__
void helloGPU()
{
  printf("Hello also from Gpu.\n");
}

int main()
{

  helloCPU();
  helloGPU<<<5, 5>>>();

  cudaDeviceSynchronize();

  return EXIT_SUCCESS;
}
