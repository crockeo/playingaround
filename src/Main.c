#include <stdio.h>

#include "Game.h"

const char* CFG_NAME = "config.cfg";
const unsigned char DEBUG = 0;

// Opening the config file
FILE* open_config() { return fopen(CFG_NAME, "r"); }

// Printing an error string
void err_print(const char* string)
{
    fprintf(stderr, "%s\n", string);
    if (DEBUG)
        printf("%s\n", string);
}

// Printing error messages (depending on the error code)
int error(int errc)
{
    switch (errc)
    {
        case 1:
            err_print("Specified root level doesn't exist.");
            break;
        case 2:
            err_print("Config file not present.");
            break;
    }

    return errc;
}

// Main function
// 
// Return values:
//  0 - All's well
//  1 - Invalid root level
//  2 - Config file not present
int main(int argc, char** argv)
{
    if (argc == 2)
    {
        FILE* f_lvl = fopen(argv[1], "r");
        if (f_lvl == NULL)
            return error(1);
        fclose(f_lvl);
        start_game(argv[1]);
    } else
    {
        FILE* cfg = open_config();
        if (cfg == NULL)
            return error(2);
    }

    return 0;
}
