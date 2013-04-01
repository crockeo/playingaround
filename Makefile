CC=ghc
OUT=engine.exe
OUTL=engine

# Builing for windows
windows:
	$(CC) -o $(OUT) -outputdir out/ Main.hs

# Builing for linux
linux:
	$(CC) -o $(OUTL) -outputdir out/ Main.hs
