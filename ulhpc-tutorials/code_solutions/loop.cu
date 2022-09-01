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
   * Use 1 block of threads.
   */

  int block_size = 1;
  int kernel_size = 10;
  loop<<<block_size, kernel_size>>>();

  cudaDeviceSynchronize();

  return EXIT_SUCCESS;
}
