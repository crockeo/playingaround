#include "Game.h"

#include "Level.h"
#include <stdbool.h>
#include <stdio.h>

// Tracking if the game is running
bool game_running = false;

// Drawing the game
void draw_game(LEVEL* curr_level)
{
    write_level(curr_level);
    printf(": ");
}

// Updating the game
LEVEL* update_game(LEVEL* curr_level, int num)
{
    if (--num >= 0 && num <= get_length(curr_level))
        return get_sublevel(curr_level, num);
    return NULL;
}

// The game loop
void game_loop(LEVEL* start_level)
{
    LEVEL* current_level = start_level;

    int i;
    while (game_running)
    {
        draw_game(current_level);
        scanf("%d", &i);
        current_level = update_game(current_level, i);
    }
}

// Starting the game
void start_game(char* src_level)
{
    game_running = true;
    game_loop(load_level(src_level));
}

// Ending the game
void end_game() { game_running = false; }
