/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    BOOLCONST = 259,
    NUMCONST = 260,
    CHARCONST = 261,
    STRINGCONST = 262,
    SYMBOL = 263,
    ASGN = 264,
    ADDASGN = 265,
    SUBASGN = 266,
    MULASGN = 267,
    DIVASGN = 268,
    INC = 269,
    DEC = 270,
    GEQ = 271,
    LEQ = 272,
    NEQ = 273,
    LESSTHAN = 274,
    GREATTHAN = 275,
    LPAREN = 276,
    RPAREN = 277,
    LBRACKET = 278,
    RBRACKET = 279,
    PLUS = 280,
    EQUAL = 281,
    MINUS = 282,
    MULT = 283,
    DIV = 284,
    MOD = 285,
    COLON = 286,
    SEMICOLON = 287,
    QUESTION = 288,
    COMMA = 289,
    INT = 290,
    BOOL = 291,
    CHAR = 292,
    STATIC = 293,
    AND = 294,
    OR = 295,
    NOT = 296,
    IF = 297,
    ELSE = 298,
    THEN = 299,
    FOR = 300,
    BREAK = 301,
    RETURN = 302,
    BEGN = 303,
    FINISH = 304,
    TO = 305,
    DO = 306,
    BY = 307,
    WHILE = 308
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 44 "parser.y"

    ExpType type;           // For passing types( i.e. pass a type in a decl like in or bool)
    TokenData *tokenData;   // For terminals. Token data comes from yylex() in the $ vars
    TreeNode *tree;         // For nonterminals. Add these nodes as you build the tree. 

#line 117 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
