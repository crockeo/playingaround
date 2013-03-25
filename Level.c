#include "Level.h"

#include <stdlib.h>
#include <stdio.h>

// Creating a level
LEVEL* create_level(char* message, char** options, LEVEL** levels, int len)
{
    LEVEL* l = (LEVEL*)malloc(1 * sizeof(LEVEL));

    l->message = message;
    l->options = options;
    l->levels = levels;
    l->len = len;

    return l;
}

// Loading a level from a file
LEVEL* load_level(char* path)
{
    FILE* fp = fopen(path, "r");
    if (fp == NULL) return NULL;

    LEVEL* l = (LEVEL*)malloc(1 * sizeof(LEVEL));

    // TODO

    return l;
}

// Destroying a level
void destroy_level(LEVEL* level)
{
    free(level->message);
    for (int i = 0; i < level->len; i++)
        free(level->options[i]);
    free(level->options);
    free(level->levels);
    free(level);
}

// Writing a level out to stdout
void write_level(LEVEL* level)
{
    printf("%s\n\n", get_message(level));
    for (int i = 0; i < get_length(level); i++)
        printf("%d. %s", i + 1, get_options(level)[i]);
}

// Accessors
char* get_message(LEVEL* level) { return level->message; }
char** get_options(LEVEL* level) { return level->options; }
char* get_option(LEVEL* level, int index) { return get_options(level)[index]; }
LEVEL** get_sublevels(LEVEL* level) { return level->levels; }
LEVEL* get_sublevel(LEVEL* level, int index) { return get_sublevels(level)[index]; }
int get_length(LEVEL* level) { return level->len; }
