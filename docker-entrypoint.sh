#!/bin/bash
set -e

cp /mnt/*.wad /mnt/*.z64 /build/00_game_files

make -C /build/00_game_files

git -C /tmp/doom64-dc pull

make -C /build/03_doom64 link build print

chown --reference /mnt /build/doom64.cdi
cp --preserve /build/doom64.cdi /mnt
