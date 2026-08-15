# tools
CC ?= cc

# paths
PREFIX ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# operating system
OS := $(shell uname -s)

ifeq ($(OS),FreeBSD)
X11INC = /usr/local/include
X11LIB = /usr/local/lib
else ifeq ($(OS),OpenBSD)
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib
else
X11INC = /usr/include
X11LIB = /usr/lib
endif

# libs
LDLIBS = -lX11 -lXinerama -lXcursor

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=700 -I$(X11INC)
CFLAGS = -std=c99 -pedantic -Wall -Wextra -Os $(CPPFLAGS) -fdiagnostics-color=always
LDFLAGS = -L$(X11LIB)

# files
SRC = src/sxwm.c src/parser.c
OBJ = build/sxwm.o build/parser.o

all: sxwm

# rules
build/sxwm.o: src/sxwm.c
	mkdir -p build
	$(CC) -c $(CFLAGS) src/sxwm.c -o build/sxwm.o

build/parser.o: src/parser.c
	mkdir -p build
	$(CC) -c $(CFLAGS) src/parser.c -o build/parser.o

sxwm: $(OBJ)
	$(CC) -o sxwm $(OBJ) $(LDFLAGS) $(LDLIBS)

clean:
	rm -rf build sxwm

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f sxwm $(DESTDIR)$(PREFIX)/bin/
	chmod 755 $(DESTDIR)$(PREFIX)/bin/sxwm
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f docs/sxwm.1 $(DESTDIR)$(MANPREFIX)/man1/
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/sxwm.1
	mkdir -p $(DESTDIR)$(PREFIX)/share
	cp -f default_sxwmrc $(DESTDIR)$(PREFIX)/share/sxwmrc

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/sxwm \
	      $(DESTDIR)$(MANPREFIX)/man1/sxwm.1 \
	      $(DESTDIR)$(PREFIX)/share/sxwmrc

clangd:
	rm -f compile_flags.txt
	for f in $(CFLAGS); do echo $$f >> compile_flags.txt; done

.PHONY: all clean install uninstall clangd
