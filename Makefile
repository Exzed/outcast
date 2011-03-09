builddir := .
db2dir := /opt/ibm/db2/V9.7

gxx := g++ -O2 -Wall -I$(db2dir)/include -L$(db2dir)/lib32 -ldb2

# sqC files
common_sqC := common.sqC
bibauthor_sqC := bibauthor.sqC
bibcontent_sqC := bibcontent.sqC

bibauthor := $(builddir)/bibauthor
bibcontent := $(builddir)/bibcontent
execs := $(bibauthor) $(bibcontent)

all: $(execs)

$(bibauthor): $(common_sqC) $(bibauthor_sqC)
	cat $(common_sqC)  $(bibauthor_sqC) > _bibauthor.sqC
	db2 connect to cs348
	db2 precompile _bibauthor.sqC bindfile
	db2 bind _bibauthor.bnd
	$(gxx) -o $(bibauthor) _bibauthor.C
	rm _bibauthor.*

$(bibcontent): $(common_sqC) $(bibcontent_sqC)
	cat $(common_sqC)  $(bibcontent_sqC) > _bibcontent.sqC
	db2 connect to cs348
	db2 precompile _bibcontent.sqC bindfile
	db2 bind _bibcontent.bnd
	$(gxx) -o $(bibcontent) _bibcontent.C
	rm _bibcontent.*
	