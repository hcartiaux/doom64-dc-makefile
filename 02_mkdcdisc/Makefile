##################################################################################
# Makefile - Build mkdcdisc
# Time-stamp: <Thu 2024-12-19 17:22:51 hcartiaux>
#
############################## Variables Declarations ############################
DEPENDENCIES     = git meson build-essential pkg-config libisofs-dev
GIT_URL          = "https://gitlab.com/simulant/mkdcdisc"
TARGET           = "/tmp/mkdcdisc"
INSTALL_LOCATION = "/usr/local/bin/"

.ONESHELL:
.SHELLFLAGS += -e
.PHONY: all info deps clone build install clean

user  = $(shell id -u)
group = $(shell id -g)
ifneq ($(user), root)
    SUDO = "sudo"
endif

###############
all: deps clone build install

info:
	@echo "DEPENDENCIES     = $(DEPENDENCIES)"
	@echo "GIT_URL          = $(GIT_URL)"
	@echo "TARGET           = $(TARGET)"
	@echo "INSTALL_LOCATION = $(INSTALL_LOCATION)"

deps:
	DEBIAN_FRONTEND=noninteractive $(SUDO) apt-get install -y --no-install-recommends $(DEPENDENCIES)

clone:
	mkdir -p "$(TARGET)"
	chmod -R 755 "$(TARGET)"
	chown -R $(user):$(group) "$(TARGET)"
	git clone $(GIT_URL) "$(TARGET)"

build:
	cd "$(TARGET)"
	meson setup builddir
	meson compile -C builddir

install:
	$(SUDO) cp "$(TARGET)/builddir/mkdcdisc" "$(INSTALL_LOCATION)"

clean:
	rm -rf "$(TARGET)"
	$(SUDO) rm -f  "$(INSTALL_LOCATION)/mkdcdisc"
