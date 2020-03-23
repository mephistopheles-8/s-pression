
PATSHOMEQ="$(PATSHOME)"
PATSCONTRIBQ="$(PATSCONTRIB)"

RMF=rm -f

PATSCC=$(PATSHOMEQ)/bin/patscc

PATSFLAGS=-DATS_MEMALLOC_LIBC 
CFLAGS=-O2
LFLAGS=

all:: proc
proc: proc.dats ; $(PATSCC) $(PATSFLAGS) $(CFLAGS) $(C11FLAGS) -o $@ $< $(LFLAGS) 
cleanall:: ; $(RMF) proc

cleanall:: ; $(RMF) *_*ats.c

clean:: cleanall
