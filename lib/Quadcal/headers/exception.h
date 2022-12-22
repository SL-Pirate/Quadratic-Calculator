#ifndef EXCEPTION_H
#define EXCEPTION_H
#ifdef __cplusplus
#define EXTERNC extern "C"
#else
#define EXTERNC
#endif

#include <iostream>

class notQuadraticException : std::exception{
    public:
    const char* what() const throw();
    const char* moreInfo();
};

class RootDoesntExistException : std::exception{
    public:
    const char* what() const throw();
};

#endif