#include <stdio.h>
#include <stdlib.h>
#include "webp/decode.h"
#include "qdbmp/qdbmp.h"

#define eprintf(...) fprintf(stderr, __VA_ARGS__)

const char *read_file(const char *name, size_t *length) {
  FILE *file = fopen(name, "rb");

  if(file == NULL) {
    eprintf("error while opening file %s.\n", name);
    *length = 0;
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
      *length = 0;
      return NULL;
    }
    buffer[*length] = '\0';
  }

  fclose(file);

  return buffer;
}

int write_webp(const char *webp, size_t size, const char *target) {
  printf("decoding webp into %s as bmp.\n", target);
  int width, height;
  uint8_t *ret =  WebPDecodeRGB((const uint8_t*) webp, size, &width, &height);

  if(!ret) {
    eprintf("some error decoding webp.\n");
    return 1;
  }

  BMP *bmp = BMP_Create((UINT) width, (UINT) height, (USHORT) 24);

  if(!bmp) {
    eprintf("error creating bmp handle.\n");
    return 1;
  }

  size_t bytes_per_line = width * 3;
  size_t bytes_per_pixel = 3;

  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      const unsigned char *pos = ret + (y * bytes_per_line) + (x * bytes_per_pixel);
      BMP_SetPixelRGB(bmp, x, y, pos[0], pos[1], pos[2]);
    }
  }

  printf("writing output to %s.\n", target);
  BMP_WriteFile(bmp, target);
  BMP_Free(bmp);

  return 0;
}

int main(int argc, char *argv[]) {
  size_t length;
  const char *file = read_file(argv[1], &length);
  if(!file) return 1;
  printf("loaded file with length %zi.\n", length);

  int width, height;
  int ret = WebPGetInfo((const uint8_t *) file, length, &width, &height);
  printf("info ret = %i, width = %i, height = %i.\n", ret, width, height);

  if(argc > 2) {
    return write_webp(file, length, argv[2]);
  }

  return 0;
}
