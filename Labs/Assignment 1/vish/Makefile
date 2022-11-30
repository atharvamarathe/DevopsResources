all: a.out
graph.o: graph.c graph.h 
	gcc -Wall -c graph.c
main.o: main.c graph.h 
	gcc -Wall -c main.c
a.out: graph.o main.o 
	gcc -Wall graph.o main.o 
