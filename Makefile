builddir := build/
db2dir := /opt/ibm/db2/V9.7

# Executables
bibauthor := $(builddir)bibauthor
execs := $(bibauthor)

all: $(execs)

$(bibauthor): bibauthor.sqC
	db2 connect to cs348
	db2 precompile bibauthor.sqC bindfile
	db2 bind bibauthor.bnd
	g++ -I$(db2dir)/include -L$(db2dir)/lib32 -ldb2 -o $(bibauthor) bibauthor.C