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

# Utility rule file for web-extensions.plugin.

# Include the progress variables for this target.
include extensions/CMakeFiles/web-extensions.plugin.dir/progress.make

extensions/CMakeFiles/web-extensions.plugin: ../extensions/web-extensions.plugin.in
	cd /home/test/core/_b/extensions && /usr/bin/intltool-merge --desktop-style /home/test/core/po /home/test/core/extensions/web-extensions.plugin.in web-extensions.plugin

web-extensions.plugin: extensions/CMakeFiles/web-extensions.plugin
web-extensions.plugin: extensions/CMakeFiles/web-extensions.plugin.dir/build.make

.PHONY : web-extensions.plugin

# Rule to build all files generated by this target.
extensions/CMakeFiles/web-extensions.plugin.dir/build: web-extensions.plugin

.PHONY : extensions/CMakeFiles/web-extensions.plugin.dir/build

extensions/CMakeFiles/web-extensions.plugin.dir/clean:
	cd /home/test/core/_b/extensions && $(CMAKE_COMMAND) -P CMakeFiles/web-extensions.plugin.dir/cmake_clean.cmake
.PHONY : extensions/CMakeFiles/web-extensions.plugin.dir/clean

extensions/CMakeFiles/web-extensions.plugin.dir/depend:
	cd /home/test/core/_b && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/test/core /home/test/core/extensions /home/test/core/_b /home/test/core/_b/extensions /home/test/core/_b/extensions/CMakeFiles/web-extensions.plugin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : extensions/CMakeFiles/web-extensions.plugin.dir/depend

