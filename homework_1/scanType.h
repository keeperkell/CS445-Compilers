#ifndef SCANTYPE_H
#define SCANTYPE_H

struct TokenData {
    int tokenclass;  // token class
    int linenum;     // what line did this token occur on?
    char *tokeninput;  // what string was actually read
    char cvalue;     // any character value
    int nvalue;      // any numeric value or Boolean
    char *svalue;    // any string value
    int strlength;
};

#endif
