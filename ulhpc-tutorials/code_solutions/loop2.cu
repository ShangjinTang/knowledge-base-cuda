#include <cstdio>
#include "cuda.h"

__global__
void loop()
{
  int i = blockIdx.x * blockDim.x + threadIdx.x;
  printf("This is iteration number %d\n", i);
}

int main()
{
  /*
   * When refactoring 'loop' to launch as a kernel, be sure
   * to use the execution configuration to control how many
   * "iterations" to perform.
   *
   * For this exercise, be sure to use more than 1 block in
   * the execution configuration.
   */

  int block_size = 2;
  int kernel_size = 5;
  loop<<<block_size, kernel_size>>>();

  cudaDeviceSynchronize();

  return EXIT_SUCCESS;
}
