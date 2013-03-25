#include "LevelLoader.h"

#include <stdlib.h>
#include <stdio.h>

void parse_line(const char* line, LEVEL* lvl)
{

}

LEVEL* load_level_from_file(const char* path)
{
    FILE* fp = fopen(path, "r");
    if (fp == NULL) return NULL;

    LEVEL* lvl = (LEVEL*)malloc(1 * sizeof(LEVEL));

    // TODO: Add parsing
    //
    return lvl;
}
