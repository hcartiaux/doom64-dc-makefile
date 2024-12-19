##################################################################################
# Makefile - Configuration file for GNU make (http://www.gnu.org/software/make/)
# Time-stamp: <Wed 2024-12-18 21:33:32 hcartiaux>
#
# Copyright (c) 2024 Sebastien Varrette <Hyacinthe.Cartiaux@gmail.com>
#
############################## Variables Declarations ############################

CUR_DIR = $(shell cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

.ONESHELL:
.SHELLFLAGS += -e

###############
all: check

info:

check:
	md5sum -c "$(CUR_DIR)/doom64.md5sums"

