CFLAGS = -pedantic -ansi -Wall -m64 -I. -DDEBUG -O3
CC = clang++ 
LIBS = -lGL -lGLU
SRCS = main.cpp \
       Engine/Mantis.cpp \
       Engine/RandomNumberGenerator.cpp \
       Engine/StateManager.cpp \
       Engine/LogSystem.cpp \
       Engine/LoggerFactory.cpp \
       Engine/NullLogger.cpp \
       Engine/FileLogger.cpp \
       Engine/VideoSystem.cpp \
       Game/Vector.cpp \
       Game/PandoraGame.cpp \
       Game/Virus.cpp \
       Game/VirusCache.cpp \
       Game/VirusViewer.cpp \
       Game/VirusGenerator.cpp \
       Game/SquareProtein.cpp \
       Game/CircleProtein.cpp \
       Game/TriangleProtein.cpp \
       Game/Cell.cpp \
       Game/Antibody.cpp \
       Game/Map.cpp \
       Game/Tile.cpp \
       Game/Region.cpp \
       Game/GameCamera.cpp \
       Game/BoundingCircle.cpp \
       Game/VirusData.cpp \
       Game/Entity.cpp \
       Game/SearchNode.cpp \
       Game/VirusFilter.cpp \
       Game/DamageInfo.cpp \
       Game/ModelCache.cpp \
       Game/ShockwaveEffect.cpp \
       Game/DebrisEffect.cpp \
       Game/Color.cpp \
       Game/BubbleEffect.cpp
OBJS = main.o \
       Mantis.o \
       RandomNumberGenerator.o \
       StateManager.o \
       LogSystem.o \
       LoggerFactory.o \
       NullLogger.o \
       FileLogger.o \
       VideoSystem.o \
       Vector.o \
       PandoraGame.o \
       Virus.o \
       VirusCache.o \
       VirusViewer.o \
       VirusGenerator.o \
       SquareProtein.o \
       CircleProtein.o \
       TriangleProtein.o \
       Cell.o \
       Antibody.o \
       Map.o \
       Tile.o \
       Region.o \
       GameCamera.o \
       BoundingCircle.o \
       VirusData.o \
       Entity.o \
       SearchNode.o \
       VirusFilter.o \
       DamageInfo.o \
       ModelCache.o \
       ShockwaveEffect.o \
       DebrisEffect.o \
       Color.o \
       BubbleEffect.o

pandora: ${OBJS}
	${CC} ${CFLAGS} -o $@ ${OBJS} ${LIBS} `sdl-config --libs`

%.o: ./Engine/%.cpp
	${CC} ${CFLAGS} -c $< `sdl-config --cflags`

%.o: ./Game/%.cpp
	${CC} ${CFLAGS} -c $< `sdl-config --cflags`

%.o: ./%.cpp
	${CC} ${CFLAGS} -c $< `sdl-config --cflags`

depend:
	makedepend ${SRCS} -I.

clean:
	rm ./Engine/*~ ./Game/*~ *.o *~ pandora Makefile.bak > /dev/null 2>&1


# DO NOT DELETE

main.o: ./Game/PandoraGame.hpp ./Engine/Mantis.hpp
main.o: ./Engine/RandomNumberGenerator.hpp ./Engine/StateManager.hpp
main.o: ./Engine/State.hpp /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
main.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
main.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
main.o: /usr/include/features.h /usr/include/sys/cdefs.h
main.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
main.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
main.o: /usr/include/bits/typesizes.h /usr/include/time.h
main.o: /usr/include/endian.h /usr/include/bits/endian.h
main.o: /usr/include/sys/select.h /usr/include/bits/select.h
main.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
main.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
main.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
main.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
main.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
main.o: /usr/include/alloca.h /usr/include/string.h /usr/include/strings.h
main.o: /usr/include/inttypes.h /usr/include/stdint.h
main.o: /usr/include/bits/wchar.h /usr/include/ctype.h /usr/include/iconv.h
main.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
main.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
main.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
main.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
main.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
main.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
main.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
main.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
main.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
main.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
main.o: /usr/include/SDL/SDL_version.h /usr/include/SDL/SDL_opengl.h
main.o: /usr/include/GL/gl.h /usr/include/GL/glext.h /usr/include/GL/glu.h
main.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp ./Engine/Logger.hpp
main.o: ./Engine/FileLogger.hpp ./Engine/NullLogger.hpp
main.o: ./Engine/VideoSystem.hpp ./Game/VirusViewer.hpp ./Game/Entity.hpp
main.o: ./Game/Region.hpp ./Game/Vector.hpp ./Game/Constants.hpp
main.o: ./Game/BoundingCircle.hpp ./Game/Virus.hpp ./Game/VirusCache.hpp
main.o: ./Game/VirusGenerator.hpp ./Game/VirusData.hpp ./Game/Protein.hpp
main.o: ./Game/SquareProtein.hpp ./Game/CircleProtein.hpp
main.o: ./Game/TriangleProtein.hpp ./Game/Antibody.hpp ./Game/DamageInfo.hpp
main.o: ./Game/VisualEffect.hpp ./Game/DebrisEffect.hpp ./Game/Color.hpp
main.o: ./Game/SearchNode.hpp ./Game/AIData.hpp ./Game/Cell.hpp
main.o: ./Game/ModelCache.hpp ./Game/BubbleEffect.hpp ./Game/Map.hpp
main.o: ./Game/Tile.hpp ./Game/GameCamera.hpp
Engine/Mantis.o: Engine/Mantis.hpp ./Engine/RandomNumberGenerator.hpp
Engine/Mantis.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Engine/Mantis.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Engine/Mantis.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
Engine/Mantis.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Engine/Mantis.o: /usr/include/features.h /usr/include/sys/cdefs.h
Engine/Mantis.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Engine/Mantis.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Engine/Mantis.o: /usr/include/bits/typesizes.h /usr/include/time.h
Engine/Mantis.o: /usr/include/endian.h /usr/include/bits/endian.h
Engine/Mantis.o: /usr/include/sys/select.h /usr/include/bits/select.h
Engine/Mantis.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Engine/Mantis.o: /usr/include/sys/sysmacros.h
Engine/Mantis.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Engine/Mantis.o: /usr/include/libio.h /usr/include/_G_config.h
Engine/Mantis.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Engine/Mantis.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Engine/Mantis.o: /usr/include/alloca.h /usr/include/string.h
Engine/Mantis.o: /usr/include/strings.h /usr/include/inttypes.h
Engine/Mantis.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Engine/Mantis.o: /usr/include/ctype.h /usr/include/iconv.h
Engine/Mantis.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
Engine/Mantis.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Engine/Mantis.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
Engine/Mantis.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
Engine/Mantis.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
Engine/Mantis.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
Engine/Mantis.o: /usr/include/SDL/SDL_keyboard.h
Engine/Mantis.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
Engine/Mantis.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
Engine/Mantis.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
Engine/Mantis.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
Engine/Mantis.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Engine/Mantis.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Engine/Mantis.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Engine/Mantis.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Engine/Mantis.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Engine/RandomNumberGenerator.o: ./Engine/RandomNumberGenerator.hpp
Engine/StateManager.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Engine/StateManager.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Engine/StateManager.o: /usr/include/SDL/SDL_stdinc.h
Engine/StateManager.o: /usr/include/SDL/SDL_config.h
Engine/StateManager.o: /usr/include/SDL/SDL_platform.h
Engine/StateManager.o: /usr/include/sys/types.h /usr/include/features.h
Engine/StateManager.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Engine/StateManager.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Engine/StateManager.o: /usr/include/bits/types.h
Engine/StateManager.o: /usr/include/bits/typesizes.h /usr/include/time.h
Engine/StateManager.o: /usr/include/endian.h /usr/include/bits/endian.h
Engine/StateManager.o: /usr/include/sys/select.h /usr/include/bits/select.h
Engine/StateManager.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Engine/StateManager.o: /usr/include/sys/sysmacros.h
Engine/StateManager.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Engine/StateManager.o: /usr/include/libio.h /usr/include/_G_config.h
Engine/StateManager.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Engine/StateManager.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Engine/StateManager.o: /usr/include/alloca.h /usr/include/string.h
Engine/StateManager.o: /usr/include/strings.h /usr/include/inttypes.h
Engine/StateManager.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Engine/StateManager.o: /usr/include/ctype.h /usr/include/iconv.h
Engine/StateManager.o: /usr/include/SDL/begin_code.h
Engine/StateManager.o: /usr/include/SDL/close_code.h
Engine/StateManager.o: /usr/include/SDL/SDL_audio.h
Engine/StateManager.o: /usr/include/SDL/SDL_error.h
Engine/StateManager.o: /usr/include/SDL/SDL_endian.h
Engine/StateManager.o: /usr/include/SDL/SDL_mutex.h
Engine/StateManager.o: /usr/include/SDL/SDL_thread.h
Engine/StateManager.o: /usr/include/SDL/SDL_rwops.h
Engine/StateManager.o: /usr/include/SDL/SDL_cdrom.h
Engine/StateManager.o: /usr/include/SDL/SDL_cpuinfo.h
Engine/StateManager.o: /usr/include/SDL/SDL_events.h
Engine/StateManager.o: /usr/include/SDL/SDL_active.h
Engine/StateManager.o: /usr/include/SDL/SDL_keyboard.h
Engine/StateManager.o: /usr/include/SDL/SDL_keysym.h
Engine/StateManager.o: /usr/include/SDL/SDL_mouse.h
Engine/StateManager.o: /usr/include/SDL/SDL_video.h
Engine/StateManager.o: /usr/include/SDL/SDL_joystick.h
Engine/StateManager.o: /usr/include/SDL/SDL_quit.h
Engine/StateManager.o: /usr/include/SDL/SDL_loadso.h
Engine/StateManager.o: /usr/include/SDL/SDL_timer.h
Engine/StateManager.o: /usr/include/SDL/SDL_version.h
Engine/StateManager.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Engine/StateManager.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Engine/StateManager.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Engine/StateManager.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Engine/StateManager.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Engine/LogSystem.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Engine/LogSystem.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Engine/LogSystem.o: ./Engine/NullLogger.hpp
Engine/LoggerFactory.o: ./Engine/LoggerFactory.hpp ./Engine/Logger.hpp
Engine/LoggerFactory.o: ./Engine/FileLogger.hpp ./Engine/NullLogger.hpp
Engine/NullLogger.o: ./Engine/NullLogger.hpp ./Engine/Logger.hpp
Engine/FileLogger.o: ./Engine/FileLogger.hpp ./Engine/Logger.hpp
Engine/VideoSystem.o: ./Engine/VideoSystem.hpp ./Engine/LogSystem.hpp
Engine/VideoSystem.o: ./Engine/LoggerFactory.hpp ./Engine/Logger.hpp
Engine/VideoSystem.o: ./Engine/FileLogger.hpp ./Engine/NullLogger.hpp
Engine/VideoSystem.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_stdinc.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_config.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_platform.h
Engine/VideoSystem.o: /usr/include/sys/types.h /usr/include/features.h
Engine/VideoSystem.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Engine/VideoSystem.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Engine/VideoSystem.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
Engine/VideoSystem.o: /usr/include/time.h /usr/include/endian.h
Engine/VideoSystem.o: /usr/include/bits/endian.h /usr/include/sys/select.h
Engine/VideoSystem.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
Engine/VideoSystem.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
Engine/VideoSystem.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Engine/VideoSystem.o: /usr/include/libio.h /usr/include/_G_config.h
Engine/VideoSystem.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Engine/VideoSystem.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Engine/VideoSystem.o: /usr/include/alloca.h /usr/include/string.h
Engine/VideoSystem.o: /usr/include/strings.h /usr/include/inttypes.h
Engine/VideoSystem.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Engine/VideoSystem.o: /usr/include/ctype.h /usr/include/iconv.h
Engine/VideoSystem.o: /usr/include/SDL/begin_code.h
Engine/VideoSystem.o: /usr/include/SDL/close_code.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_audio.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_error.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_endian.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_mutex.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_thread.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_rwops.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_cdrom.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_cpuinfo.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_events.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_active.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_keyboard.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_keysym.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_mouse.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_video.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_joystick.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_quit.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_loadso.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_timer.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_version.h
Engine/VideoSystem.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Engine/VideoSystem.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/Vector.o: ./Game/Vector.hpp ./Game/Constants.hpp
Game/PandoraGame.o: Game/PandoraGame.hpp ./Engine/Mantis.hpp
Game/PandoraGame.o: ./Engine/RandomNumberGenerator.hpp
Game/PandoraGame.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/PandoraGame.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/PandoraGame.o: /usr/include/SDL/SDL_stdinc.h
Game/PandoraGame.o: /usr/include/SDL/SDL_config.h
Game/PandoraGame.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/PandoraGame.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/PandoraGame.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/PandoraGame.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/PandoraGame.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/PandoraGame.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/PandoraGame.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/PandoraGame.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/PandoraGame.o: /usr/include/sys/sysmacros.h
Game/PandoraGame.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/PandoraGame.o: /usr/include/libio.h /usr/include/_G_config.h
Game/PandoraGame.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/PandoraGame.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/PandoraGame.o: /usr/include/alloca.h /usr/include/string.h
Game/PandoraGame.o: /usr/include/strings.h /usr/include/inttypes.h
Game/PandoraGame.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/PandoraGame.o: /usr/include/ctype.h /usr/include/iconv.h
Game/PandoraGame.o: /usr/include/SDL/begin_code.h
Game/PandoraGame.o: /usr/include/SDL/close_code.h
Game/PandoraGame.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/PandoraGame.o: /usr/include/SDL/SDL_endian.h
Game/PandoraGame.o: /usr/include/SDL/SDL_mutex.h
Game/PandoraGame.o: /usr/include/SDL/SDL_thread.h
Game/PandoraGame.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
Game/PandoraGame.o: /usr/include/SDL/SDL_cpuinfo.h
Game/PandoraGame.o: /usr/include/SDL/SDL_events.h
Game/PandoraGame.o: /usr/include/SDL/SDL_active.h
Game/PandoraGame.o: /usr/include/SDL/SDL_keyboard.h
Game/PandoraGame.o: /usr/include/SDL/SDL_keysym.h
Game/PandoraGame.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
Game/PandoraGame.o: /usr/include/SDL/SDL_joystick.h
Game/PandoraGame.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
Game/PandoraGame.o: /usr/include/SDL/SDL_timer.h
Game/PandoraGame.o: /usr/include/SDL/SDL_version.h
Game/PandoraGame.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/PandoraGame.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/PandoraGame.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/PandoraGame.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/PandoraGame.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/PandoraGame.o: ./Game/VirusViewer.hpp ./Game/Entity.hpp
Game/PandoraGame.o: ./Game/Region.hpp ./Game/Vector.hpp ./Game/Constants.hpp
Game/PandoraGame.o: ./Game/BoundingCircle.hpp ./Game/Virus.hpp
Game/PandoraGame.o: ./Game/VirusCache.hpp ./Game/VirusGenerator.hpp
Game/PandoraGame.o: ./Game/VirusData.hpp ./Game/Protein.hpp
Game/PandoraGame.o: ./Game/SquareProtein.hpp ./Game/CircleProtein.hpp
Game/PandoraGame.o: ./Game/TriangleProtein.hpp ./Game/Antibody.hpp
Game/PandoraGame.o: ./Game/DamageInfo.hpp ./Game/VisualEffect.hpp
Game/PandoraGame.o: ./Game/DebrisEffect.hpp ./Game/Color.hpp
Game/PandoraGame.o: ./Game/SearchNode.hpp ./Game/AIData.hpp ./Game/Cell.hpp
Game/PandoraGame.o: ./Game/ModelCache.hpp ./Game/BubbleEffect.hpp
Game/PandoraGame.o: ./Game/Map.hpp ./Game/Tile.hpp ./Game/GameCamera.hpp
Game/Virus.o: ./Game/Virus.hpp ./Game/VirusCache.hpp
Game/Virus.o: ./Game/VirusGenerator.hpp ./Game/VirusData.hpp
Game/Virus.o: ./Game/Constants.hpp ./Game/Entity.hpp ./Game/Region.hpp
Game/Virus.o: ./Game/Vector.hpp ./Game/BoundingCircle.hpp ./Game/Protein.hpp
Game/Virus.o: ./Game/SquareProtein.hpp ./Engine/Mantis.hpp
Game/Virus.o: ./Engine/RandomNumberGenerator.hpp ./Engine/StateManager.hpp
Game/Virus.o: ./Engine/State.hpp /usr/include/SDL/SDL.h
Game/Virus.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
Game/Virus.o: /usr/include/SDL/SDL_config.h /usr/include/SDL/SDL_platform.h
Game/Virus.o: /usr/include/sys/types.h /usr/include/features.h
Game/Virus.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/Virus.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/Virus.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
Game/Virus.o: /usr/include/time.h /usr/include/endian.h
Game/Virus.o: /usr/include/bits/endian.h /usr/include/sys/select.h
Game/Virus.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
Game/Virus.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
Game/Virus.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/Virus.o: /usr/include/libio.h /usr/include/_G_config.h
Game/Virus.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/Virus.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/Virus.o: /usr/include/alloca.h /usr/include/string.h
Game/Virus.o: /usr/include/strings.h /usr/include/inttypes.h
Game/Virus.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/Virus.o: /usr/include/ctype.h /usr/include/iconv.h
Game/Virus.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
Game/Virus.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/Virus.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
Game/Virus.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
Game/Virus.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
Game/Virus.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
Game/Virus.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
Game/Virus.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
Game/Virus.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
Game/Virus.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
Game/Virus.o: /usr/include/SDL/SDL_version.h /usr/include/SDL/SDL_opengl.h
Game/Virus.o: /usr/include/GL/gl.h /usr/include/GL/glext.h
Game/Virus.o: /usr/include/GL/glu.h ./Engine/LogSystem.hpp
Game/Virus.o: ./Engine/LoggerFactory.hpp ./Engine/Logger.hpp
Game/Virus.o: ./Engine/FileLogger.hpp ./Engine/NullLogger.hpp
Game/Virus.o: ./Engine/VideoSystem.hpp ./Game/CircleProtein.hpp
Game/Virus.o: ./Game/TriangleProtein.hpp ./Game/Antibody.hpp
Game/Virus.o: ./Game/DamageInfo.hpp ./Game/VisualEffect.hpp
Game/Virus.o: ./Game/DebrisEffect.hpp ./Game/Color.hpp ./Game/SearchNode.hpp
Game/Virus.o: ./Game/AIData.hpp ./Game/Map.hpp ./Game/Tile.hpp
Game/Virus.o: ./Game/Cell.hpp ./Game/ModelCache.hpp ./Game/BubbleEffect.hpp
Game/Virus.o: Game/VirusFilter.hpp Game/ShockwaveEffect.hpp
Game/VirusCache.o: ./Game/VirusCache.hpp ./Game/VirusGenerator.hpp
Game/VirusCache.o: ./Game/VirusData.hpp ./Game/Constants.hpp
Game/VirusCache.o: ./Game/Entity.hpp ./Game/Region.hpp ./Game/Vector.hpp
Game/VirusCache.o: ./Game/BoundingCircle.hpp ./Game/Protein.hpp
Game/VirusCache.o: ./Game/SquareProtein.hpp ./Engine/Mantis.hpp
Game/VirusCache.o: ./Engine/RandomNumberGenerator.hpp
Game/VirusCache.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/VirusCache.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/VirusCache.o: /usr/include/SDL/SDL_stdinc.h
Game/VirusCache.o: /usr/include/SDL/SDL_config.h
Game/VirusCache.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/VirusCache.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/VirusCache.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/VirusCache.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/VirusCache.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/VirusCache.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/VirusCache.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/VirusCache.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/VirusCache.o: /usr/include/sys/sysmacros.h
Game/VirusCache.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/VirusCache.o: /usr/include/libio.h /usr/include/_G_config.h
Game/VirusCache.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/VirusCache.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/VirusCache.o: /usr/include/alloca.h /usr/include/string.h
Game/VirusCache.o: /usr/include/strings.h /usr/include/inttypes.h
Game/VirusCache.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/VirusCache.o: /usr/include/ctype.h /usr/include/iconv.h
Game/VirusCache.o: /usr/include/SDL/begin_code.h
Game/VirusCache.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
Game/VirusCache.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
Game/VirusCache.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
Game/VirusCache.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
Game/VirusCache.o: /usr/include/SDL/SDL_cpuinfo.h
Game/VirusCache.o: /usr/include/SDL/SDL_events.h
Game/VirusCache.o: /usr/include/SDL/SDL_active.h
Game/VirusCache.o: /usr/include/SDL/SDL_keyboard.h
Game/VirusCache.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
Game/VirusCache.o: /usr/include/SDL/SDL_video.h
Game/VirusCache.o: /usr/include/SDL/SDL_joystick.h
Game/VirusCache.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
Game/VirusCache.o: /usr/include/SDL/SDL_timer.h
Game/VirusCache.o: /usr/include/SDL/SDL_version.h
Game/VirusCache.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/VirusCache.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/VirusCache.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/VirusCache.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/VirusCache.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/VirusCache.o: ./Game/CircleProtein.hpp ./Game/TriangleProtein.hpp
Game/VirusCache.o: ./Game/Antibody.hpp ./Game/DamageInfo.hpp
Game/VirusCache.o: ./Game/VisualEffect.hpp ./Game/DebrisEffect.hpp
Game/VirusCache.o: ./Game/Color.hpp
Game/VirusViewer.o: ./Game/VirusViewer.hpp ./Engine/Mantis.hpp
Game/VirusViewer.o: ./Engine/RandomNumberGenerator.hpp
Game/VirusViewer.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/VirusViewer.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/VirusViewer.o: /usr/include/SDL/SDL_stdinc.h
Game/VirusViewer.o: /usr/include/SDL/SDL_config.h
Game/VirusViewer.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/VirusViewer.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/VirusViewer.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/VirusViewer.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/VirusViewer.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/VirusViewer.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/VirusViewer.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/VirusViewer.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/VirusViewer.o: /usr/include/sys/sysmacros.h
Game/VirusViewer.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/VirusViewer.o: /usr/include/libio.h /usr/include/_G_config.h
Game/VirusViewer.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/VirusViewer.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/VirusViewer.o: /usr/include/alloca.h /usr/include/string.h
Game/VirusViewer.o: /usr/include/strings.h /usr/include/inttypes.h
Game/VirusViewer.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/VirusViewer.o: /usr/include/ctype.h /usr/include/iconv.h
Game/VirusViewer.o: /usr/include/SDL/begin_code.h
Game/VirusViewer.o: /usr/include/SDL/close_code.h
Game/VirusViewer.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/VirusViewer.o: /usr/include/SDL/SDL_endian.h
Game/VirusViewer.o: /usr/include/SDL/SDL_mutex.h
Game/VirusViewer.o: /usr/include/SDL/SDL_thread.h
Game/VirusViewer.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
Game/VirusViewer.o: /usr/include/SDL/SDL_cpuinfo.h
Game/VirusViewer.o: /usr/include/SDL/SDL_events.h
Game/VirusViewer.o: /usr/include/SDL/SDL_active.h
Game/VirusViewer.o: /usr/include/SDL/SDL_keyboard.h
Game/VirusViewer.o: /usr/include/SDL/SDL_keysym.h
Game/VirusViewer.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
Game/VirusViewer.o: /usr/include/SDL/SDL_joystick.h
Game/VirusViewer.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
Game/VirusViewer.o: /usr/include/SDL/SDL_timer.h
Game/VirusViewer.o: /usr/include/SDL/SDL_version.h
Game/VirusViewer.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/VirusViewer.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/VirusViewer.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/VirusViewer.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/VirusViewer.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/VirusViewer.o: ./Game/Entity.hpp ./Game/Region.hpp ./Game/Vector.hpp
Game/VirusViewer.o: ./Game/Constants.hpp ./Game/BoundingCircle.hpp
Game/VirusViewer.o: ./Game/Virus.hpp ./Game/VirusCache.hpp
Game/VirusViewer.o: ./Game/VirusGenerator.hpp ./Game/VirusData.hpp
Game/VirusViewer.o: ./Game/Protein.hpp ./Game/SquareProtein.hpp
Game/VirusViewer.o: ./Game/CircleProtein.hpp ./Game/TriangleProtein.hpp
Game/VirusViewer.o: ./Game/Antibody.hpp ./Game/DamageInfo.hpp
Game/VirusViewer.o: ./Game/VisualEffect.hpp ./Game/DebrisEffect.hpp
Game/VirusViewer.o: ./Game/Color.hpp ./Game/SearchNode.hpp ./Game/AIData.hpp
Game/VirusViewer.o: ./Game/Cell.hpp ./Game/ModelCache.hpp
Game/VirusViewer.o: ./Game/BubbleEffect.hpp ./Game/Map.hpp ./Game/Tile.hpp
Game/VirusViewer.o: ./Game/GameCamera.hpp
Game/VirusGenerator.o: ./Game/VirusGenerator.hpp ./Game/VirusData.hpp
Game/VirusGenerator.o: ./Game/VirusCache.hpp /usr/include/SDL/SDL.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_main.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_stdinc.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_config.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_platform.h
Game/VirusGenerator.o: /usr/include/sys/types.h /usr/include/features.h
Game/VirusGenerator.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/VirusGenerator.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/VirusGenerator.o: /usr/include/bits/types.h
Game/VirusGenerator.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/VirusGenerator.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/VirusGenerator.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/VirusGenerator.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/VirusGenerator.o: /usr/include/sys/sysmacros.h
Game/VirusGenerator.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/VirusGenerator.o: /usr/include/libio.h /usr/include/_G_config.h
Game/VirusGenerator.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/VirusGenerator.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/VirusGenerator.o: /usr/include/alloca.h /usr/include/string.h
Game/VirusGenerator.o: /usr/include/strings.h /usr/include/inttypes.h
Game/VirusGenerator.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/VirusGenerator.o: /usr/include/ctype.h /usr/include/iconv.h
Game/VirusGenerator.o: /usr/include/SDL/begin_code.h
Game/VirusGenerator.o: /usr/include/SDL/close_code.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_audio.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_error.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_endian.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_mutex.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_thread.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_rwops.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_cdrom.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_cpuinfo.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_events.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_active.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_keyboard.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_keysym.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_mouse.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_video.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_joystick.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_quit.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_loadso.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_timer.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_version.h
Game/VirusGenerator.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/VirusGenerator.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/VirusGenerator.o: ./Game/Constants.hpp ./Game/Entity.hpp
Game/VirusGenerator.o: ./Game/Region.hpp ./Game/Vector.hpp
Game/VirusGenerator.o: ./Game/BoundingCircle.hpp ./Game/Protein.hpp
Game/VirusGenerator.o: ./Game/SquareProtein.hpp ./Engine/Mantis.hpp
Game/VirusGenerator.o: ./Engine/RandomNumberGenerator.hpp
Game/VirusGenerator.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/VirusGenerator.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/VirusGenerator.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/VirusGenerator.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/VirusGenerator.o: ./Game/CircleProtein.hpp ./Game/TriangleProtein.hpp
Game/VirusGenerator.o: ./Game/Antibody.hpp ./Game/DamageInfo.hpp
Game/VirusGenerator.o: ./Game/VisualEffect.hpp ./Game/DebrisEffect.hpp
Game/VirusGenerator.o: ./Game/Color.hpp
Game/SquareProtein.o: ./Game/SquareProtein.hpp ./Game/Protein.hpp
Game/SquareProtein.o: ./Engine/Mantis.hpp ./Engine/RandomNumberGenerator.hpp
Game/SquareProtein.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/SquareProtein.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/SquareProtein.o: /usr/include/SDL/SDL_stdinc.h
Game/SquareProtein.o: /usr/include/SDL/SDL_config.h
Game/SquareProtein.o: /usr/include/SDL/SDL_platform.h
Game/SquareProtein.o: /usr/include/sys/types.h /usr/include/features.h
Game/SquareProtein.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/SquareProtein.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/SquareProtein.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
Game/SquareProtein.o: /usr/include/time.h /usr/include/endian.h
Game/SquareProtein.o: /usr/include/bits/endian.h /usr/include/sys/select.h
Game/SquareProtein.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
Game/SquareProtein.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
Game/SquareProtein.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/SquareProtein.o: /usr/include/libio.h /usr/include/_G_config.h
Game/SquareProtein.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/SquareProtein.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/SquareProtein.o: /usr/include/alloca.h /usr/include/string.h
Game/SquareProtein.o: /usr/include/strings.h /usr/include/inttypes.h
Game/SquareProtein.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/SquareProtein.o: /usr/include/ctype.h /usr/include/iconv.h
Game/SquareProtein.o: /usr/include/SDL/begin_code.h
Game/SquareProtein.o: /usr/include/SDL/close_code.h
Game/SquareProtein.o: /usr/include/SDL/SDL_audio.h
Game/SquareProtein.o: /usr/include/SDL/SDL_error.h
Game/SquareProtein.o: /usr/include/SDL/SDL_endian.h
Game/SquareProtein.o: /usr/include/SDL/SDL_mutex.h
Game/SquareProtein.o: /usr/include/SDL/SDL_thread.h
Game/SquareProtein.o: /usr/include/SDL/SDL_rwops.h
Game/SquareProtein.o: /usr/include/SDL/SDL_cdrom.h
Game/SquareProtein.o: /usr/include/SDL/SDL_cpuinfo.h
Game/SquareProtein.o: /usr/include/SDL/SDL_events.h
Game/SquareProtein.o: /usr/include/SDL/SDL_active.h
Game/SquareProtein.o: /usr/include/SDL/SDL_keyboard.h
Game/SquareProtein.o: /usr/include/SDL/SDL_keysym.h
Game/SquareProtein.o: /usr/include/SDL/SDL_mouse.h
Game/SquareProtein.o: /usr/include/SDL/SDL_video.h
Game/SquareProtein.o: /usr/include/SDL/SDL_joystick.h
Game/SquareProtein.o: /usr/include/SDL/SDL_quit.h
Game/SquareProtein.o: /usr/include/SDL/SDL_loadso.h
Game/SquareProtein.o: /usr/include/SDL/SDL_timer.h
Game/SquareProtein.o: /usr/include/SDL/SDL_version.h
Game/SquareProtein.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/SquareProtein.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/SquareProtein.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/SquareProtein.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/SquareProtein.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/CircleProtein.o: ./Game/CircleProtein.hpp ./Game/Protein.hpp
Game/CircleProtein.o: ./Engine/Mantis.hpp ./Engine/RandomNumberGenerator.hpp
Game/CircleProtein.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/CircleProtein.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/CircleProtein.o: /usr/include/SDL/SDL_stdinc.h
Game/CircleProtein.o: /usr/include/SDL/SDL_config.h
Game/CircleProtein.o: /usr/include/SDL/SDL_platform.h
Game/CircleProtein.o: /usr/include/sys/types.h /usr/include/features.h
Game/CircleProtein.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/CircleProtein.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/CircleProtein.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
Game/CircleProtein.o: /usr/include/time.h /usr/include/endian.h
Game/CircleProtein.o: /usr/include/bits/endian.h /usr/include/sys/select.h
Game/CircleProtein.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
Game/CircleProtein.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
Game/CircleProtein.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/CircleProtein.o: /usr/include/libio.h /usr/include/_G_config.h
Game/CircleProtein.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/CircleProtein.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/CircleProtein.o: /usr/include/alloca.h /usr/include/string.h
Game/CircleProtein.o: /usr/include/strings.h /usr/include/inttypes.h
Game/CircleProtein.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/CircleProtein.o: /usr/include/ctype.h /usr/include/iconv.h
Game/CircleProtein.o: /usr/include/SDL/begin_code.h
Game/CircleProtein.o: /usr/include/SDL/close_code.h
Game/CircleProtein.o: /usr/include/SDL/SDL_audio.h
Game/CircleProtein.o: /usr/include/SDL/SDL_error.h
Game/CircleProtein.o: /usr/include/SDL/SDL_endian.h
Game/CircleProtein.o: /usr/include/SDL/SDL_mutex.h
Game/CircleProtein.o: /usr/include/SDL/SDL_thread.h
Game/CircleProtein.o: /usr/include/SDL/SDL_rwops.h
Game/CircleProtein.o: /usr/include/SDL/SDL_cdrom.h
Game/CircleProtein.o: /usr/include/SDL/SDL_cpuinfo.h
Game/CircleProtein.o: /usr/include/SDL/SDL_events.h
Game/CircleProtein.o: /usr/include/SDL/SDL_active.h
Game/CircleProtein.o: /usr/include/SDL/SDL_keyboard.h
Game/CircleProtein.o: /usr/include/SDL/SDL_keysym.h
Game/CircleProtein.o: /usr/include/SDL/SDL_mouse.h
Game/CircleProtein.o: /usr/include/SDL/SDL_video.h
Game/CircleProtein.o: /usr/include/SDL/SDL_joystick.h
Game/CircleProtein.o: /usr/include/SDL/SDL_quit.h
Game/CircleProtein.o: /usr/include/SDL/SDL_loadso.h
Game/CircleProtein.o: /usr/include/SDL/SDL_timer.h
Game/CircleProtein.o: /usr/include/SDL/SDL_version.h
Game/CircleProtein.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/CircleProtein.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/CircleProtein.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/CircleProtein.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/CircleProtein.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/TriangleProtein.o: ./Game/TriangleProtein.hpp ./Game/Protein.hpp
Game/TriangleProtein.o: ./Engine/Mantis.hpp
Game/TriangleProtein.o: ./Engine/RandomNumberGenerator.hpp
Game/TriangleProtein.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/TriangleProtein.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_stdinc.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_config.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_platform.h
Game/TriangleProtein.o: /usr/include/sys/types.h /usr/include/features.h
Game/TriangleProtein.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/TriangleProtein.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/TriangleProtein.o: /usr/include/bits/types.h
Game/TriangleProtein.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/TriangleProtein.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/TriangleProtein.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/TriangleProtein.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/TriangleProtein.o: /usr/include/sys/sysmacros.h
Game/TriangleProtein.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/TriangleProtein.o: /usr/include/libio.h /usr/include/_G_config.h
Game/TriangleProtein.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/TriangleProtein.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/TriangleProtein.o: /usr/include/alloca.h /usr/include/string.h
Game/TriangleProtein.o: /usr/include/strings.h /usr/include/inttypes.h
Game/TriangleProtein.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/TriangleProtein.o: /usr/include/ctype.h /usr/include/iconv.h
Game/TriangleProtein.o: /usr/include/SDL/begin_code.h
Game/TriangleProtein.o: /usr/include/SDL/close_code.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_audio.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_error.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_endian.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_mutex.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_thread.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_rwops.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_cdrom.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_cpuinfo.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_events.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_active.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_keyboard.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_keysym.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_mouse.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_video.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_joystick.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_quit.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_loadso.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_timer.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_version.h
Game/TriangleProtein.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/TriangleProtein.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/TriangleProtein.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/TriangleProtein.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/TriangleProtein.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/Cell.o: ./Game/Cell.hpp ./Game/ModelCache.hpp /usr/include/SDL/SDL.h
Game/Cell.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
Game/Cell.o: /usr/include/SDL/SDL_config.h /usr/include/SDL/SDL_platform.h
Game/Cell.o: /usr/include/sys/types.h /usr/include/features.h
Game/Cell.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/Cell.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/Cell.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
Game/Cell.o: /usr/include/time.h /usr/include/endian.h
Game/Cell.o: /usr/include/bits/endian.h /usr/include/sys/select.h
Game/Cell.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
Game/Cell.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
Game/Cell.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/Cell.o: /usr/include/libio.h /usr/include/_G_config.h
Game/Cell.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/Cell.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/Cell.o: /usr/include/alloca.h /usr/include/string.h
Game/Cell.o: /usr/include/strings.h /usr/include/inttypes.h
Game/Cell.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/Cell.o: /usr/include/ctype.h /usr/include/iconv.h
Game/Cell.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
Game/Cell.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/Cell.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
Game/Cell.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
Game/Cell.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
Game/Cell.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
Game/Cell.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
Game/Cell.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
Game/Cell.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
Game/Cell.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
Game/Cell.o: /usr/include/SDL/SDL_version.h /usr/include/SDL/SDL_opengl.h
Game/Cell.o: /usr/include/GL/gl.h /usr/include/GL/glext.h
Game/Cell.o: /usr/include/GL/glu.h ./Game/Constants.hpp ./Game/Region.hpp
Game/Cell.o: ./Game/Vector.hpp ./Game/BoundingCircle.hpp ./Game/Protein.hpp
Game/Cell.o: ./Game/SquareProtein.hpp ./Engine/Mantis.hpp
Game/Cell.o: ./Engine/RandomNumberGenerator.hpp ./Engine/StateManager.hpp
Game/Cell.o: ./Engine/State.hpp ./Engine/LogSystem.hpp
Game/Cell.o: ./Engine/LoggerFactory.hpp ./Engine/Logger.hpp
Game/Cell.o: ./Engine/FileLogger.hpp ./Engine/NullLogger.hpp
Game/Cell.o: ./Engine/VideoSystem.hpp ./Game/CircleProtein.hpp
Game/Cell.o: ./Game/TriangleProtein.hpp ./Game/BubbleEffect.hpp
Game/Cell.o: ./Game/VisualEffect.hpp ./Game/Color.hpp ./Game/Virus.hpp
Game/Cell.o: ./Game/VirusCache.hpp ./Game/VirusGenerator.hpp
Game/Cell.o: ./Game/VirusData.hpp ./Game/Entity.hpp ./Game/Antibody.hpp
Game/Cell.o: ./Game/DamageInfo.hpp ./Game/DebrisEffect.hpp
Game/Cell.o: ./Game/SearchNode.hpp ./Game/AIData.hpp ./Game/Map.hpp
Game/Cell.o: ./Game/Tile.hpp
Game/Antibody.o: ./Game/Antibody.hpp ./Game/Vector.hpp ./Game/Constants.hpp
Game/Antibody.o: ./Game/Region.hpp ./Game/BoundingCircle.hpp
Game/Antibody.o: ./Game/Entity.hpp ./Game/DamageInfo.hpp
Game/Antibody.o: ./Game/VisualEffect.hpp ./Game/DebrisEffect.hpp
Game/Antibody.o: ./Game/Color.hpp ./Engine/Mantis.hpp
Game/Antibody.o: ./Engine/RandomNumberGenerator.hpp ./Engine/StateManager.hpp
Game/Antibody.o: ./Engine/State.hpp /usr/include/SDL/SDL.h
Game/Antibody.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
Game/Antibody.o: /usr/include/SDL/SDL_config.h
Game/Antibody.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/Antibody.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/Antibody.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/Antibody.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/Antibody.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/Antibody.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/Antibody.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/Antibody.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/Antibody.o: /usr/include/sys/sysmacros.h
Game/Antibody.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/Antibody.o: /usr/include/libio.h /usr/include/_G_config.h
Game/Antibody.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/Antibody.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/Antibody.o: /usr/include/alloca.h /usr/include/string.h
Game/Antibody.o: /usr/include/strings.h /usr/include/inttypes.h
Game/Antibody.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/Antibody.o: /usr/include/ctype.h /usr/include/iconv.h
Game/Antibody.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
Game/Antibody.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/Antibody.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
Game/Antibody.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
Game/Antibody.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
Game/Antibody.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
Game/Antibody.o: /usr/include/SDL/SDL_keyboard.h
Game/Antibody.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
Game/Antibody.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
Game/Antibody.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
Game/Antibody.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
Game/Antibody.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/Antibody.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/Antibody.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/Antibody.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/Antibody.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/Antibody.o: ./Game/Virus.hpp ./Game/VirusCache.hpp
Game/Antibody.o: ./Game/VirusGenerator.hpp ./Game/VirusData.hpp
Game/Antibody.o: ./Game/Protein.hpp ./Game/SquareProtein.hpp
Game/Antibody.o: ./Game/CircleProtein.hpp ./Game/TriangleProtein.hpp
Game/Antibody.o: ./Game/SearchNode.hpp ./Game/AIData.hpp ./Game/Map.hpp
Game/Antibody.o: ./Game/Tile.hpp ./Game/Cell.hpp ./Game/ModelCache.hpp
Game/Antibody.o: ./Game/BubbleEffect.hpp
Game/Map.o: ./Game/Map.hpp ./Engine/Mantis.hpp
Game/Map.o: ./Engine/RandomNumberGenerator.hpp ./Engine/StateManager.hpp
Game/Map.o: ./Engine/State.hpp /usr/include/SDL/SDL.h
Game/Map.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
Game/Map.o: /usr/include/SDL/SDL_config.h /usr/include/SDL/SDL_platform.h
Game/Map.o: /usr/include/sys/types.h /usr/include/features.h
Game/Map.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/Map.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/Map.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
Game/Map.o: /usr/include/time.h /usr/include/endian.h
Game/Map.o: /usr/include/bits/endian.h /usr/include/sys/select.h
Game/Map.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
Game/Map.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
Game/Map.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/Map.o: /usr/include/libio.h /usr/include/_G_config.h
Game/Map.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/Map.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/Map.o: /usr/include/alloca.h /usr/include/string.h
Game/Map.o: /usr/include/strings.h /usr/include/inttypes.h
Game/Map.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/Map.o: /usr/include/ctype.h /usr/include/iconv.h
Game/Map.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
Game/Map.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/Map.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
Game/Map.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
Game/Map.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
Game/Map.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
Game/Map.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
Game/Map.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
Game/Map.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
Game/Map.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
Game/Map.o: /usr/include/SDL/SDL_version.h /usr/include/SDL/SDL_opengl.h
Game/Map.o: /usr/include/GL/gl.h /usr/include/GL/glext.h
Game/Map.o: /usr/include/GL/glu.h ./Engine/LogSystem.hpp
Game/Map.o: ./Engine/LoggerFactory.hpp ./Engine/Logger.hpp
Game/Map.o: ./Engine/FileLogger.hpp ./Engine/NullLogger.hpp
Game/Map.o: ./Engine/VideoSystem.hpp ./Game/Constants.hpp ./Game/Tile.hpp
Game/Map.o: ./Game/Entity.hpp ./Game/Region.hpp ./Game/Vector.hpp
Game/Map.o: ./Game/BoundingCircle.hpp ./Game/Cell.hpp ./Game/ModelCache.hpp
Game/Map.o: ./Game/Protein.hpp ./Game/SquareProtein.hpp
Game/Map.o: ./Game/CircleProtein.hpp ./Game/TriangleProtein.hpp
Game/Map.o: ./Game/BubbleEffect.hpp ./Game/VisualEffect.hpp ./Game/Color.hpp
Game/Map.o: ./Game/Virus.hpp ./Game/VirusCache.hpp ./Game/VirusGenerator.hpp
Game/Map.o: ./Game/VirusData.hpp ./Game/Antibody.hpp ./Game/DamageInfo.hpp
Game/Map.o: ./Game/DebrisEffect.hpp ./Game/SearchNode.hpp ./Game/AIData.hpp
Game/Tile.o: ./Game/Tile.hpp ./Game/Entity.hpp ./Game/Region.hpp
Game/Tile.o: ./Game/Vector.hpp ./Game/Constants.hpp ./Game/BoundingCircle.hpp
Game/Tile.o: ./Game/Cell.hpp ./Game/ModelCache.hpp /usr/include/SDL/SDL.h
Game/Tile.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
Game/Tile.o: /usr/include/SDL/SDL_config.h /usr/include/SDL/SDL_platform.h
Game/Tile.o: /usr/include/sys/types.h /usr/include/features.h
Game/Tile.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/Tile.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/Tile.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
Game/Tile.o: /usr/include/time.h /usr/include/endian.h
Game/Tile.o: /usr/include/bits/endian.h /usr/include/sys/select.h
Game/Tile.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
Game/Tile.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
Game/Tile.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/Tile.o: /usr/include/libio.h /usr/include/_G_config.h
Game/Tile.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/Tile.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/Tile.o: /usr/include/alloca.h /usr/include/string.h
Game/Tile.o: /usr/include/strings.h /usr/include/inttypes.h
Game/Tile.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/Tile.o: /usr/include/ctype.h /usr/include/iconv.h
Game/Tile.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
Game/Tile.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/Tile.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
Game/Tile.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
Game/Tile.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
Game/Tile.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
Game/Tile.o: /usr/include/SDL/SDL_keyboard.h /usr/include/SDL/SDL_keysym.h
Game/Tile.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
Game/Tile.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
Game/Tile.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
Game/Tile.o: /usr/include/SDL/SDL_version.h /usr/include/SDL/SDL_opengl.h
Game/Tile.o: /usr/include/GL/gl.h /usr/include/GL/glext.h
Game/Tile.o: /usr/include/GL/glu.h ./Game/Protein.hpp
Game/Tile.o: ./Game/SquareProtein.hpp ./Engine/Mantis.hpp
Game/Tile.o: ./Engine/RandomNumberGenerator.hpp ./Engine/StateManager.hpp
Game/Tile.o: ./Engine/State.hpp ./Engine/LogSystem.hpp
Game/Tile.o: ./Engine/LoggerFactory.hpp ./Engine/Logger.hpp
Game/Tile.o: ./Engine/FileLogger.hpp ./Engine/NullLogger.hpp
Game/Tile.o: ./Engine/VideoSystem.hpp ./Game/CircleProtein.hpp
Game/Tile.o: ./Game/TriangleProtein.hpp ./Game/BubbleEffect.hpp
Game/Tile.o: ./Game/VisualEffect.hpp ./Game/Color.hpp ./Game/Virus.hpp
Game/Tile.o: ./Game/VirusCache.hpp ./Game/VirusGenerator.hpp
Game/Tile.o: ./Game/VirusData.hpp ./Game/Antibody.hpp ./Game/DamageInfo.hpp
Game/Tile.o: ./Game/DebrisEffect.hpp ./Game/SearchNode.hpp ./Game/AIData.hpp
Game/Region.o: ./Game/Region.hpp ./Game/Vector.hpp ./Game/Constants.hpp
Game/Region.o: ./Game/BoundingCircle.hpp
Game/GameCamera.o: ./Game/GameCamera.hpp ./Game/Vector.hpp
Game/GameCamera.o: ./Game/Constants.hpp ./Game/Region.hpp
Game/GameCamera.o: ./Game/BoundingCircle.hpp
Game/BoundingCircle.o: ./Game/BoundingCircle.hpp ./Game/Vector.hpp
Game/BoundingCircle.o: ./Game/Constants.hpp
Game/VirusData.o: ./Game/VirusData.hpp ./Game/VirusCache.hpp
Game/VirusData.o: ./Game/VirusGenerator.hpp ./Game/Constants.hpp
Game/VirusData.o: ./Engine/Mantis.hpp ./Engine/RandomNumberGenerator.hpp
Game/VirusData.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/VirusData.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/VirusData.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
Game/VirusData.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/VirusData.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/VirusData.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/VirusData.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/VirusData.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/VirusData.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/VirusData.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/VirusData.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/VirusData.o: /usr/include/sys/sysmacros.h
Game/VirusData.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/VirusData.o: /usr/include/libio.h /usr/include/_G_config.h
Game/VirusData.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/VirusData.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/VirusData.o: /usr/include/alloca.h /usr/include/string.h
Game/VirusData.o: /usr/include/strings.h /usr/include/inttypes.h
Game/VirusData.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/VirusData.o: /usr/include/ctype.h /usr/include/iconv.h
Game/VirusData.o: /usr/include/SDL/begin_code.h /usr/include/SDL/close_code.h
Game/VirusData.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/VirusData.o: /usr/include/SDL/SDL_endian.h /usr/include/SDL/SDL_mutex.h
Game/VirusData.o: /usr/include/SDL/SDL_thread.h /usr/include/SDL/SDL_rwops.h
Game/VirusData.o: /usr/include/SDL/SDL_cdrom.h /usr/include/SDL/SDL_cpuinfo.h
Game/VirusData.o: /usr/include/SDL/SDL_events.h /usr/include/SDL/SDL_active.h
Game/VirusData.o: /usr/include/SDL/SDL_keyboard.h
Game/VirusData.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
Game/VirusData.o: /usr/include/SDL/SDL_video.h
Game/VirusData.o: /usr/include/SDL/SDL_joystick.h /usr/include/SDL/SDL_quit.h
Game/VirusData.o: /usr/include/SDL/SDL_loadso.h /usr/include/SDL/SDL_timer.h
Game/VirusData.o: /usr/include/SDL/SDL_version.h
Game/VirusData.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/VirusData.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/VirusData.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/VirusData.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/VirusData.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/VirusData.o: ./Game/Entity.hpp ./Game/Region.hpp ./Game/Vector.hpp
Game/VirusData.o: ./Game/BoundingCircle.hpp ./Game/Protein.hpp
Game/VirusData.o: ./Game/SquareProtein.hpp ./Game/CircleProtein.hpp
Game/VirusData.o: ./Game/TriangleProtein.hpp ./Game/Antibody.hpp
Game/VirusData.o: ./Game/DamageInfo.hpp ./Game/VisualEffect.hpp
Game/VirusData.o: ./Game/DebrisEffect.hpp ./Game/Color.hpp
Game/Entity.o: ./Game/Entity.hpp ./Game/Region.hpp ./Game/Vector.hpp
Game/Entity.o: ./Game/Constants.hpp ./Game/BoundingCircle.hpp ./Game/Map.hpp
Game/Entity.o: ./Engine/Mantis.hpp ./Engine/RandomNumberGenerator.hpp
Game/Entity.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/Entity.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/Entity.o: /usr/include/SDL/SDL_stdinc.h /usr/include/SDL/SDL_config.h
Game/Entity.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/Entity.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/Entity.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/Entity.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/Entity.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/Entity.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/Entity.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/Entity.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/Entity.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
Game/Entity.o: /usr/include/stdio.h /usr/include/libio.h
Game/Entity.o: /usr/include/_G_config.h /usr/include/wchar.h
Game/Entity.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
Game/Entity.o: /usr/include/stdlib.h /usr/include/alloca.h
Game/Entity.o: /usr/include/string.h /usr/include/strings.h
Game/Entity.o: /usr/include/inttypes.h /usr/include/stdint.h
Game/Entity.o: /usr/include/bits/wchar.h /usr/include/ctype.h
Game/Entity.o: /usr/include/iconv.h /usr/include/SDL/begin_code.h
Game/Entity.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
Game/Entity.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
Game/Entity.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
Game/Entity.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
Game/Entity.o: /usr/include/SDL/SDL_cpuinfo.h /usr/include/SDL/SDL_events.h
Game/Entity.o: /usr/include/SDL/SDL_active.h /usr/include/SDL/SDL_keyboard.h
Game/Entity.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
Game/Entity.o: /usr/include/SDL/SDL_video.h /usr/include/SDL/SDL_joystick.h
Game/Entity.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
Game/Entity.o: /usr/include/SDL/SDL_timer.h /usr/include/SDL/SDL_version.h
Game/Entity.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/Entity.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/Entity.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/Entity.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/Entity.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/Entity.o: ./Game/Tile.hpp ./Game/Cell.hpp ./Game/ModelCache.hpp
Game/Entity.o: ./Game/Protein.hpp ./Game/SquareProtein.hpp
Game/Entity.o: ./Game/CircleProtein.hpp ./Game/TriangleProtein.hpp
Game/Entity.o: ./Game/BubbleEffect.hpp ./Game/VisualEffect.hpp
Game/Entity.o: ./Game/Color.hpp ./Game/Virus.hpp ./Game/VirusCache.hpp
Game/Entity.o: ./Game/VirusGenerator.hpp ./Game/VirusData.hpp
Game/Entity.o: ./Game/Antibody.hpp ./Game/DamageInfo.hpp
Game/Entity.o: ./Game/DebrisEffect.hpp ./Game/SearchNode.hpp
Game/Entity.o: ./Game/AIData.hpp
Game/SearchNode.o: ./Game/SearchNode.hpp
Game/VirusFilter.o: Game/VirusFilter.hpp ./Game/Entity.hpp ./Game/Region.hpp
Game/VirusFilter.o: ./Game/Vector.hpp ./Game/Constants.hpp
Game/VirusFilter.o: ./Game/BoundingCircle.hpp ./Game/Virus.hpp
Game/VirusFilter.o: ./Game/VirusCache.hpp ./Game/VirusGenerator.hpp
Game/VirusFilter.o: ./Game/VirusData.hpp ./Game/Protein.hpp
Game/VirusFilter.o: ./Game/SquareProtein.hpp ./Engine/Mantis.hpp
Game/VirusFilter.o: ./Engine/RandomNumberGenerator.hpp
Game/VirusFilter.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/VirusFilter.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/VirusFilter.o: /usr/include/SDL/SDL_stdinc.h
Game/VirusFilter.o: /usr/include/SDL/SDL_config.h
Game/VirusFilter.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/VirusFilter.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/VirusFilter.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/VirusFilter.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/VirusFilter.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/VirusFilter.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/VirusFilter.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/VirusFilter.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/VirusFilter.o: /usr/include/sys/sysmacros.h
Game/VirusFilter.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/VirusFilter.o: /usr/include/libio.h /usr/include/_G_config.h
Game/VirusFilter.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/VirusFilter.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/VirusFilter.o: /usr/include/alloca.h /usr/include/string.h
Game/VirusFilter.o: /usr/include/strings.h /usr/include/inttypes.h
Game/VirusFilter.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/VirusFilter.o: /usr/include/ctype.h /usr/include/iconv.h
Game/VirusFilter.o: /usr/include/SDL/begin_code.h
Game/VirusFilter.o: /usr/include/SDL/close_code.h
Game/VirusFilter.o: /usr/include/SDL/SDL_audio.h /usr/include/SDL/SDL_error.h
Game/VirusFilter.o: /usr/include/SDL/SDL_endian.h
Game/VirusFilter.o: /usr/include/SDL/SDL_mutex.h
Game/VirusFilter.o: /usr/include/SDL/SDL_thread.h
Game/VirusFilter.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
Game/VirusFilter.o: /usr/include/SDL/SDL_cpuinfo.h
Game/VirusFilter.o: /usr/include/SDL/SDL_events.h
Game/VirusFilter.o: /usr/include/SDL/SDL_active.h
Game/VirusFilter.o: /usr/include/SDL/SDL_keyboard.h
Game/VirusFilter.o: /usr/include/SDL/SDL_keysym.h
Game/VirusFilter.o: /usr/include/SDL/SDL_mouse.h /usr/include/SDL/SDL_video.h
Game/VirusFilter.o: /usr/include/SDL/SDL_joystick.h
Game/VirusFilter.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
Game/VirusFilter.o: /usr/include/SDL/SDL_timer.h
Game/VirusFilter.o: /usr/include/SDL/SDL_version.h
Game/VirusFilter.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/VirusFilter.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/VirusFilter.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/VirusFilter.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/VirusFilter.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/VirusFilter.o: ./Game/CircleProtein.hpp ./Game/TriangleProtein.hpp
Game/VirusFilter.o: ./Game/Antibody.hpp ./Game/DamageInfo.hpp
Game/VirusFilter.o: ./Game/VisualEffect.hpp ./Game/DebrisEffect.hpp
Game/VirusFilter.o: ./Game/Color.hpp ./Game/SearchNode.hpp ./Game/AIData.hpp
Game/VirusFilter.o: ./Game/Tile.hpp ./Game/Cell.hpp ./Game/ModelCache.hpp
Game/VirusFilter.o: ./Game/BubbleEffect.hpp
Game/DamageInfo.o: ./Game/DamageInfo.hpp ./Game/Constants.hpp
Game/ModelCache.o: ./Game/ModelCache.hpp /usr/include/SDL/SDL.h
Game/ModelCache.o: /usr/include/SDL/SDL_main.h /usr/include/SDL/SDL_stdinc.h
Game/ModelCache.o: /usr/include/SDL/SDL_config.h
Game/ModelCache.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/ModelCache.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/ModelCache.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/ModelCache.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/ModelCache.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/ModelCache.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/ModelCache.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/ModelCache.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/ModelCache.o: /usr/include/sys/sysmacros.h
Game/ModelCache.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/ModelCache.o: /usr/include/libio.h /usr/include/_G_config.h
Game/ModelCache.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/ModelCache.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/ModelCache.o: /usr/include/alloca.h /usr/include/string.h
Game/ModelCache.o: /usr/include/strings.h /usr/include/inttypes.h
Game/ModelCache.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/ModelCache.o: /usr/include/ctype.h /usr/include/iconv.h
Game/ModelCache.o: /usr/include/SDL/begin_code.h
Game/ModelCache.o: /usr/include/SDL/close_code.h /usr/include/SDL/SDL_audio.h
Game/ModelCache.o: /usr/include/SDL/SDL_error.h /usr/include/SDL/SDL_endian.h
Game/ModelCache.o: /usr/include/SDL/SDL_mutex.h /usr/include/SDL/SDL_thread.h
Game/ModelCache.o: /usr/include/SDL/SDL_rwops.h /usr/include/SDL/SDL_cdrom.h
Game/ModelCache.o: /usr/include/SDL/SDL_cpuinfo.h
Game/ModelCache.o: /usr/include/SDL/SDL_events.h
Game/ModelCache.o: /usr/include/SDL/SDL_active.h
Game/ModelCache.o: /usr/include/SDL/SDL_keyboard.h
Game/ModelCache.o: /usr/include/SDL/SDL_keysym.h /usr/include/SDL/SDL_mouse.h
Game/ModelCache.o: /usr/include/SDL/SDL_video.h
Game/ModelCache.o: /usr/include/SDL/SDL_joystick.h
Game/ModelCache.o: /usr/include/SDL/SDL_quit.h /usr/include/SDL/SDL_loadso.h
Game/ModelCache.o: /usr/include/SDL/SDL_timer.h
Game/ModelCache.o: /usr/include/SDL/SDL_version.h
Game/ModelCache.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/ModelCache.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/ShockwaveEffect.o: Game/ShockwaveEffect.hpp ./Game/VisualEffect.hpp
Game/ShockwaveEffect.o: ./Game/Region.hpp ./Game/Vector.hpp
Game/ShockwaveEffect.o: ./Game/Constants.hpp ./Game/BoundingCircle.hpp
Game/ShockwaveEffect.o: ./Game/DebrisEffect.hpp ./Game/Color.hpp
Game/ShockwaveEffect.o: ./Engine/Mantis.hpp
Game/ShockwaveEffect.o: ./Engine/RandomNumberGenerator.hpp
Game/ShockwaveEffect.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/ShockwaveEffect.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_stdinc.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_config.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_platform.h
Game/ShockwaveEffect.o: /usr/include/sys/types.h /usr/include/features.h
Game/ShockwaveEffect.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
Game/ShockwaveEffect.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-64.h
Game/ShockwaveEffect.o: /usr/include/bits/types.h
Game/ShockwaveEffect.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/ShockwaveEffect.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/ShockwaveEffect.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/ShockwaveEffect.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/ShockwaveEffect.o: /usr/include/sys/sysmacros.h
Game/ShockwaveEffect.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/ShockwaveEffect.o: /usr/include/libio.h /usr/include/_G_config.h
Game/ShockwaveEffect.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/ShockwaveEffect.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/ShockwaveEffect.o: /usr/include/alloca.h /usr/include/string.h
Game/ShockwaveEffect.o: /usr/include/strings.h /usr/include/inttypes.h
Game/ShockwaveEffect.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/ShockwaveEffect.o: /usr/include/ctype.h /usr/include/iconv.h
Game/ShockwaveEffect.o: /usr/include/SDL/begin_code.h
Game/ShockwaveEffect.o: /usr/include/SDL/close_code.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_audio.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_error.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_endian.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_mutex.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_thread.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_rwops.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_cdrom.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_cpuinfo.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_events.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_active.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_keyboard.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_keysym.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_mouse.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_video.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_joystick.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_quit.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_loadso.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_timer.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_version.h
Game/ShockwaveEffect.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/ShockwaveEffect.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/ShockwaveEffect.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/ShockwaveEffect.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/ShockwaveEffect.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/DebrisEffect.o: ./Game/DebrisEffect.hpp ./Game/VisualEffect.hpp
Game/DebrisEffect.o: ./Game/Region.hpp ./Game/Vector.hpp ./Game/Constants.hpp
Game/DebrisEffect.o: ./Game/BoundingCircle.hpp ./Game/Color.hpp
Game/DebrisEffect.o: ./Engine/Mantis.hpp ./Engine/RandomNumberGenerator.hpp
Game/DebrisEffect.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/DebrisEffect.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_stdinc.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_config.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/DebrisEffect.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/DebrisEffect.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/DebrisEffect.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/DebrisEffect.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/DebrisEffect.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/DebrisEffect.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/DebrisEffect.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/DebrisEffect.o: /usr/include/sys/sysmacros.h
Game/DebrisEffect.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/DebrisEffect.o: /usr/include/libio.h /usr/include/_G_config.h
Game/DebrisEffect.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/DebrisEffect.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/DebrisEffect.o: /usr/include/alloca.h /usr/include/string.h
Game/DebrisEffect.o: /usr/include/strings.h /usr/include/inttypes.h
Game/DebrisEffect.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/DebrisEffect.o: /usr/include/ctype.h /usr/include/iconv.h
Game/DebrisEffect.o: /usr/include/SDL/begin_code.h
Game/DebrisEffect.o: /usr/include/SDL/close_code.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_audio.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_error.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_endian.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_mutex.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_thread.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_rwops.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_cdrom.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_cpuinfo.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_events.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_active.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_keyboard.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_keysym.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_mouse.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_video.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_joystick.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_quit.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_loadso.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_timer.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_version.h
Game/DebrisEffect.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/DebrisEffect.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/DebrisEffect.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/DebrisEffect.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/DebrisEffect.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
Game/Color.o: ./Game/Color.hpp
Game/BubbleEffect.o: ./Game/BubbleEffect.hpp ./Game/VisualEffect.hpp
Game/BubbleEffect.o: ./Game/Region.hpp ./Game/Vector.hpp ./Game/Constants.hpp
Game/BubbleEffect.o: ./Game/BoundingCircle.hpp ./Game/Color.hpp
Game/BubbleEffect.o: ./Engine/Mantis.hpp ./Engine/RandomNumberGenerator.hpp
Game/BubbleEffect.o: ./Engine/StateManager.hpp ./Engine/State.hpp
Game/BubbleEffect.o: /usr/include/SDL/SDL.h /usr/include/SDL/SDL_main.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_stdinc.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_config.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_platform.h /usr/include/sys/types.h
Game/BubbleEffect.o: /usr/include/features.h /usr/include/sys/cdefs.h
Game/BubbleEffect.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
Game/BubbleEffect.o: /usr/include/gnu/stubs-64.h /usr/include/bits/types.h
Game/BubbleEffect.o: /usr/include/bits/typesizes.h /usr/include/time.h
Game/BubbleEffect.o: /usr/include/endian.h /usr/include/bits/endian.h
Game/BubbleEffect.o: /usr/include/sys/select.h /usr/include/bits/select.h
Game/BubbleEffect.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
Game/BubbleEffect.o: /usr/include/sys/sysmacros.h
Game/BubbleEffect.o: /usr/include/bits/pthreadtypes.h /usr/include/stdio.h
Game/BubbleEffect.o: /usr/include/libio.h /usr/include/_G_config.h
Game/BubbleEffect.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
Game/BubbleEffect.o: /usr/include/bits/sys_errlist.h /usr/include/stdlib.h
Game/BubbleEffect.o: /usr/include/alloca.h /usr/include/string.h
Game/BubbleEffect.o: /usr/include/strings.h /usr/include/inttypes.h
Game/BubbleEffect.o: /usr/include/stdint.h /usr/include/bits/wchar.h
Game/BubbleEffect.o: /usr/include/ctype.h /usr/include/iconv.h
Game/BubbleEffect.o: /usr/include/SDL/begin_code.h
Game/BubbleEffect.o: /usr/include/SDL/close_code.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_audio.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_error.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_endian.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_mutex.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_thread.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_rwops.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_cdrom.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_cpuinfo.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_events.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_active.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_keyboard.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_keysym.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_mouse.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_video.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_joystick.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_quit.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_loadso.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_timer.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_version.h
Game/BubbleEffect.o: /usr/include/SDL/SDL_opengl.h /usr/include/GL/gl.h
Game/BubbleEffect.o: /usr/include/GL/glext.h /usr/include/GL/glu.h
Game/BubbleEffect.o: ./Engine/LogSystem.hpp ./Engine/LoggerFactory.hpp
Game/BubbleEffect.o: ./Engine/Logger.hpp ./Engine/FileLogger.hpp
Game/BubbleEffect.o: ./Engine/NullLogger.hpp ./Engine/VideoSystem.hpp
