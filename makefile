#!/usr/bin/env make -j -s
#SHELL := /usr/bin/env bash

ext := als
int ?= 10 #s
#------------------------------------------------------------------------------

#all: unzip convert

unzip: *.$(ext)
	@ g$@ -qS .$(ext) "$^" &&\
	for set in "$^"; do mv "$${set%.*}" "$$set"; done

convert: $(wildcard *.wav *.aif)
	@ set "$<" &&\
	af$@ -d alac "$<" "$${1%.*}".m4a &&\
	mv {"$$1","$${1%.*}".m4a}.asd
	@ mv "$<" ~/.trash
#	@ for file in $^; do af$@ -d alac $$file $${file%.*}.m4a &&\
#	mv {$$file,$${file%.*}.m4a}.asd && mv $$file ~/.trash; done

watch:
	@ while true; do $(MAKE) -s; sleep $(int); done

#------------------------------------------------------------------------------
.PHONY: all unzip convert watch
