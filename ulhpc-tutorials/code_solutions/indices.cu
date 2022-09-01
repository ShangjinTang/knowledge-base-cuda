#include <cstdio>
#include "cuda.h"

__global__
void printif()
{
  if (threadIdx.x == 1023 && blockIdx.x == 255) {
    printf("Success!\n");
  }
}

int main()
{
  /*
   * Update the execution configuration so that the kernel
   * will print `"Success!"`.
   */

  printif<<<256, 1024>>>();

  cudaDeviceSynchronize();

  return EXIT_SUCCESS;
}
