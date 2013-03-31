CC=ghc
OUT=engine.exe
OUTL=engine

windows:
	$(CC) -o $(OUT) Main.hs

linux:
	$(CC) -o $(OUTL) Main.hs
