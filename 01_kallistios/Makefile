##################################################################################
# Makefile - Build the KallistiOS toolchain
# Time-stamp: <Wed 2024-12-18 22:17:49 hcartiaux>
#
############################## Variables Declarations ############################
DEPENDENCIES = gawk patch bzip2 tar make libgmp-dev libmpfr-dev libmpc-dev gettext wget libelf-dev texinfo bison flex sed git build-essential diffutils curl libjpeg-dev libpng-dev python3 pkg-config cmake libisofs-dev meson ninja-build rake
TARGET = "/opt/toolchains/dc"
GIT_URL = "https://github.com/KallistiOS/KallistiOS.git"

.ONESHELL:
.SHELLFLAGS += -e
.PHONY: deps clone build_dc_chain build_kos

###############
all: deps clone build_dc_chain build_kos

info:
	@echo "DEPENDENCIES   = $(DEPENDENCIES)"
	@echo "GIT_URL        = $(GIT_URL)"
	@echo "TARGET         = $(TARGET)"

deps:
	apt-get install -y $(DEPENDENCIES)

clone:
	mkdir -p $(TARGET)
	chmod -R 755 $(TARGET)
	chown -R $(id -u):$(id -g) $(TARGET)
	git clone $(GIT_URL) $(TARGET)/kos
	cd $(TARGET)/kos
	git checkout 829d092
	git fetch origin pull/838/head:soundfix
	git switch soundfix

build_dc_chain:
	cd $(TARGET)/kos/utils/dc-chain
	make
	make all
	make clean

build_kos:
	cd $(TARGET)/kos
	cp doc/environ.sh.sample environ.sh
	sed -i '/136/s/-O2/-O3 -flto=auto/g' environ.sh
	sed -i '/184/s/^#//g' environ.sh
	source $(TARGET)/kos/environ.sh
	make
