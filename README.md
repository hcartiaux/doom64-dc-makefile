# Doom 64 for Dreamcast Makefiles

This is a set of Makefiles to build [Doom64-dc](https://github.com/jnmartin84/doom64-dc) and generate a bootable `.cdi` image file that can be [burnt on a regular CD-R](https://github.com/alex-free/dreamcast-cdi-burner).

It works in several steps:

0. Verify the game files integrity
1. Build the [KallistiOS](https://dreamcast.wiki/Getting_Started_with_Dreamcast_development) environment and toolchain
2. Build [mkdcdisc](https://gitlab.com/simulant/mkdcdisc), mandatory to generate `.cdi` images
3. Finally, build Doom64

Before burning the CD-R, you can verify that the image file is functional with a Dreamcast emulator such as [Flycast](https://github.com/flyinghead/flycast).

![Doom64](https://github.com/hcartiaux/doom64-dc-makefile/blob/main/doom64.png?raw=true)

## Game files

You must obtain these files by your own means and place them in the directory `00_game_files`.

| File name    | md5sum                             | Description                                                                                                                                                                       |
|--------------|------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `doom64.z64` | `b67748b64a2cc7efd2f3ad4504561e0e` | Doom64 N64 ROM                                                                                                                                                                    |
| `doom64.wad` | `0aaba212339c72250f8a53a0a2b6189e` | [Nightdive Lost Levels](https://store.steampowered.com/app/1148590/DOOM_64/), copy this file `~/.local/share/Steam/steamapps/common/Doom 64/DOOM64.WAD` from your Steam directory |

## Build

### Automagically, using the Dockerfile

```
git clone https://github.com/hcartiaux/doom64-dc-makefile.git
cd doom64-dc-makefile
docker build -t doom64-dc .
# Place the files doom64.z64 and doom64.wad in the current directory before executing the next command
docker run -v $(pwd):/mnt/ doom64-dc
```

### Using the pre-built Docker image

This will save you 1 hour of compilation, but the Docker image may not contain the latest KallistiOS environment.

```
# Place the files doom64.z64 and doom64.wad in the current directory before executing the next command
docker run -v $(pwd):/mnt/ hcartiaux/doom64-dc-makefile
```

### Manually, inside an Ubuntu 24.04 Docker container as root

So far, this has been tested as root in an [Ubuntu 24.04 Docker container](https://hub.docker.com/_/ubuntu/):

```
# Clone this repository
git clone https://github.com/hcartiaux/doom64-dc-makefile.git
# Place the files doom64.z64 and doom64.wad in doom64-dc-makefile/00_game_files
# Run the build process in a docker container
docker run --name doom64-dc-build -v $(pwd)/doom64-dc-makefile/:/mnt/ -dt ubuntu:latest
docker exec -it doom64-dc-build /bin/bash -c "apt-get update ; apt-get install -y make"
docker exec -it doom64-dc-build /bin/bash -c "cd /mnt ; make"
# Clean-up
docker stop doom64-dc-build
docker rm doom64-dc-build
docker image rm ubuntu:latest
```

### On an Ubuntu 24.04 system as a regular user

**Do not follow the following instructions if you already have a KallistiOS environment set-up on your system,
it is very likely that it will get corrupted and/or removed.**

The Makefiles are also usable outside of a container:

```
git clone https://github.com/hcartiaux/doom64-dc-makefile.git
cd doom64-dc-makefile
make
```

If it succeeds, the path of the new file `doom64.cdi` will be printed.

```
===============================================
/!\ Doom64 .cdi file generated at location:
  /home/.../doom64-dc-makefile/doom64.cdi
===============================================
```

Finally, you can remove all the files created previously using the clean step (note that it will not uninstall packages and will not remove your `.cdi` file):

```
make clean
```

