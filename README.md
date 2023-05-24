C compiler weak reference tests
===============================

* Only support UNIX-like OSes
* To begin the test, run `make` at the repository root
* A C compiler and GNU make are required
* Known to fail on MinGW, MSYS, and Cygwin (due to PE-COFF and binutils limitation I guess, feel free to correct/fix this)
* To use another C compiler rather than the default one (`/usr/bin/cc`), set the `CC` environment variable to your compiler name before running the `make` command
