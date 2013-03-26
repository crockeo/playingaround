#include "LevelLoader.h"

#include "Level.h"

////
// A special version of the LEVEL struct for loading
typedef struct
{
    char* message;
    char** options;
    LEVEL** levels;

    int options_index;
    int levels_index;

    int len;
} LOAD_LEVEL;

// Creating a basic LOAD_LEVEL
LOAD_LEVEL* create_load_level()
{
    LOAD_LEVEL* lvl = (LOAD_LEVEL*)malloc(1 * sizeof(LOAD_LEVEL));

    lvl->options_index = 0;
    lvl->levels_index = 0;

    lvl->len = 8;

    lvl->options = (char**)malloc(len * sizeof(char*));
    lvl->levels = (LEVEL**)malloc(len * sizeof(LEVEL*));

    return lvl;
}

// Adding an option to the LOAD_LEVEL
int add_option(LEVEL_LOAD* lvl, char* option)
{
    if (lvl == NULL) return 3;
    if (option == NULL) return 4;

    if (lvl->options_index >= lvl->len)
    {
        char** t_options = (char**)malloc((lvl->len * 2) * sizeof(char*));
        memcpy(t_options, lvl->options);

        lvl->len *= 2;
    }

    lvl->options[lvl->options_index] = option;

    return 0;
}

// Adding a level to the LOAD_LEVEL
int add_level(LOAD_LEVEL* lvl, LEVEL* alvl)
{
    if (lvl == NULL) return 3;
    if (alvl == NULL) return 4;

    if (lvl->levels_index >= lvl->len)
    {
        LEVEL** t_levels = (LEVEL**)malloc((lvl->len * 2) * sizeof(LEVEL*));
        memcpy(t_levels, lvl->levels);

        lvl->len *= 2;
    }

    lvl->levels[lvl->levels_index] = alvl;

    return 0;
}

// Parsing a line
int parse_line(LOAD_LEVEL* lvl, const char* line)
{
    if (lvl == NULL) return 1;
    if (line == NULL) return 2;


}

// Loading a level from a file
LEVEL* load_level_from_file(const char* path)
{
    FILE* fp = fopen(path, "r");
    if (fp == NULL) return NULL;

    LOAD_LEVEL* lvl = create_load_level();
}