#include "IOUtils.h"

#include <string.h>
#include <stdlib.h>

char read_char(FILE* fp) { return fgetc(fp); }
char* read_line(FILE* fp)
{
    int len = 16;
    char* t_str;
    char* str = (char*)malloc(len * sizeof(char));
    int index = 0;

    for (char c = read_char(fp); c != '\n' && c != '\0' && c != EOF; c = read_char(fp))
    {
        if (index >= len)
        {
            t_str = (char*)malloc((len * 2) * sizeof(char));
            strncpy(t_str, str, len);

            free(str);
            str = t_str;
        }

        str[index] = c;
        index++;
    }

    t_str = (char*)malloc((index + 1) * sizeof(char));
    strncpy(t_str, str, index);
    t_str[index] = '\0';

    free(str);

    return t_str;
}
