/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ID = 258,                      /* ID  */
    BOOLCONST = 259,               /* BOOLCONST  */
    NUMCONST = 260,                /* NUMCONST  */
    CHARCONST = 261,               /* CHARCONST  */
    STRINGCONST = 262,             /* STRINGCONST  */
    ASGN = 263,                    /* ASGN  */
    ADDASGN = 264,                 /* ADDASGN  */
    SUBASGN = 265,                 /* SUBASGN  */
    MULASGN = 266,                 /* MULASGN  */
    DIVASGN = 267,                 /* DIVASGN  */
    INC = 268,                     /* INC  */
    DEC = 269,                     /* DEC  */
    GEQ = 270,                     /* GEQ  */
    LEQ = 271,                     /* LEQ  */
    NEQ = 272,                     /* NEQ  */
    LESSTHAN = 273,                /* LESSTHAN  */
    GREATTHAN = 274,               /* GREATTHAN  */
    LPAREN = 275,                  /* LPAREN  */
    RPAREN = 276,                  /* RPAREN  */
    LBRACKET = 277,                /* LBRACKET  */
    RBRACKET = 278,                /* RBRACKET  */
    PLUS = 279,                    /* PLUS  */
    EQUAL = 280,                   /* EQUAL  */
    MINUS = 281,                   /* MINUS  */
    MULT = 282,                    /* MULT  */
    DIV = 283,                     /* DIV  */
    MOD = 284,                     /* MOD  */
    COLON = 285,                   /* COLON  */
    SEMICOLON = 286,               /* SEMICOLON  */
    QUESTION = 287,                /* QUESTION  */
    COMMA = 288,                   /* COMMA  */
    INT = 289,                     /* INT  */
    BOOL = 290,                    /* BOOL  */
    CHAR = 291,                    /* CHAR  */
    STATIC = 292,                  /* STATIC  */
    AND = 293,                     /* AND  */
    OR = 294,                      /* OR  */
    NOT = 295,                     /* NOT  */
    IF = 296,                      /* IF  */
    ELSE = 297,                    /* ELSE  */
    THEN = 298,                    /* THEN  */
    FOR = 299,                     /* FOR  */
    BREAK = 300,                   /* BREAK  */
    RETURN = 301,                  /* RETURN  */
    BEGN = 302,                    /* BEGN  */
    FINISH = 303,                  /* FINISH  */
    TO = 304,                      /* TO  */
    DO = 305,                      /* DO  */
    BY = 306,                      /* BY  */
    WHILE = 307                    /* WHILE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 41 "parser.y"

    ExpType type;           // For passing types( i.e. pass a type in a decl like in or bool)
    TokenData *tokenData;   // For terminals. Token data comes from yylex() in the $ vars
    TreeNode *tree;         // For nonterminals. Add these nodes as you build the tree. 

#line 122 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
