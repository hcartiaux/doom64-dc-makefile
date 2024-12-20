##################################################################################
# Makefile - Configuration file for GNU make (http://www.gnu.org/software/make/)
# Time-stamp: <Fri 2024-12-20 11:24:32 hcartiaux>
#
# Copyright (c) 2024 Sebastien Varrette <Hyacinthe.Cartiaux@gmail.com>
#
############################## Variables Declarations ############################

.ONESHELL:
.SHELLFLAGS += -e
.PHONY: all info check

###############
all: check

info:

check:
	md5sum -c "$(CURDIR)/doom64.md5sums"

