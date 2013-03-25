CC=gcc
CFLAGS=-std=c99 -Wall -Werror
SOURCES=src/Main.c src/Game.c src/LevelLoader.c src/Level.c src/IOUtils.c
OBJECTS=$(SOURCES:.c=.o)
EXEC=playingaround

default: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(EXEC)

clean:
	rm -rf *.o playingaround *.exe *.out core src/*.o
