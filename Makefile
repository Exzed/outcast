builddir := .
db2dir := /opt/ibm/db2/V9.7

gxx := g++ -O2 -Wall -I$(db2dir)/include -L$(db2dir)/lib32 -ldb2

# sqC files
common_sqC := common.sqC
bibauthor_sqC := bibauthor.sqC

bibauthor := $(builddir)/bibauthor
execs := $(bibauthor)

all: $(execs)

$(bibauthor): $(common_sqC) $(bibauthor_sqC)
	cat $(common_sqC)  $(bibauthor_sqC) > _bibauthor.sqC
	db2 connect to cs348
	db2 precompile _bibauthor.sqC bindfile
	db2 bind _bibauthor.bnd
	$(gxx) -o $(bibauthor) _bibauthor.C