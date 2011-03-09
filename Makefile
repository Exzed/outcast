builddir := .
db2dir := /opt/ibm/db2/V9.7

gxx := g++ -O2 -Wall -I$(db2dir)/include -L$(db2dir)/lib32 -ldb2

common := $(builddir)/common.o
bibauthor := $(builddir)/bibauthor
execs := $(bibauthor)

all: $(execs)

$(common): common.sqC
	db2 connect to cs348
	db2 precompile common.sqC bindfile
	db2 bind common.bnd
	$(gxx) -c common.C

$(bibauthor): bibauthor.sqC $(common)
	db2 connect to cs348
	db2 precompile bibauthor.sqC bindfile
	db2 bind bibauthor.bnd
	$(gxx) -o $(bibauthor) bibauthor.C $(common)