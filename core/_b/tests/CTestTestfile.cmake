# CMake generated Testfile for 
# Source directory: /home/test/core/tests
# Build directory: /home/test/core/_b/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(database "/home/test/core/_b/tests/database")
set_tests_properties(database PROPERTIES  ENVIRONMENT "XDG_CACHE_HOME=/home/test/core/_b/tests/database-folders/XDG_CACHE_HOME;XDG_CONFIG_HOME=/home/test/core/_b/tests/database-folders/XDG_CONFIG_HOME;XDG_DATA_HOME=/home/test/core/_b/tests/database-folders/XDG_DATA_HOME;XDG_RUNTIME_DIR=/home/test/core/_b/tests/database-folders/XDG_RUNTIME_DIR;TMPDIR=/home/test/core/_b/tests/database-folders/TMPDIR;" TIMEOUT "42" WORKING_DIRECTORY "/home/test/core")
add_test(/home/test/core/tests/desktop "/home/test/core/tests/desktop.sh")
set_tests_properties(/home/test/core/tests/desktop PROPERTIES  ENVIRONMENT "SRCDIR=/home/test/core;BLDDIR=_b;")
add_test(/home/test/core/tests/license "/home/test/core/tests/license.sh")
set_tests_properties(/home/test/core/tests/license PROPERTIES  ENVIRONMENT "SRCDIR=/home/test/core;BLDDIR=_b;")
add_test(/home/test/core/tests/potfiles "/home/test/core/tests/potfiles.sh")
set_tests_properties(/home/test/core/tests/potfiles PROPERTIES  ENVIRONMENT "SRCDIR=/home/test/core;BLDDIR=_b;")
