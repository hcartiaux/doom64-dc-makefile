##################################################################################
# Makefile - Build the KallistiOS toolchain
# Time-stamp: <Wed 2024-12-18 22:17:49 hcartiaux>
#
############################## Variables Declarations ############################
DEPENDENCIES = gawk patch bzip2 tar make libgmp-dev libmpfr-dev libmpc-dev gettext wget libelf-dev texinfo bison flex sed git build-essential diffutils curl libjpeg-dev libpng-dev python3 pkg-config cmake libisofs-dev meson ninja-build rake
TARGET       = /opt/toolchains/dc
GIT_URL      = https://github.com/KallistiOS/KallistiOS.git

.ONESHELL:
.SHELLFLAGS += -e
.PHONY: all info deps clone build_dc_chain build_kos clean

user  = $(shell id -u)
group = $(shell id -g)
ifneq ($(user), 0)
	SUDO = "sudo"
endif

###############
all: deps clone build_dc_chain build_kos

info:
	@echo "DEPENDENCIES   = $(DEPENDENCIES)"
	@echo "GIT_URL        = $(GIT_URL)"
	@echo "TARGET         = $(TARGET)"

deps:
	DEBIAN_FRONTEND=noninteractive $(SUDO) apt-get update
	DEBIAN_FRONTEND=noninteractive $(SUDO) apt-get install -y --no-install-recommends $(DEPENDENCIES)

clone:
	$(SUDO) mkdir -p "$(TARGET)"
	$(SUDO) chmod -R 755 "$(TARGET)"
	$(SUDO) chown -R $(user):$(group) "$(TARGET)"
	git clone "$(GIT_URL)" "$(TARGET)/kos"
	cd "$(TARGET)/kos"
	git config --global user.name  "Hyacinthe Cartiaux"
	git config --global user.email "hyacinthe.cartiaux@gmail.com"
	git checkout 829d092
	git fetch origin pull/838/head:soundfix
	git fetch origin pull/872/head:posixify
	git merge soundfix --no-commit
	git merge posixify --no-commit

build_dc_chain:
	cd "$(TARGET)/kos/utils/dc-chain"
	make -j $(shell nproc)
	make -j $(shell nproc) all
	make clean

build_kos:
	cd "$(TARGET)/kos"
	# Creating the doom64 environment file
	cp doc/environ.sh.sample environ.sh
	sed -i '/136/s/-O2/-O3 -flto=auto/g' environ.sh
	sed -i '/184/s/^#//g' environ.sh
	# Source environment
	. "$(TARGET)/kos/environ.sh"
	# Build
	make -j $(shell nproc)

clean:
	$(SUDO) rm -rf "$(TARGET)"
