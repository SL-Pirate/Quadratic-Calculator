#include "../headers/QuadCal.h"
#include "../headers/exception.h"
#include <string.h>

EXTERNC const char* Run(double a, double b, double c, const char* &out){
    char* ptr;
    QuadCal *cal = new QuadCal(a, b, c);
    try{
        std::string ans0 = cal->Run();
        ptr = new char[ans0.size() + 1];
        strcpy(ptr, ans0.c_str());
        }
    catch(notQuadraticException E){
        ptr = new char[100];
        strcpy(ptr, E.moreInfo());
    }
    delete(cal);
    return ptr;
}