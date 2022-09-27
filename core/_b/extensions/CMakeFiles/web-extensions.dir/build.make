# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/test/core

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/test/core/_b

# Include any dependencies generated for this target.
include extensions/CMakeFiles/web-extensions.dir/depend.make

# Include the progress variables for this target.
include extensions/CMakeFiles/web-extensions.dir/progress.make

# Include the compile flags for this target's objects.
include extensions/CMakeFiles/web-extensions.dir/flags.make

extensions/web-extensions.c: extensions/web-extensions_valac.stamp


extensions/web-extensions_valac.stamp: ../extensions/web-extensions.vala
extensions/web-extensions_valac.stamp: core/midori-core.vapi
extensions/web-extensions_valac.stamp: ../vapi/config.vapi
extensions/web-extensions_valac.stamp: ../vapi/libarchive.vapi
extensions/web-extensions_valac.stamp: ../vapi/webkit2gtk-4.0.vapi
extensions/web-extensions_valac.stamp: ../vapi/javascriptcoregtk-4.0.vapi
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating web-extensions.c"
	cd /home/test/core/_b/extensions && /usr/bin/valac -C -b /home/test/core/extensions -d /home/test/core/_b/extensions --pkg=sqlite3 --pkg=gio-2.0 --pkg=libsoup-2.4 --pkg=gtk+-3.0 --pkg=libsoup-2.4 --pkg=gcr-ui-3 --pkg=libpeas-gtk-1.0 --pkg=json-glib-1.0 --pkg=posix --fatal-warnings --debug --target-glib=2.46 --enable-deprecated --gresources="/home/test/core/gresource.xml" /home/test/core/extensions/web-extensions.vala /home/test/core/_b/core/midori-core.vapi /home/test/core/vapi/config.vapi /home/test/core/vapi/libarchive.vapi /home/test/core/vapi/webkit2gtk-4.0.vapi /home/test/core/vapi/javascriptcoregtk-4.0.vapi
	cd /home/test/core/_b/extensions && touch /home/test/core/_b/extensions/web-extensions_valac.stamp

extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o: extensions/CMakeFiles/web-extensions.dir/flags.make
extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o: extensions/web-extensions.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o"
	cd /home/test/core/_b/extensions && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/web-extensions.dir/web-extensions.c.o   -c /home/test/core/_b/extensions/web-extensions.c

extensions/CMakeFiles/web-extensions.dir/web-extensions.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/web-extensions.dir/web-extensions.c.i"
	cd /home/test/core/_b/extensions && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/test/core/_b/extensions/web-extensions.c > CMakeFiles/web-extensions.dir/web-extensions.c.i

extensions/CMakeFiles/web-extensions.dir/web-extensions.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/web-extensions.dir/web-extensions.c.s"
	cd /home/test/core/_b/extensions && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/test/core/_b/extensions/web-extensions.c -o CMakeFiles/web-extensions.dir/web-extensions.c.s

extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o.requires:

.PHONY : extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o.requires

extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o.provides: extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o.requires
	$(MAKE) -f extensions/CMakeFiles/web-extensions.dir/build.make extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o.provides.build
.PHONY : extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o.provides

extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o.provides.build: extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o


# Object files for target web-extensions
web__extensions_OBJECTS = \
"CMakeFiles/web-extensions.dir/web-extensions.c.o"

# External object files for target web-extensions
web__extensions_EXTERNAL_OBJECTS =

extensions/libweb-extensions.so: extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o
extensions/libweb-extensions.so: extensions/CMakeFiles/web-extensions.dir/build.make
extensions/libweb-extensions.so: core/libmidori-core.so.0.6
extensions/libweb-extensions.so: extensions/CMakeFiles/web-extensions.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared module libweb-extensions.so"
	cd /home/test/core/_b/extensions && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/web-extensions.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
extensions/CMakeFiles/web-extensions.dir/build: extensions/libweb-extensions.so

.PHONY : extensions/CMakeFiles/web-extensions.dir/build

extensions/CMakeFiles/web-extensions.dir/requires: extensions/CMakeFiles/web-extensions.dir/web-extensions.c.o.requires

.PHONY : extensions/CMakeFiles/web-extensions.dir/requires

extensions/CMakeFiles/web-extensions.dir/clean:
	cd /home/test/core/_b/extensions && $(CMAKE_COMMAND) -P CMakeFiles/web-extensions.dir/cmake_clean.cmake
.PHONY : extensions/CMakeFiles/web-extensions.dir/clean

extensions/CMakeFiles/web-extensions.dir/depend: extensions/web-extensions.c
extensions/CMakeFiles/web-extensions.dir/depend: extensions/web-extensions_valac.stamp
	cd /home/test/core/_b && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/test/core /home/test/core/extensions /home/test/core/_b /home/test/core/_b/extensions /home/test/core/_b/extensions/CMakeFiles/web-extensions.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : extensions/CMakeFiles/web-extensions.dir/depend
