include Makefile.base

.PHONY: exe
exe: build
	stack exec -- forensics-exe
