#ifndef LEVEL_H
#define LEVEL_H

typedef struct LEVEL
{
    char* message;
    char** options;
    struct LEVEL** levels;

    int len;
} LEVEL;

// Creating a level
LEVEL* create_level(char* message, char** options, LEVEL** levels, int len);

// Loading a level from a file
LEVEL* load_level(const char* path);

// Destroying a level
void destroy_level(LEVEL* level);

// Writing a level out to stdout
void write_level(LEVEL* level);

// Accessors
char* get_message(LEVEL* level);
char** get_options(LEVEL* level);
char* get_option(LEVEL* level, int index);
LEVEL** get_sublevels(LEVEL* level);
LEVEL* get_sublevel(LEVEL* level, int index);
int get_length(LEVEL* level);

#endif
