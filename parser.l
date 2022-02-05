%{
// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - parser.l
//
// Keller Lawson
// 
// Last Updated
// Feb 4, 2022   

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

        case OTHER:
            toUpperCase(svalue);
            yylval.tokenData->svalue = strdup(svalue);
            break;

        default:
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

"<-"                                {return setToken(ASGN, line, yytext);}
"+="                                {return setToken(ADDASGN, line, yytext);}
"-="                                {return setToken(SUBASGN, line, yytext);}
"*="                                {return setToken(MULASGN, line, yytext);}
"/="                                {return setToken(DIVASGN, line, yytext);}

"++"                                {return setToken(INC, line, yytext);}
"--"                                {return setToken(DEC, line, yytext);}
">="                                {return setToken(GEQ, line, yytext);}
"<="                                {return setToken(LEQ, line, yytext);}
"!="                                {return setToken(NEQ, line, yytext);}

"<"                                 {return setToken(LESSTHAN, line, yytext);}
">"                                 {return setToken(GREATTHAN, line, yytext);}
"("                                 {return setToken(LPAREN, line, yytext);}
")"                                 {return setToken(RPAREN, line, yytext);}
"["                                 {return setToken(LBRACKET, line, yytext);}
"]"                                 {return setToken(RBRACKET, line, yytext);}

"+"                                 {return setToken(PLUS, line, yytext);}
"="                                 {return setToken(EQUAL, line, yytext);}
"-"                                 {return setToken(MINUS, line, yytext);}
"*"                                 {return setToken(MULT, line, yytext);}
"/"                                 {return setToken(DIV, line, yytext);}
"%"                                 {return setToken(MOD, line, yytext);}

":"                                 {return setToken(COLON, line, yytext);}
";"                                 {return setToken(SEMICOLON, line, yytext);}
"?"                                 {return setToken(QUESTION, line, yytext);}
","                                 {return setToken(COMMA, line, yytext);}

"int"                               {return setToken(INT, line, yytext);}
"bool"                              {return setToken(BOOL, line, yytext);}
"char"                              {return setToken(CHAR, line, yytext);}
"static"                            {return setToken(STATIC, line, yytext);}
"and"                               {return setToken(AND, line, yytext);}
"or"                                {return setToken(OR, line, yytext);}
"not"                               {return setToken(NOT, line, yytext);}
"by"                                {return setToken(BY, line, yytext);}
"if"                                {return setToken(IF, line, yytext);}
"else"                              {return setToken(ELSE, line, yytext);}
"then"                              {return setToken(THEN, line, yytext);}
"for"                               {return setToken(FOR, line, yytext);}
"break"                             {return setToken(BREAK, line, yytext);}
"return"                            {return setToken(RETURN, line, yytext);}
"begin"                             {return setToken(BEGIN, line, yytext);}
"end"                               {return setToken(END, line, yytext);}
"to"                                {return setToken(TO, line, yytext);}
"do"                                {return setToken(DO, line, yytext);}
"by"                                {return setToken(BY, line, yytext);}

{LETTER}({LETTER}|{DIGIT})*         {return setToken(ID, line, yytext);}
{DIGIT}+                            {return setToken(NUMCONST, line, yytext);}

\'(\\.|[^\n\'])*\'                  {return setToken(CHARCONST, line, yytext);}
\"(\\.|[^\\\n\"])*\"                {return setToken(STRINGCONST, line, yytext);}  

.                                   {printf("ERROR(%d): Invalid or misplaced input character: \'%c\'. Character Ignored.\n", line, yytext[0]); numErrors++;}

%%