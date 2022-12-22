#include "../headers/exception.h"

EXTERNC const char* notQuadraticException::what() const throw(){
    return "This is not a quadratic equation";
}

EXTERNC const char* notQuadraticException::moreInfo(){
    return "In a quadratic equation, the coefficient x\u00b2 can't be zero";
}

EXTERNC const char* RootDoesntExistException::what() const throw(){
    return "This root is imaginary or does not exist";
}