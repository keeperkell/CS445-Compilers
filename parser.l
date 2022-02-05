%{
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - hw1.l
//
// Keller Lawson
// Jan 23, 2022   

// this *order* of these includes is mandatory
#include "scanType.h"  // TokenData Type
#include "parser.tab.h"  // token definitions from the bison

// extra includes for necesary packges or functions
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>

int line = 1;
int numErrors;    // ERR err count
int charLength;

// return length of string accounting for quotations
static size_t getStrLength(char *svalue){
    // remove 2 from length to account for quotations
    return strlen(svalue)-2;
}

// increment through string, changing all chars to uppercase
void toUpperCase(char *str){
    while(*str){
        *str = toupper((unsigned char) *str);
        str++;
    }

    return;
}

// remove duplicate target characters. Specifically used for escape char '\'
void removeChars(char *str, char targetChar){

    char *begin, *end;
    bool foundChar = false;

    for(begin = end = str; *str != '\0'; begin++){

        *end = *begin;

        // check if pointer value is the target character to be removed 
        if(*end != targetChar){
            foundChar = false;
            end++;
        }
        else{
            // if char is found, check if it has been found already. If it was found
            // then increment pointer again and change bool to false to reset pattern. 
            if(foundChar){
                end++;
                foundChar = false;            
            }
            else{
                foundChar = true;
            }
        }
        str++;
    }
    *end = '\0';
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
            yylval.tokenData->tokenClassStr = strdup("BOOLCONST");

            if(strcmp(svalue, "false") == 0){
                yylval.tokenData->nvalue = 0;
            }
            else{
                yylval.tokenData->nvalue = 1;
            }
            break;
        case ID:
            yylval.tokenData->idIndex = svalue[0] - 'a';
            yylval.tokenData->tokenClassStr = strdup("ID");
            break;
        case NUMCONST:
            yylval.tokenData->nvalue = atoi(svalue);
            yylval.tokenData->tokenClassStr = strdup("NUMCONST");
            break;
        case CHARCONST:
            /*
            // single quote (') == 39
            // digit 0 == 48
            // backslash (\) == 92
            // letter n == 110
            */

            // get length of char string
            charLength = strlen(svalue);

            // Standard input char, assign to value
            if(charLength == 3){
                yylval.tokenData->cvalue = svalue[1];
            }

            // if length is longer than 3 produce warning unless escape character exists
            if(charLength > 3){
                // check if char includes a backslash but no valid escape operators
                if(svalue[1] == 92 && svalue[2] != 110 && svalue[2] != 48){
                    yylval.tokenData->cvalue = svalue[2];
                }
                // check if char is new line operator \n
                else if(svalue[1] == 92 && svalue[2] == 110 && svalue[2] != 48){
                    yylval.tokenData->cvalue = '\n';
                }
                // check if char is empty char operator \0
                else if(svalue[1] == 92 && svalue[2] != 110 && svalue[2] == 48){
                    yylval.tokenData->cvalue = '\0';
                }
                // if char input is longer than 3 chars and does not includes escape char, print warning
                else if(svalue[1] != 92){
                    printf("WARNING(%d): character is %d characters long and not a single character: \'%s\'. The first char will be used.\n", line, (charLength-2), svalue);
                     yylval.tokenData->cvalue = svalue[1];
                }
            }

            yylval.tokenData->tokenClassStr = strdup("CHARCONST");
            break;
        case STRINGCONST:
            removeChars(svalue, '\\');

            yylval.tokenData->svalue = strdup(svalue);
            yylval.tokenData->strlength = getStrLength(svalue);
            yylval.tokenData->tokenClassStr = strdup("STRINGCONST");
            break;
        case SYMBOL:
            break;
        case OTHER:
            toUpperCase(svalue);
            yylval.tokenData->svalue = strdup(svalue);
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

"<"|">"|"("|")"|"["|"]"             {return setToken(SYMBOL, line, yytext);}
"+"|"="|"-"|"*"|"/"|"%"             {return setToken(SYMBOL, line, yytext);}
":"|";"|"?"|","                     {return setToken(SYMBOL, line, yytext);}

"int"                               {return setToken(OTHER, line, yytext);}
"dec"                               {return setToken(OTHER, line, yytext);}
"bool"                              {return setToken(OTHER, line, yytext);}
"char"                              {return setToken(OTHER, line, yytext);}
"static"                            {return setToken(OTHER, line, yytext);}
"and"                               {return setToken(OTHER, line, yytext);}
"or"                                {return setToken(OTHER, line, yytext);}
"not"                               {return setToken(OTHER, line, yytext);}
"by"                                {return setToken(OTHER, line, yytext);}
"addasgn"                           {return setToken(OTHER, line, yytext);}
"asgn"                              {return setToken(OTHER, line, yytext);}
"inc"                               {return setToken(OTHER, line, yytext);}
"geq"                               {return setToken(OTHER, line, yytext);}
"leq"                               {return setToken(OTHER, line, yytext);}
"neq"                               {return setToken(OTHER, line, yytext);}
"if"                                {return setToken(OTHER, line, yytext);}
"else"                              {return setToken(OTHER, line, yytext);}
"then"                              {return setToken(OTHER, line, yytext);}
"for"                               {return setToken(OTHER, line, yytext);}
"break"                             {return setToken(OTHER, line, yytext);}
"return"                            {return setToken(OTHER, line, yytext);}
"begin"                             {return setToken(OTHER, line, yytext);}
"end"                               {return setToken(OTHER, line, yytext);}

{LETTER}({LETTER}|{DIGIT})*         {return setToken(ID, line, yytext);}
{DIGIT}+                            {return setToken(NUMCONST, line, yytext);}

\'(\\.|[^\n\'])*\'                  {return setToken(CHARCONST, line, yytext);}
\"(\\.|[^\\\n\"])*\"                {return setToken(STRINGCONST, line, yytext);}  

.                                   {printf("ERROR(%d): char \'%c\' is not in the language\n", line, yytext[0]); numErrors++;}

%%