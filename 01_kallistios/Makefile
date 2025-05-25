##################################################################################
# Makefile - Build the KallistiOS toolchain
# Time-stamp: <Wed 2025-05-25 22:46:01 hcartiaux>
#
############################## Variables Declarations ############################
DEPENDENCIES = gawk patch bzip2 tar make libgmp-dev libmpfr-dev libmpc-dev gettext wget libelf-dev texinfo bison flex sed git build-essential diffutils curl libjpeg-dev libpng-dev python3 pkg-config cmake libisofs-dev meson ninja-build rake
TARGET       = /opt/toolchains/dc
# GIT_URL    = https://github.com/KallistiOS/KallistiOS.git
HTTPS_URL    = https://github.com/jnmartin84/doom64-dc/raw/refs/heads/main/doom64_kos.tgz

.ONESHELL:
.SHELLFLAGS += -e
.PHONY: all info deps clone build_dc_chain build_kos uninstall

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

# Build Upstream KallistiOS from git sources
clone:
	$(SUDO) mkdir -p "$(TARGET)"
	$(SUDO) chmod -R 755 "$(TARGET)"
 	$(SUDO) chown -R $(user):$(group) "$(TARGET)"
 	git clone "$(GIT_URL)" "$(TARGET)/kos"
	cd "$(TARGET)/kos"
	git checkout 2762cef

build_dc_chain:
	cd "$(TARGET)/kos/utils/dc-chain"
	make -j $(shell nproc)
	make -j $(shell nproc) all
	make clean

build_kos:
 	cd "$(TARGET)/kos"
 	# Creating the doom64 environment file
 	cp doc/environ.sh.sample environ.sh
# 	sed -i '/136/s/-O2/-O3 -flto=auto/g' environ.sh
# 	sed -i '/184/s/^#//g' environ.sh
 	# Source environment
 	. "$(TARGET)/kos/environ.sh"
 	# Build
 	make -j $(shell nproc)

uninstall:
	$(SUDO) rm -rf "$(TARGET)"
