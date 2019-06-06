#include <stdio.h>
#include <stdlib.h>
#include "webp/decode.h"

#define eprintf(...) fprintf(stderr, __VA_ARGS__)

const char *read_file(const char *name, size_t *length) {
  FILE *file = fopen(name, "rb");

  if(file == NULL) {
    eprintf("error while opening file %s.\n", name);
    return NULL;
  }

  // find out size of file
  fseek(file, 0, SEEK_END);
  *length = ftell(file);
  fseek(file, 0, SEEK_SET);

  // read file into buffer
  char *buffer = malloc(*length + 1);
  if(buffer) {
    if(*length != fread(buffer, 1, *length, file)) {
      eprintf("error while reading file %s.\n", name);
      free(buffer);
      return NULL;
    }
    buffer[*length] = '\0';
  }

  fclose(file);

  return buffer;
}

int main(int argc, char *argv[]) {
  size_t length;
  const char *file = read_file(argv[1], &length);
  printf("loaded file with length %zi.\n", length);

  int width, height;
  int ret = WebPGetInfo((const uint8_t *) file, length, &width, &height);
  printf("info ret = %i, width = %i, height = %i.\n", ret, width, height);

  return 0;
}
