
TEMPHOMEQ="$(TEMPTORY)"
TEMPCONTRIBQ="$(TEMPCONTRIB)"

RMF=rm -f

TEMPCC=$(TEMPHOMEQ)/bin/tempacc

TEMPFLAGS=-DATS_MEMALLOC_LIBC 
CFLAGS=-O2
LFLAGS=

all:: example
example: example.dats ; $(TEMPCC) $(TEMPFLAGS) $(CFLAGS) -o $@ $< $(LFLAGS) 
cleanall:: ; $(RMF) example

cleanall:: ; $(RMF) *_*ats.c

clean:: cleanall
