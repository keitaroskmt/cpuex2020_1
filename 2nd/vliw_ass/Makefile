CC = g++
CFLAGS = -Ofast -std=c++17 -Wall -lncurses

main: main.cpp writer.cpp parser.cpp
	$(CC) $(CFLAGS) -o $@ $+

.PHONY: clean
clean:
	rm -r main
