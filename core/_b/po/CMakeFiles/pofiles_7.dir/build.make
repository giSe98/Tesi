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

# Utility rule file for pofiles_7.

# Include the progress variables for this target.
include po/CMakeFiles/pofiles_7.dir/progress.make

po/CMakeFiles/pofiles_7: po/bg.gmo


po/bg.gmo: ../po/bg.po
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/test/core/_b/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating bg.gmo"
	cd /home/test/core/po && /usr/bin/msgfmt -o /home/test/core/_b/po/bg.gmo bg.po

pofiles_7: po/CMakeFiles/pofiles_7
pofiles_7: po/bg.gmo
pofiles_7: po/CMakeFiles/pofiles_7.dir/build.make

.PHONY : pofiles_7

# Rule to build all files generated by this target.
po/CMakeFiles/pofiles_7.dir/build: pofiles_7

.PHONY : po/CMakeFiles/pofiles_7.dir/build

po/CMakeFiles/pofiles_7.dir/clean:
	cd /home/test/core/_b/po && $(CMAKE_COMMAND) -P CMakeFiles/pofiles_7.dir/cmake_clean.cmake
.PHONY : po/CMakeFiles/pofiles_7.dir/clean

po/CMakeFiles/pofiles_7.dir/depend:
	cd /home/test/core/_b && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/test/core /home/test/core/po /home/test/core/_b /home/test/core/_b/po /home/test/core/_b/po/CMakeFiles/pofiles_7.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : po/CMakeFiles/pofiles_7.dir/depend

