#
# 
# 
#

# Start by defining variables for the compiler and compiler flags (makes it easy to change later)
# We can then use the variables later with $()

CC = g++
CFLAGS = -g -Wall -Wextra



# Simply calling 'make' will invoke whatever entry comes first in the file
# We've set it up to be the default entry (a good habit)

default: Employee

# List the object files needed to create the executable file.:
# 

Employee:	  Employee.o Officer.o Supervisor.o Main.o
		$(CC) $(CFlags) -o  Employee Employee.o Officer.o Supervisor.o  Main.o 

# 

Employee.o: 	 Employee.cpp Employee.h
		$(CC) $(CFLAGS) -c $ Employee.cpp

Officer.o:     	Officer.cpp Officer.h
		$(CC) $(CFLAGS) -c  Officer.cpp

Supervisor.o:  Supervisor.cpp Supervisor.h
		$(CC) $(CFLAGS) -c Supervisor.cpp


# Then, the rule to create main.o

Main.o: Main.cpp Employee.h Officer.h Supervisor.h
		$(CC) $(CFLAGS) -c Main.cpp

# Now the logic to clean things up! (invoked with 'make clean')

clean:
	$(RM)  $(Employee) *.o *~
