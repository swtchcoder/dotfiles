valgrind debuginfod
DEBUGINFOD_URLS="https://debuginfod.elfutils.org" valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./program
