%{
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - hw1.l
//
// Keller Lawson
// Jan 23, 2022   

// this *order* of these includes is mandatory
#include "scanType.h"  // TokenData Type
#include "parser.tab.h"  // token definitions from the bison
#include <string.h>

int line;
int numErrors;    // ERR err count

static size_t getStrLength(char *svalue){
    return strlen(svalue);
}

static int setToken(int tokenClass, int linenum, char *svalue)
{
    // create the pass-back data space
    yylval.tokenData = new TokenData;

    yylval.tokenData->tokenclass = tokenClass;
    yylval.tokenData->linenum = linenum;
    yylval.tokenData->tokeninput = strdup(svalue);

    switch(tokenClass){
        case BOOLCONST:
            if(strcmp(svalue, "false") == 0){
                yylval.tokenData->nvalue = 0;
            }
            else{
                yylval.tokenData->nvalue = 1;
            }
            break;
        case ID:
            yylval.tokenData->idIndex = svalue[0] - 'a';
            break;
        case NUMCONST:
            yylval.tokenData->nvalue = atoi(svalue);
            break;
        case CHARCONST:
            yylval.tokenData->cvalue = svalue[0];
            break;
        case STRINGCONST:
            yylval.tokenData->svalue = strdup(svalue);
            yylval.tokenData->strlength = getStrLength(svalue);
            break;
    }

    return tokenClass;
}

%}

%option noyywrap
LETTER  [a-zA-Z]
DIGIT   [0-9]

%%

[ \t]+
"##".*
\n                                  {line++;}

"true"                              {return setToken(BOOLCONST, line, yytext);}
"false"                             {return setToken(BOOLCONST, line, yytext);}

{LETTER}({LETTER}|{DIGIT})*         {return setToken(ID, line, yytext);}
{DIGIT}+                            {return setToken(NUMCONST, line, yytext);}

'\'\\?{LETTER}|{DIGIT}\''           {return setToken(CHARCONST, line, yytext);}      
\".*\"                              {return setToken(STRINGCONST, line, yytext);}    

"<"|">"|"("|")"|"{"|"}"|"["|"]"     {printf("Line %d Token: %s\n", line, yytext);}
"+"|"="|"-"|"*"|"/"|"%"|";"|":"     {printf("Line %d Token: %s\n", line, yytext);}

.                                   {printf("ERROR(%d): char \'%c\' is not in the language\n", line, yytext[0]); numErrors++;}

%%