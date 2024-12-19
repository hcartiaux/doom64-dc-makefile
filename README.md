# Doom 64 for Dreamcast Makefiles

This is a set of Makefile to build [Doom64-dc](https://github.com/jnmartin84/doom64-dc) and generate a bootable `.cdi` image file that can be burnt on a regular CD-R.

![Doom64](https://github.com/hcartiaux/doom64-dc-makefile/blob/main/doom64.png?raw=true)

## Game files

You must obtain these files by your own mean and place them in the directory `00_game_files`

| File name    | md5sum                             | Description                                                                                                                                                                       |
|--------------|------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `doom64.z64` | `b67748b64a2cc7efd2f3ad4504561e0e` | Doom64 N64 ROM                                                                                                                                                                    |
| `doom64.wad` | `0aaba212339c72250f8a53a0a2b6189e` | [Nightdive Lost Levels](https://store.steampowered.com/app/1148590/DOOM_64/), copy this file `~/.local/share/Steam/steamapps/common/Doom 64/DOOM64.WAD` from your Steam directory |

## Build

```
git clone https://github.com/hcartiaux/doom64-dc-makefile.git
cd doom64-dc-makefile
make
```

