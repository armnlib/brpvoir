
.SUFFIXES : .ftn .f .cdk

SHELL = /bin/sh

FFLAGS =

CFLAGS =

OPTIMIZ = -O 2

default: absolu

.ftn.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<

.c.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(CFLAGS)" -src $<

.f.o:
	r.compile -arch $(ARCH) -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<


OBJECTS= brpvoir.o

FICHIERS= brpvoir.f

absolu: $(OBJECTS) 
	r.build -o brpvoir -obj $(OBJECTS) -arch $(ARCH) -abi $(ABI) -librmn rmn_x

clean:
#Faire le grand menage. On enleve tous les fichiers sources\ninutiles et les .o 
	-if [ "*.ftn" != "`echo *.ftn`" ] ; \
	then \
	for i in *.ftn ; \
	do \
	fn=`r.basename $$i '.ftn'`; \
	rm -f $$fn.f; \
	done \
	fi
	rm *.o brpvoir