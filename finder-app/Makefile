CROSS_COMPILE ?=
CC = $(CROSS_COMPILE)gcc

all: writer

writer: writer.o
	$(CC) writer.o -o writer

writer.o: writer.c
	$(CC) writer.c -c -o writer.o

clean:
	rm -f writer writer.o
