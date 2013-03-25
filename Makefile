CC=gcc
CFLAGS=-std=c99 -Wall -Werror
SOURCES=Main.c Game.c Level.c IOUtils.c
OBJECTS=$(SOURCES:.c=.o)
EXEC=playingaround

default: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(EXEC)

clean:
	rm -rf *.o playingaround *.exe *.out core
