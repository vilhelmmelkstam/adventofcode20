#include <stdio.h>
#include <string.h>

int main()
{
  int validPassports = 0;

  // Keep track of which fields have been found
  _Bool byr, iyr, eyr, hgt, hcl, ecl, pid;

  char field[100];
  while (fgets(field, 100, stdin) != NULL) // Read line
  {
    if (field[0] != '\n') // If not empty line
    {
      byr = byr || strstr(field, "byr:") != NULL; // Set true if field found
      iyr = iyr || strstr(field, "iyr:") != NULL;
      eyr = eyr || strstr(field, "eyr:") != NULL;
      hgt = hgt || strstr(field, "hgt:") != NULL;
      hcl = hcl || strstr(field, "hcl:") != NULL;
      ecl = ecl || strstr(field, "ecl:") != NULL;
      pid = pid || strstr(field, "pid:") != NULL;
    }
    else // If empty line
    {
      if (byr && iyr && eyr && hgt && hcl && ecl && pid) // Add if all fields were found
        validPassports++;

      // Reset field flags
      byr = 0; iyr = 0; eyr = 0; hgt = 0; hcl = 0; ecl = 0; pid = 0;
    }
  }

  printf("%d", validPassports);
}