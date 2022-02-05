%{
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - hw1.y
//
// Keller Lawson
// Jan 23, 2022    

#include "scanType.h"  // TokenData Type
#include <stdio.h>

double vars[26];    

extern int yylex();
extern FILE *yyin;
extern int line;         // ERR line number from the scanner!!
extern int numErrors;    // ERR err count

#define YYERROR_VERBOSE
void yyerror(const char *msg)
{
    printf("ERROR(%d): %s\n", line, msg);
    numErrors++;
}

%}

// this is included in the tab.h file
// so scanType.h must be included before the tab.h file!!!!
%union {
    TokenData *tokenData;
}

%token <tokenData> ID BOOLCONST NUMCONST CHARCONST STRINGCONST SYMBOL OTHER

%%
tokenlist     : tokenlist token
              | token
              ;

// FIX DATA AND MEMORY HERE
token         : ID                      {printf("Line %d Token: %s Value: %s\n", $1->linenum, $1->tokenClassStr, $1->tokeninput);}
              | BOOLCONST               {printf("Line %d Token: %s Value: %d Input: %s\n", $1->linenum, $1->tokenClassStr, $1->nvalue, $1->tokeninput);}
              | NUMCONST                {printf("Line %d Token: %s Value: %d Input: %s\n", $1->linenum, $1->tokenClassStr, $1->nvalue, $1->tokeninput);}
              | CHARCONST               {printf("Line %d Token: %s Value: \'%c\' Input: %s\n", $1->linenum, $1->tokenClassStr, $1->cvalue, $1->tokeninput);}
              | STRINGCONST             {printf("Line %d Token: %s Value: %s Len: %d Input: %s\n", $1->linenum, $1->tokenClassStr, $1->svalue, $1->strlength, $1->tokeninput);}
              | SYMBOL                  {printf("Line %d Token: %s\n", $1->linenum, $1->tokeninput);}
              | OTHER                   {printf("Line %d Token: %s\n", $1->linenum, $1->svalue);}
              ;

%%
extern int yydebug;
int main(int argc, char *argv[])
{
    if (argc > 1) {
        if ((yyin = fopen(argv[1], "r"))) {
            // file open successful
        }
        else {
            // failed to open file
            printf("ERROR: failed to open \'%s\'\n", argv[1]);
            exit(1);
        }
    }

    // init variables a through z
    for (int i=0; i<26; i++) vars[i] = 0.0;

    // do the parsing
    numErrors = 0;
    yyparse();

    printf("Number of errors: %d\n", numErrors);   // ERR

    return 0;
}
