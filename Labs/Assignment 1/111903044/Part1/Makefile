a.out: addition.o division.o main.o multiplication.o subtraction.o
	cc addition.o division.o main.o multiplication.o subtraction.o -o a.out

addition.o: addition.c subtraction.h multiplication.h
	cc -c addition.c

division.o: division.c subtraction.h
	cc -c division.c

main.o: main.c addition.h multiplication.h subtraction.h division.h
	cc -c main.c

multiplication.o: multiplication.c
	cc -c multiplication.c

subtraction.o: subtraction.c
	cc -c subtraction.c

clean:
	rm -f *.o a.out
