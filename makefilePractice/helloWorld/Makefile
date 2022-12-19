objects =  main.o print.o 
helloworld : $(objects) 
	gcc $(objects) -o helloworld.out
                                         
main.o : main.c print.h
	gcc -c main.c
print.o : print.c print.h
	gcc -c print.c

fileinformation: $(wildcard *.c)
	ls -la $?
clean : 
	rm -f $(objects) helloworld.out

