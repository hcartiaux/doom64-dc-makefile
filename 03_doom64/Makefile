##################################################################################
# Makefile - Build doom64 for Dreamcast
# Time-stamp: <Fri 2024-12-20 11:23:25 hcartiaux>
#
############################## Variables Declarations ############################
GIT_URL    = "https://github.com/jnmartin84/doom64-dc"
TARGET     = "/tmp/doom64-dc"
TOOLCHAINS = "/opt/toolchains/dc"

.ONESHELL:
.SHELLFLAGS += -e
.PHONY: all info clone link build print uninstall

user  = $(shell id -u)
group = $(shell id -g)

###############
all: clone link build print

info:
	@echo "CURDIR  = $(CURDIR)"
	@echo "GIT_URL = $(GIT_URL)"
	@echo "TARGET  = $(TARGET)"

clone:
	mkdir -p "$(TARGET)"
	chmod -R 755 "$(TARGET)"
	chown -R $(user):$(group) "$(TARGET)"
	git clone "$(GIT_URL)" "$(TARGET)"

link:
	cd "$(TARGET)"
	ln -s "$(CURDIR)/../00_game_files/doom64.wad" wadtool/
	ln -s "$(CURDIR)/../00_game_files/doom64.z64" wadtool/

build:
	cd "$(TARGET)"
	. "$(TARGET)/environ.sh"
	make -j $(shell nproc)
	make cdi
	cp "$(TARGET)/doom64.cdi" "$(CURDIR)/.."

print:
	@echo "==============================================="
	@echo "/!\ Doom64 .cdi file generated at location:"
	@echo "  $(shell dirname -- $(CURDIR))/doom64.cdi"
	@echo "==============================================="

uninstall:
	rm -rf "$(TARGET)"
