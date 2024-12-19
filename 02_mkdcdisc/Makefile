##################################################################################
# Makefile - Build mkdcdisc
# Time-stamp: <Thu 2024-12-19 17:22:51 hcartiaux>
#
############################## Variables Declarations ############################
DEPENDENCIES = git meson build-essential pkg-config libisofs-dev
GIT_URL = "https://gitlab.com/simulant/mkdcdisc"
TARGET = "/root/mkdcdisc"
INSTALL_LOCATION = "/usr/local/bin/"

.ONESHELL:
.SHELLFLAGS += -e
.PHONY: all info deps clone build install

###############
all: deps clone build install

info:
	@echo "DEPENDENCIES     = $(DEPENDENCIES)"
	@echo "GIT_URL          = $(GIT_URL)"
	@echo "TARGET           = $(TARGET)"
	@echo "INSTALL_LOCATION = $(INSTALL_LOCATION)"

deps:
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $(DEPENDENCIES)

clone:
	mkdir -p $(TARGET)
	chmod -R 755 $(TARGET)
	chown -R $(id -u):$(id -g) $(TARGET)
	git clone $(GIT_URL) $(TARGET)

build:
	cd $(TARGET)
	meson setup builddir
	meson compile -C builddir

install:
	cp $(TARGET)/builddir/mkdcdisc $(INSTALL_LOCATION)
