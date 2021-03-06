# Locate SDL_mixer library
# This module defines
# SDLMIXER_LIBRARY, the name of the library to link against
# SDLMIXER_FOUND, if false, do not try to link to SDL
# SDLMIXER_INCLUDE_DIR, where to find SDL/SDL.h
#
# $SDLDIR is an environment variable that would
# correspond to the ./configure --prefix=$SDLDIR
# used in building SDL.
#
# Created by Eric Wing. This was influenced by the FindSDL.cmake 
# module, but with modifications to recognize OS X frameworks and 
# additional Unix paths (FreeBSD, etc).

FIND_PATH(SDLMIXER_INCLUDE_DIR SDL_mixer.h
  PATHS
  $ENV{SDLMIXERDIR}
  $ENV{SDLDIR}
  NO_DEFAULT_PATH
  PATH_SUFFIXES include
)

FIND_PATH(SDLMIXER_INCLUDE_DIR SDL_mixer.h
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local/include/SDL
  /usr/include/SDL
  /usr/local/include/SDL12
  /usr/local/include/SDL11 # FreeBSD ports
  /usr/include/SDL12
  /usr/include/SDL11
  /usr/local/include
  /usr/include
  /sw/include/SDL # Fink
  /sw/include
  /opt/local/include/SDL # DarwinPorts
  /opt/local/include
  /opt/csw/include/SDL # Blastwave
  /opt/csw/include 
  /opt/include/SDL
  /opt/include
)

FIND_LIBRARY(SDLMIXER_LIBRARY 
  NAMES SDL_mixer
  PATHS
  $ENV{SDLMIXERDIR}
  $ENV{SDLDIR}
  NO_DEFAULT_PATH
    PATH_SUFFIXES lib64 lib
)

FIND_LIBRARY(SDLMIXER_LIBRARY 
  NAMES SDL_mixer
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
    PATH_SUFFIXES lib64 lib
)

SET(SDLMIXER_FOUND "NO")
IF(SDLMIXER_LIBRARY AND SDLMIXER_INCLUDE_DIR)
  SET(SDLMIXER_FOUND "YES")
ENDIF(SDLMIXER_LIBRARY AND SDLMIXER_INCLUDE_DIR)
