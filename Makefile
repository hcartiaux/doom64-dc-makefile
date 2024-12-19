##################################################################################
# Makefile - Generic Configuration file for GNU make (http://www.gnu.org/software/make/)
# Time-stamp: <Wed 2024-12-18 21:33:32 hcartiaux>
#
# Copyright (c) 2024 Hyacinthe Cartiaux <Hyacinthe.Cartiaux@gmail.com>
# Copyright (c) 2016 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#
############################## Variables Declarations ############################

DIRS    = $(sort $(dir $(wildcard */)))
TARGETS = $(DIRS)

.ONESHELL:
.SHELLFLAGS += -e

###############
all: $(TARGETS)

list:
	@echo "DIRS           = $(DIRS)"
	@echo "TARGETS        = $(TARGETS)"

# generic rule -- pass whatever target (incl. none) to each subdirs.
%:
	@for d in $(DIRS); do \
		if [ -f "./$$d/Makefile" ]; then \
			echo "==> processing '$$d'"; \
			$(MAKE) -C $$d $@; \
		fi; \
	done
