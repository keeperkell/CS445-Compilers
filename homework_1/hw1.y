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

%token <tokenData> ID BOOLCONST NUMCONST CHARCONST STRINGCONST

%%
tokenlist     : tokenlist token
              | token
              ;

token         : ID                      {printf("Line %d", $1->linenum, $1->tokenstr);}
              | BOOLCONST
              | NUMCONST               
              | CHARCONST
              | STRINGCONST
              | expression '\n'         { printf("THE ANSWER IS %lg\n", $1); }
              | QUIT '\n'               { exit(0); }
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
