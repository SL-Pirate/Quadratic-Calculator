cmake_minimum_required(VERSION 3.4.1)  # for example

project(libquadcal)
add_library( quadcal

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
		../lib/Quadcal/src/CalApi.cpp
		../lib/Quadcal/src/exception.cpp
		../lib/Quadcal/src/Quadcal.cpp
     )
