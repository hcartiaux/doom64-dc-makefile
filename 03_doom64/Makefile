##################################################################################
# Makefile - Build doom64 for Dreamcast
# Time-stamp: <Thu 2024-12-19 17:30:22 hcartiaux>
#
############################## Variables Declarations ############################
CUR_DIR = $(shell cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
GIT_URL = "https://github.com/jnmartin84/doom64-dc"
TARGET = "/root/doom64-dc"

.ONESHELL:
.SHELLFLAGS += -e
.PHONY: clone link build

###############
all: clone link build

info:
	@echo "CUR_DIR = $(CUR_DIR)"
	@echo "GIT_URL = $(GIT_URL)"
	@echo "TARGET  = $(TARGET)"

clone:
	mkdir -p $(TARGET)
	chmod -R 755 $(TARGET)
	chown -R $(id -u):$(id -g) $(TARGET)
	git clone $(GIT_URL) $(TARGET)

link:
	cd $(TARGET)
	ln $(CUR_DIR)/../00_game_files/doom64.wad
	ln $(CUR_DIR)/../00_game_files/doom64.z64

build:
	cd $(TARGET)
	make -j $(nproc)
	make cdi
