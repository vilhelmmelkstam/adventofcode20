#include <stdio.h>

const int INPUT_SIZE = 200;

int main()
{
  FILE *file = fopen("input.txt", "r");

  int entries[INPUT_SIZE];

  int index = 0;
  while (!feof(file))
  {
    fscanf(file, "%d", &entries[index]);
    ++index;
  }
  fclose(file);

  for (int i = 0; i < INPUT_SIZE; ++i)
  {
    for (int j = i + 1; j < INPUT_SIZE; ++j)
    {
      for (int k = j; k < INPUT_SIZE; ++k)
      {
        if (entries[i] + entries[j] + entries[k] == 2020)
        {
          printf("%d\n", entries[i] * entries[j] * entries[k]);
        }
      }
    }
  }
}
