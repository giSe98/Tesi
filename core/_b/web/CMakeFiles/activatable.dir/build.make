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
include web/CMakeFiles/activatable.dir/depend.make

# Include the progress variables for this target.
include web/CMakeFiles/activatable.dir/progress.make

# Include the compile flags for this target's objects.
include web/CMakeFiles/activatable.dir/flags.make

web/activatable.c: web/activatable_valac.stamp


web/database.c: web/activatable.c
	@$(CMAKE_COMMAND) -E touch_nocreate web/database.c

web/history.c: web/activatable.c
	@$(CMAKE_COMMAND) -E touch_nocreate web/history.c

web/loggable.c: web/activatable.c
	@$(CMAKE_COMMAND) -E touch_nocreate web/loggable.c

web/plugins.c: web/activatable.c
	@$(CMAKE_COMMAND) -E touch_nocreate web/plugins.c

web/settings.c: web/activatable.c
	@$(CMAKE_COMMAND) -E touch_nocreate web/settings.c

web/activatable_valac.stamp: ../web/activatable.vala
web/activatable_valac.stamp: ../core/database.vala
web/activatable_valac.stamp: ../core/history.vala
web/activatable_valac.stamp: ../core/loggable.vala
web/activatable_valac.stamp: ../core/plugins.vala
web/activatable_valac.stamp: ../core/settings.vala
web/activatable_valac.stamp: ../vapi/config.vapi
web/activatable_valac.stamp: ../vapi/webkit2gtk-web-extension-4.0.vapi
web/activatable_valac.stamp: ../vapi/javascriptcoregtk-4.0.vapi
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating activatable.c;/home/test/core/core/database.c;/home/test/core/core/history.c;/home/test/core/core/loggable.c;/home/test/core/core/plugins.c;/home/test/core/core/settings.c"
	cd /home/test/core/_b/web && /usr/bin/valac -C -b /home/test/core/web -d /home/test/core/_b/web --pkg=libsoup-2.4 --pkg=libpeas-1.0 --pkg=sqlite3 --fatal-warnings --debug --target-glib=2.46 --enable-deprecated /home/test/core/web/activatable.vala /home/test/core/core/database.vala /home/test/core/core/history.vala /home/test/core/core/loggable.vala /home/test/core/core/plugins.vala /home/test/core/core/settings.vala /home/test/core/vapi/config.vapi /home/test/core/vapi/webkit2gtk-web-extension-4.0.vapi /home/test/core/vapi/javascriptcoregtk-4.0.vapi
	cd /home/test/core/_b/web && touch /home/test/core/_b/web/activatable_valac.stamp

web/CMakeFiles/activatable.dir/activatable.c.o: web/CMakeFiles/activatable.dir/flags.make
web/CMakeFiles/activatable.dir/activatable.c.o: web/activatable.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object web/CMakeFiles/activatable.dir/activatable.c.o"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/activatable.dir/activatable.c.o   -c /home/test/core/_b/web/activatable.c

web/CMakeFiles/activatable.dir/activatable.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/activatable.dir/activatable.c.i"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/test/core/_b/web/activatable.c > CMakeFiles/activatable.dir/activatable.c.i

web/CMakeFiles/activatable.dir/activatable.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/activatable.dir/activatable.c.s"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/test/core/_b/web/activatable.c -o CMakeFiles/activatable.dir/activatable.c.s

web/CMakeFiles/activatable.dir/activatable.c.o.requires:

.PHONY : web/CMakeFiles/activatable.dir/activatable.c.o.requires

web/CMakeFiles/activatable.dir/activatable.c.o.provides: web/CMakeFiles/activatable.dir/activatable.c.o.requires
	$(MAKE) -f web/CMakeFiles/activatable.dir/build.make web/CMakeFiles/activatable.dir/activatable.c.o.provides.build
.PHONY : web/CMakeFiles/activatable.dir/activatable.c.o.provides

web/CMakeFiles/activatable.dir/activatable.c.o.provides.build: web/CMakeFiles/activatable.dir/activatable.c.o


web/CMakeFiles/activatable.dir/database.c.o: web/CMakeFiles/activatable.dir/flags.make
web/CMakeFiles/activatable.dir/database.c.o: web/database.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object web/CMakeFiles/activatable.dir/database.c.o"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/activatable.dir/database.c.o   -c /home/test/core/_b/web/database.c

web/CMakeFiles/activatable.dir/database.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/activatable.dir/database.c.i"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/test/core/_b/web/database.c > CMakeFiles/activatable.dir/database.c.i

web/CMakeFiles/activatable.dir/database.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/activatable.dir/database.c.s"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/test/core/_b/web/database.c -o CMakeFiles/activatable.dir/database.c.s

web/CMakeFiles/activatable.dir/database.c.o.requires:

.PHONY : web/CMakeFiles/activatable.dir/database.c.o.requires

web/CMakeFiles/activatable.dir/database.c.o.provides: web/CMakeFiles/activatable.dir/database.c.o.requires
	$(MAKE) -f web/CMakeFiles/activatable.dir/build.make web/CMakeFiles/activatable.dir/database.c.o.provides.build
.PHONY : web/CMakeFiles/activatable.dir/database.c.o.provides

web/CMakeFiles/activatable.dir/database.c.o.provides.build: web/CMakeFiles/activatable.dir/database.c.o


web/CMakeFiles/activatable.dir/history.c.o: web/CMakeFiles/activatable.dir/flags.make
web/CMakeFiles/activatable.dir/history.c.o: web/history.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object web/CMakeFiles/activatable.dir/history.c.o"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/activatable.dir/history.c.o   -c /home/test/core/_b/web/history.c

web/CMakeFiles/activatable.dir/history.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/activatable.dir/history.c.i"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/test/core/_b/web/history.c > CMakeFiles/activatable.dir/history.c.i

web/CMakeFiles/activatable.dir/history.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/activatable.dir/history.c.s"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/test/core/_b/web/history.c -o CMakeFiles/activatable.dir/history.c.s

web/CMakeFiles/activatable.dir/history.c.o.requires:

.PHONY : web/CMakeFiles/activatable.dir/history.c.o.requires

web/CMakeFiles/activatable.dir/history.c.o.provides: web/CMakeFiles/activatable.dir/history.c.o.requires
	$(MAKE) -f web/CMakeFiles/activatable.dir/build.make web/CMakeFiles/activatable.dir/history.c.o.provides.build
.PHONY : web/CMakeFiles/activatable.dir/history.c.o.provides

web/CMakeFiles/activatable.dir/history.c.o.provides.build: web/CMakeFiles/activatable.dir/history.c.o


web/CMakeFiles/activatable.dir/loggable.c.o: web/CMakeFiles/activatable.dir/flags.make
web/CMakeFiles/activatable.dir/loggable.c.o: web/loggable.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object web/CMakeFiles/activatable.dir/loggable.c.o"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/activatable.dir/loggable.c.o   -c /home/test/core/_b/web/loggable.c

web/CMakeFiles/activatable.dir/loggable.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/activatable.dir/loggable.c.i"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/test/core/_b/web/loggable.c > CMakeFiles/activatable.dir/loggable.c.i

web/CMakeFiles/activatable.dir/loggable.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/activatable.dir/loggable.c.s"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/test/core/_b/web/loggable.c -o CMakeFiles/activatable.dir/loggable.c.s

web/CMakeFiles/activatable.dir/loggable.c.o.requires:

.PHONY : web/CMakeFiles/activatable.dir/loggable.c.o.requires

web/CMakeFiles/activatable.dir/loggable.c.o.provides: web/CMakeFiles/activatable.dir/loggable.c.o.requires
	$(MAKE) -f web/CMakeFiles/activatable.dir/build.make web/CMakeFiles/activatable.dir/loggable.c.o.provides.build
.PHONY : web/CMakeFiles/activatable.dir/loggable.c.o.provides

web/CMakeFiles/activatable.dir/loggable.c.o.provides.build: web/CMakeFiles/activatable.dir/loggable.c.o


web/CMakeFiles/activatable.dir/plugins.c.o: web/CMakeFiles/activatable.dir/flags.make
web/CMakeFiles/activatable.dir/plugins.c.o: web/plugins.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object web/CMakeFiles/activatable.dir/plugins.c.o"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/activatable.dir/plugins.c.o   -c /home/test/core/_b/web/plugins.c

web/CMakeFiles/activatable.dir/plugins.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/activatable.dir/plugins.c.i"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/test/core/_b/web/plugins.c > CMakeFiles/activatable.dir/plugins.c.i

web/CMakeFiles/activatable.dir/plugins.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/activatable.dir/plugins.c.s"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/test/core/_b/web/plugins.c -o CMakeFiles/activatable.dir/plugins.c.s

web/CMakeFiles/activatable.dir/plugins.c.o.requires:

.PHONY : web/CMakeFiles/activatable.dir/plugins.c.o.requires

web/CMakeFiles/activatable.dir/plugins.c.o.provides: web/CMakeFiles/activatable.dir/plugins.c.o.requires
	$(MAKE) -f web/CMakeFiles/activatable.dir/build.make web/CMakeFiles/activatable.dir/plugins.c.o.provides.build
.PHONY : web/CMakeFiles/activatable.dir/plugins.c.o.provides

web/CMakeFiles/activatable.dir/plugins.c.o.provides.build: web/CMakeFiles/activatable.dir/plugins.c.o


web/CMakeFiles/activatable.dir/settings.c.o: web/CMakeFiles/activatable.dir/flags.make
web/CMakeFiles/activatable.dir/settings.c.o: web/settings.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object web/CMakeFiles/activatable.dir/settings.c.o"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/activatable.dir/settings.c.o   -c /home/test/core/_b/web/settings.c

web/CMakeFiles/activatable.dir/settings.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/activatable.dir/settings.c.i"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/test/core/_b/web/settings.c > CMakeFiles/activatable.dir/settings.c.i

web/CMakeFiles/activatable.dir/settings.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/activatable.dir/settings.c.s"
	cd /home/test/core/_b/web && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/test/core/_b/web/settings.c -o CMakeFiles/activatable.dir/settings.c.s

web/CMakeFiles/activatable.dir/settings.c.o.requires:

.PHONY : web/CMakeFiles/activatable.dir/settings.c.o.requires

web/CMakeFiles/activatable.dir/settings.c.o.provides: web/CMakeFiles/activatable.dir/settings.c.o.requires
	$(MAKE) -f web/CMakeFiles/activatable.dir/build.make web/CMakeFiles/activatable.dir/settings.c.o.provides.build
.PHONY : web/CMakeFiles/activatable.dir/settings.c.o.provides

web/CMakeFiles/activatable.dir/settings.c.o.provides.build: web/CMakeFiles/activatable.dir/settings.c.o


# Object files for target activatable
activatable_OBJECTS = \
"CMakeFiles/activatable.dir/activatable.c.o" \
"CMakeFiles/activatable.dir/database.c.o" \
"CMakeFiles/activatable.dir/history.c.o" \
"CMakeFiles/activatable.dir/loggable.c.o" \
"CMakeFiles/activatable.dir/plugins.c.o" \
"CMakeFiles/activatable.dir/settings.c.o"

# External object files for target activatable
activatable_EXTERNAL_OBJECTS =

web/libactivatable.so: web/CMakeFiles/activatable.dir/activatable.c.o
web/libactivatable.so: web/CMakeFiles/activatable.dir/database.c.o
web/libactivatable.so: web/CMakeFiles/activatable.dir/history.c.o
web/libactivatable.so: web/CMakeFiles/activatable.dir/loggable.c.o
web/libactivatable.so: web/CMakeFiles/activatable.dir/plugins.c.o
web/libactivatable.so: web/CMakeFiles/activatable.dir/settings.c.o
web/libactivatable.so: web/CMakeFiles/activatable.dir/build.make
web/libactivatable.so: web/CMakeFiles/activatable.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C shared module libactivatable.so"
	cd /home/test/core/_b/web && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/activatable.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
web/CMakeFiles/activatable.dir/build: web/libactivatable.so

.PHONY : web/CMakeFiles/activatable.dir/build

web/CMakeFiles/activatable.dir/requires: web/CMakeFiles/activatable.dir/activatable.c.o.requires
web/CMakeFiles/activatable.dir/requires: web/CMakeFiles/activatable.dir/database.c.o.requires
web/CMakeFiles/activatable.dir/requires: web/CMakeFiles/activatable.dir/history.c.o.requires
web/CMakeFiles/activatable.dir/requires: web/CMakeFiles/activatable.dir/loggable.c.o.requires
web/CMakeFiles/activatable.dir/requires: web/CMakeFiles/activatable.dir/plugins.c.o.requires
web/CMakeFiles/activatable.dir/requires: web/CMakeFiles/activatable.dir/settings.c.o.requires

.PHONY : web/CMakeFiles/activatable.dir/requires

web/CMakeFiles/activatable.dir/clean:
	cd /home/test/core/_b/web && $(CMAKE_COMMAND) -P CMakeFiles/activatable.dir/cmake_clean.cmake
.PHONY : web/CMakeFiles/activatable.dir/clean

web/CMakeFiles/activatable.dir/depend: web/activatable.c
web/CMakeFiles/activatable.dir/depend: web/database.c
web/CMakeFiles/activatable.dir/depend: web/history.c
web/CMakeFiles/activatable.dir/depend: web/loggable.c
web/CMakeFiles/activatable.dir/depend: web/plugins.c
web/CMakeFiles/activatable.dir/depend: web/settings.c
web/CMakeFiles/activatable.dir/depend: web/activatable_valac.stamp
	cd /home/test/core/_b && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/test/core /home/test/core/web /home/test/core/_b /home/test/core/_b/web /home/test/core/_b/web/CMakeFiles/activatable.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : web/CMakeFiles/activatable.dir/depend
