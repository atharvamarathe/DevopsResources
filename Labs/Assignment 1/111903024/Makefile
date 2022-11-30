all: a.out
a.out: module2.o module1.o main.o 
	gcc -Wall module2.o module1.o main.o 
module2.o: module2.c module2.h 
	gcc -Wall -c module2.c
module1.o: module1.c module1.h 
	gcc -Wall -c module1.c
main.o: main.c module1.c module2.c module1.h module2.h
	gcc -Wall -c main.c module1.c module2.c 
