#include <cstdio>
#include "cuda.h"

void CPUFunction()
{
  printf("hello from the Cpu.\n");
}

__global__
void GPUFunction()
{
  printf("hello from the Gpu.\n");
}

int main()
{
  CPUFunction();

  GPUFunction<<<1, 1>>>();

  cudaDeviceSynchronize();

  return EXIT_SUCCESS;
}
