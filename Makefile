BIN_FILES  = broker publisher suscriptor.class

CC = gcc
JCC = javac

CCFLAGS =	-Wall  -g

LDFLAGS = -L$(INSTALL_PATH)/lib/
LDLIBS = -lpthread

JFLAGS = -g


all: CFLAGS=$(CCFLAGS)
all: $(BIN_FILES)
.PHONY : all

broker: broker.o read_line.o database.o
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

publisher: publisher.o read_line.o
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

suscriptor.class: suscriptor.java
	$(JCC) $(JFLAGS) suscriptor.java

%.o: %.c
	$(CC) $(CCFLAGS) $(CFLAGS) -c $<

clean:
	rm -f $(BIN_FILES) *.o *.class *~


.SUFFIXES:
.PHONY : clean
