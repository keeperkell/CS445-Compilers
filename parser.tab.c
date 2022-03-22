/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "parser.y"

// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - parser.y
//
// Keller Lawson
// 
// Last Updated
// Feb 19, 2022     

#include "scanType.h"     // TokenData Type
#include "treeNode.h"     // Tree Struct
#include "symbolTable.h"  // Symbol Table
#include "semantics.h"    // Semantics  
#include "IO.h"           // IO

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>   

extern int yylex();
extern FILE *yyin;
extern int line;         // ERR line number from the scanner!!
extern int numErrors;    // ERR err count
int numWarnings;         // ERR warning count
bool W_TYPING; 

static TreeNode *AST;
extern SymbolTable st;

#define YYERROR_VERBOSE
void yyerror(const char *msg)
{
    printf("ERROR(%d): %s\n", line, msg);
    numErrors++;
}



#line 111 "parser.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 223 "parser.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */



#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))

/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  12
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   200

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  54
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  47
/* YYNRULES -- Number of rules.  */
#define YYNRULES  108
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  168

#define YYUNDEFTOK  2
#define YYMAXUTOK   308


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    70,    70,    73,    74,    77,    78,    81,    84,    88,
      93,    94,    97,    98,   103,   106,   113,   114,   115,   118,
     124,   131,   132,   135,   136,   139,   142,   143,   146,   150,
     157,   158,   161,   162,   167,   172,   182,   187,   192,   200,
     206,   207,   208,   209,   212,   213,   216,   222,   223,   226,
     227,   230,   234,   241,   244,   251,   256,   260,   265,   270,
     273,   277,   281,   285,   289,   295,   301,   304,   310,   313,
     318,   321,   325,   328,   332,   336,   340,   344,   348,   354,
     358,   361,   365,   371,   375,   378,   382,   386,   392,   395,
     398,   402,   406,   412,   413,   416,   419,   428,   429,   430,
     433,   439,   440,   443,   444,   446,   450,   454,   459
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ID", "BOOLCONST", "NUMCONST",
  "CHARCONST", "STRINGCONST", "SYMBOL", "ASGN", "ADDASGN", "SUBASGN",
  "MULASGN", "DIVASGN", "INC", "DEC", "GEQ", "LEQ", "NEQ", "LESSTHAN",
  "GREATTHAN", "LPAREN", "RPAREN", "LBRACKET", "RBRACKET", "PLUS", "EQUAL",
  "MINUS", "MULT", "DIV", "MOD", "COLON", "SEMICOLON", "QUESTION", "COMMA",
  "INT", "BOOL", "CHAR", "STATIC", "AND", "OR", "NOT", "IF", "ELSE",
  "THEN", "FOR", "BREAK", "RETURN", "BEGN", "FINISH", "TO", "DO", "BY",
  "WHILE", "$accept", "program", "declList", "decl", "varDecl",
  "scopedVarDecl", "varDeclList", "varDeclInit", "varDeclId", "typeSpec",
  "funDecl", "params", "paramList", "paramTypeList", "paramIdList",
  "paramId", "stmt", "matched", "unmatched", "stmtEnd", "expStmt",
  "compoundStmt", "localDecls", "stmtList", "iterRange", "returnStmt",
  "breakStmt", "exp", "assignop", "simpleExp", "andExp", "unaryRelExp",
  "relExp", "relop", "sumExp", "sumop", "mulExp", "mulop", "unaryExp",
  "unaryop", "factor", "mutable", "immutable", "call", "args", "argList",
  "constant", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308
};
# endif

#define YYPACT_NINF (-100)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
       3,     1,  -100,  -100,  -100,    23,     3,  -100,  -100,    28,
    -100,    -2,  -100,  -100,    45,    52,  -100,    22,    70,    55,
      62,  -100,    -2,    90,  -100,   106,    42,    94,    91,  -100,
      81,    -2,   108,   107,   112,  -100,    79,  -100,  -100,  -100,
    -100,    42,  -100,  -100,  -100,    42,    96,    98,  -100,  -100,
      72,    86,  -100,   160,  -100,  -100,  -100,  -100,  -100,   114,
      70,  -100,  -100,  -100,    81,  -100,    42,    42,   117,    96,
     185,  -100,    42,    42,  -100,  -100,  -100,  -100,  -100,  -100,
    -100,  -100,   160,   160,  -100,  -100,  -100,   160,  -100,  -100,
    -100,    44,  -100,  -100,   121,   110,   125,  -100,  -100,  -100,
    -100,  -100,  -100,  -100,  -100,    42,    98,  -100,    85,    86,
    -100,    -2,  -100,   106,     9,  -100,    42,  -100,  -100,   106,
      88,  -100,    42,   147,   119,   151,  -100,    42,  -100,  -100,
    -100,  -100,  -100,  -100,  -100,  -100,   120,  -100,    92,  -100,
     -20,   150,  -100,  -100,   128,   -33,  -100,  -100,   100,    42,
    -100,   100,  -100,   118,   111,   -29,  -100,  -100,   100,   100,
      42,  -100,  -100,  -100,  -100,   -35,    42,    96
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,    18,    16,    17,     0,     2,     4,     5,     0,
       6,    22,     1,     3,    14,     0,    11,    12,     0,     0,
      21,    24,    22,     0,     7,     0,     0,    28,    25,    27,
       0,     0,     0,     0,    14,    10,    95,   108,   105,   106,
     107,     0,    90,    91,    92,     0,    13,    66,    68,    70,
      72,    80,    84,     0,    89,    93,    94,    98,    99,     0,
       0,    48,    20,    23,     0,    15,   102,     0,     0,    59,
      93,    69,     0,     0,    76,    74,    78,    73,    75,    81,
      77,    82,     0,     0,    85,    86,    87,     0,    88,    29,
      26,    50,    19,   104,     0,   101,     0,    97,    60,    61,
      62,    63,    64,    57,    58,     0,    65,    67,    71,    79,
      83,     0,    47,     0,     0,   100,     0,    96,    56,     0,
       0,    45,     0,     0,     0,     0,    46,     0,    49,    30,
      31,    32,    40,    41,    42,    43,     0,   103,     0,     9,
       0,     0,    55,    53,     0,     0,    44,     8,     0,     0,
      54,     0,    39,    30,     0,     0,    34,    37,     0,     0,
       0,    33,    36,    35,    38,    51,     0,    52
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -100,  -100,  -100,   162,  -100,  -100,   -94,   144,  -100,     2,
    -100,   148,  -100,   140,  -100,   113,    26,   -87,   -99,  -100,
    -100,   -21,  -100,  -100,  -100,  -100,  -100,   -38,  -100,   -26,
     103,   -41,  -100,  -100,    95,  -100,    93,  -100,   -43,  -100,
    -100,   -40,  -100,  -100,  -100,  -100,  -100
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     5,     6,     7,     8,   112,    15,    16,    17,    18,
      10,    19,    20,    21,    28,    29,   128,   129,   130,   131,
     132,   133,    91,   114,   154,   134,   135,   136,   105,    69,
      47,    48,    49,    82,    50,    83,    51,    87,    52,    53,
      54,    55,    56,    57,    94,    95,    58
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      46,    70,     9,    68,    71,    72,     1,    72,     9,    62,
      88,    72,    36,    37,    38,    39,    40,   166,   151,   120,
      72,   160,    11,    12,   148,   138,    70,    70,    93,    96,
      41,    14,   107,     2,     3,     4,    42,    43,     2,     3,
       4,   121,    44,    92,   110,    36,    37,    38,    39,    40,
      45,   122,   157,    26,   123,   124,   125,    61,   126,   162,
     164,   153,   127,    41,   156,    70,    22,   118,    23,    42,
      43,   161,   163,    27,    70,    44,    70,    30,   137,     2,
       3,     4,   111,    45,    24,    70,    25,   144,    74,    75,
      76,    77,    78,   113,    31,    33,   140,    79,    80,    81,
      66,   145,    67,    36,    37,    38,    39,    40,    70,    34,
      79,    70,    81,   119,    84,    85,    86,    59,    70,    70,
     139,    41,    25,   155,   147,    60,    25,    42,    43,    61,
      64,    65,   121,    44,   165,    23,    72,    73,    89,    97,
     167,    45,   122,   115,   116,   123,   124,   125,    61,   117,
     141,   142,   146,   127,    36,    37,    38,    39,    40,   149,
     150,   158,   159,    36,    37,    38,    39,    40,    13,    35,
      32,    63,    41,    90,   152,   106,   109,   108,    42,    43,
       0,    41,     0,   143,    44,     0,     0,    42,    43,     0,
       0,     0,    45,    44,    98,    99,   100,   101,   102,   103,
     104
};

static const yytype_int16 yycheck[] =
{
      26,    41,     0,    41,    45,    40,     3,    40,     6,    30,
      53,    40,     3,     4,     5,     6,     7,    52,    51,   113,
      40,    50,    21,     0,    44,   119,    66,    67,    66,    67,
      21,     3,    73,    35,    36,    37,    27,    28,    35,    36,
      37,    32,    33,    64,    87,     3,     4,     5,     6,     7,
      41,    42,   151,    31,    45,    46,    47,    48,    49,   158,
     159,   148,    53,    21,   151,   105,    21,   105,    23,    27,
      28,   158,   159,     3,   114,    33,   116,    22,   116,    35,
      36,    37,    38,    41,    32,   125,    34,   125,    16,    17,
      18,    19,    20,    91,    32,     5,   122,    25,    26,    27,
      21,   127,    23,     3,     4,     5,     6,     7,   148,     3,
      25,   151,    27,   111,    28,    29,    30,    23,   158,   159,
      32,    21,    34,   149,    32,    34,    34,    27,    28,    48,
      22,    24,    32,    33,   160,    23,    40,    39,    24,    22,
     166,    41,    42,    22,    34,    45,    46,    47,    48,    24,
       3,    32,    32,    53,     3,     4,     5,     6,     7,     9,
      32,    43,    51,     3,     4,     5,     6,     7,     6,    25,
      22,    31,    21,    60,   148,    72,    83,    82,    27,    28,
      -1,    21,    -1,    32,    33,    -1,    -1,    27,    28,    -1,
      -1,    -1,    41,    33,     9,    10,    11,    12,    13,    14,
      15
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,    35,    36,    37,    55,    56,    57,    58,    63,
      64,    21,     0,    57,     3,    60,    61,    62,    63,    65,
      66,    67,    21,    23,    32,    34,    31,     3,    68,    69,
      22,    32,    65,     5,     3,    61,     3,     4,     5,     6,
       7,    21,    27,    28,    33,    41,    83,    84,    85,    86,
      88,    90,    92,    93,    94,    95,    96,    97,   100,    23,
      34,    48,    75,    67,    22,    24,    21,    23,    81,    83,
      95,    85,    40,    39,    16,    17,    18,    19,    20,    25,
      26,    27,    87,    89,    28,    29,    30,    91,    92,    24,
      69,    76,    75,    81,    98,    99,    81,    22,     9,    10,
      11,    12,    13,    14,    15,    82,    84,    85,    88,    90,
      92,    38,    59,    63,    77,    22,    34,    24,    81,    63,
      60,    32,    42,    45,    46,    47,    49,    53,    70,    71,
      72,    73,    74,    75,    79,    80,    81,    81,    60,    32,
      83,     3,    32,    32,    81,    83,    32,    32,    44,     9,
      32,    51,    70,    71,    78,    83,    71,    72,    43,    51,
      50,    71,    72,    71,    72,    83,    52,    83
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    54,    55,    56,    56,    57,    57,    58,    59,    59,
      60,    60,    61,    61,    62,    62,    63,    63,    63,    64,
      64,    65,    65,    66,    66,    67,    68,    68,    69,    69,
      70,    70,    71,    71,    71,    71,    72,    72,    72,    72,
      73,    73,    73,    73,    74,    74,    75,    76,    76,    77,
      77,    78,    78,    79,    79,    80,    81,    81,    81,    81,
      82,    82,    82,    82,    82,    83,    83,    84,    84,    85,
      85,    86,    86,    87,    87,    87,    87,    87,    87,    88,
      88,    89,    89,    90,    90,    91,    91,    91,    92,    92,
      93,    93,    93,    94,    94,    95,    95,    96,    96,    96,
      97,    98,    98,    99,    99,   100,   100,   100,   100
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     3,     4,     3,
       3,     1,     1,     3,     1,     4,     1,     1,     1,     6,
       5,     1,     0,     3,     1,     2,     3,     1,     1,     3,
       1,     1,     1,     6,     4,     6,     6,     4,     6,     4,
       1,     1,     1,     1,     2,     1,     4,     2,     0,     2,
       0,     3,     5,     2,     3,     2,     3,     2,     2,     1,
       1,     1,     1,     1,     1,     3,     1,     3,     1,     2,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     3,
       1,     1,     1,     3,     1,     1,     1,     1,     2,     1,
       1,     1,     1,     1,     1,     1,     4,     3,     1,     1,
       4,     1,     0,     3,     1,     1,     1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyo, yytype, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
# undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2:
#line 70 "parser.y"
                                                                { AST = (yyvsp[0].tree);}
#line 1535 "parser.tab.c"
    break;

  case 3:
#line 73 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 1541 "parser.tab.c"
    break;

  case 4:
#line 74 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1547 "parser.tab.c"
    break;

  case 5:
#line 77 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1553 "parser.tab.c"
    break;

  case 6:
#line 78 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1559 "parser.tab.c"
    break;

  case 7:
#line 81 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); assignTyping((yyval.tree), (yyvsp[-2].type)); }
#line 1565 "parser.tab.c"
    break;

  case 8:
#line 84 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->isStatic = true; 
                                                                  assignTyping((yyval.tree), (yyvsp[-2].type)); 
                                                                }
#line 1574 "parser.tab.c"
    break;

  case 9:
#line 88 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  assignTyping((yyval.tree), (yyvsp[-2].type));
                                                                 }
#line 1582 "parser.tab.c"
    break;

  case 10:
#line 93 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree)); }
#line 1588 "parser.tab.c"
    break;

  case 11:
#line 94 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1594 "parser.tab.c"
    break;

  case 12:
#line 97 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1600 "parser.tab.c"
    break;

  case 13:
#line 98 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-2].tree); 
                                                                  (yyvsp[-2].tree)->child[0] = (yyvsp[0].tree); 
                                                                }
#line 1608 "parser.tab.c"
    break;

  case 14:
#line 103 "parser.y"
                                                                { (yyval.tree) = newDeclNode(VarK, (yyvsp[0].tokenData)); 
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                }
#line 1616 "parser.tab.c"
    break;

  case 15:
#line 106 "parser.y"
                                                                { (yyval.tree) = newDeclNode(VarK, (yyvsp[-3].tokenData));       // Ex: ID[NUMCONST]
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                  (yyval.tree)->isArray = true;
                                                                  (yyval.tree)->expType = UndefinedType;
                                                                }
#line 1626 "parser.tab.c"
    break;

  case 16:
#line 113 "parser.y"
                                                                 { (yyval.type) = Boolean; }
#line 1632 "parser.tab.c"
    break;

  case 17:
#line 114 "parser.y"
                                                                 { (yyval.type) = Char; }
#line 1638 "parser.tab.c"
    break;

  case 18:
#line 115 "parser.y"
                                                                 { (yyval.type) = Integer; }
#line 1644 "parser.tab.c"
    break;

  case 19:
#line 118 "parser.y"
                                                                 { (yyval.tree) = newDeclNode(FuncK, (yyvsp[-4].tokenData));     // Ex: BOOL ID(params) compoundStmt
                                                                   (yyval.tree)->attr.name = (yyvsp[-4].tokenData)->tokeninput;
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                   (yyval.tree)->expType = (yyvsp[-5].type);
                                                                 }
#line 1655 "parser.tab.c"
    break;

  case 20:
#line 124 "parser.y"
                                                                 { (yyval.tree) = newDeclNode(FuncK, (yyvsp[-4].tokenData));     // Ex: BOOL ID(params) compoundStmt
                                                                   (yyval.tree)->attr.name = (yyvsp[-4].tokenData)->tokeninput;
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                 }
#line 1665 "parser.tab.c"
    break;

  case 21:
#line 131 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1671 "parser.tab.c"
    break;

  case 22:
#line 132 "parser.y"
                                                                 { (yyval.tree) = NULL; }
#line 1677 "parser.tab.c"
    break;

  case 23:
#line 135 "parser.y"
                                                                 { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree)); }
#line 1683 "parser.tab.c"
    break;

  case 24:
#line 136 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1689 "parser.tab.c"
    break;

  case 25:
#line 139 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); assignTyping((yyval.tree), (yyvsp[-1].type)); }
#line 1695 "parser.tab.c"
    break;

  case 26:
#line 142 "parser.y"
                                                                 { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree)); }
#line 1701 "parser.tab.c"
    break;

  case 27:
#line 143 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1707 "parser.tab.c"
    break;

  case 28:
#line 146 "parser.y"
                                                                 { (yyval.tree) = newDeclNode(ParamK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput; 
                                                                   (yyval.tree)->isInit = true;
                                                                 }
#line 1716 "parser.tab.c"
    break;

  case 29:
#line 150 "parser.y"
                                                                 { (yyval.tree) = newDeclNode(ParamK, (yyvsp[-2].tokenData));
                                                                   (yyval.tree)->isArray = true;
                                                                   (yyval.tree)->isInit = true;
                                                                   (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput; 
                                                                 }
#line 1726 "parser.tab.c"
    break;

  case 30:
#line 157 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1732 "parser.tab.c"
    break;

  case 31:
#line 158 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1738 "parser.tab.c"
    break;

  case 32:
#line 161 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1744 "parser.tab.c"
    break;

  case 33:
#line 162 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(IfK, (yyvsp[-5].tokenData)); 
                                                                   (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                 }
#line 1754 "parser.tab.c"
    break;

  case 34:
#line 167 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(WhileK, (yyvsp[-3].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                 }
#line 1764 "parser.tab.c"
    break;

  case 35:
#line 172 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(ForK, (yyvsp[-5].tokenData));
                                                                   (yyval.tree)->child[0] = newDeclNode(VarK, (yyvsp[-4].tokenData));
                                                                   (yyval.tree)->child[0]->expType = Integer;
                                                                   (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                   (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                   
                                                                 }
#line 1777 "parser.tab.c"
    break;

  case 36:
#line 182 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(IfK, (yyvsp[-5].tokenData)); 
                                                                   (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[2] = (yyvsp[0].tree); 
                                                                 }
#line 1787 "parser.tab.c"
    break;

  case 37:
#line 187 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(WhileK, (yyvsp[-3].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                 }
#line 1797 "parser.tab.c"
    break;

  case 38:
#line 192 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(ForK, (yyvsp[-5].tokenData));
                                                                   (yyval.tree)->child[0] = newDeclNode(VarK, (yyvsp[-4].tokenData));
                                                                   (yyval.tree)->child[0]->expType = Integer;
                                                                   (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                   (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                   
                                                                 }
#line 1810 "parser.tab.c"
    break;

  case 39:
#line 200 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(IfK, (yyvsp[-3].tokenData));              
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree); 
                                                                 }
#line 1819 "parser.tab.c"
    break;

  case 40:
#line 206 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1825 "parser.tab.c"
    break;

  case 41:
#line 207 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1831 "parser.tab.c"
    break;

  case 42:
#line 208 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1837 "parser.tab.c"
    break;

  case 43:
#line 209 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1843 "parser.tab.c"
    break;

  case 44:
#line 212 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[-1].tree); }
#line 1849 "parser.tab.c"
    break;

  case 45:
#line 213 "parser.y"
                                                                 { (yyval.tree) = NULL; }
#line 1855 "parser.tab.c"
    break;

  case 46:
#line 216 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(CompoundK, (yyvsp[-3].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[-1].tree);
                                                                 }
#line 1864 "parser.tab.c"
    break;

  case 47:
#line 222 "parser.y"
                                                                 { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 1870 "parser.tab.c"
    break;

  case 48:
#line 223 "parser.y"
                                                                 { (yyval.tree) = NULL; }
#line 1876 "parser.tab.c"
    break;

  case 49:
#line 226 "parser.y"
                                                                 { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 1882 "parser.tab.c"
    break;

  case 50:
#line 227 "parser.y"
                                                                 { (yyval.tree) = NULL; }
#line 1888 "parser.tab.c"
    break;

  case 51:
#line 230 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(RangeK, (yyvsp[-1].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                 }
#line 1897 "parser.tab.c"
    break;

  case 52:
#line 234 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(RangeK, (yyvsp[-3].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                 }
#line 1907 "parser.tab.c"
    break;

  case 53:
#line 241 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(ReturnK, (yyvsp[-1].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                 }
#line 1915 "parser.tab.c"
    break;

  case 54:
#line 244 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(ReturnK, (yyvsp[-2].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = (yyvsp[-1].tree)->expType;
                                                                 }
#line 1925 "parser.tab.c"
    break;

  case 55:
#line 251 "parser.y"
                                                                 { (yyval.tree) = newStmtNode(BreakK, (yyvsp[-1].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                 }
#line 1933 "parser.tab.c"
    break;

  case 56:
#line 256 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[-1].tree); 
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                 }
#line 1942 "parser.tab.c"
    break;

  case 57:
#line 260 "parser.y"
                                                                 { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 1952 "parser.tab.c"
    break;

  case 58:
#line 265 "parser.y"
                                                                 { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 1962 "parser.tab.c"
    break;

  case 59:
#line 270 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 1968 "parser.tab.c"
    break;

  case 60:
#line 273 "parser.y"
                                                                 { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 1977 "parser.tab.c"
    break;

  case 61:
#line 277 "parser.y"
                                                                 { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 1986 "parser.tab.c"
    break;

  case 62:
#line 281 "parser.y"
                                                                 { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 1995 "parser.tab.c"
    break;

  case 63:
#line 285 "parser.y"
                                                                 { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2004 "parser.tab.c"
    break;

  case 64:
#line 289 "parser.y"
                                                                 { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2013 "parser.tab.c"
    break;

  case 65:
#line 295 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2024 "parser.tab.c"
    break;

  case 66:
#line 301 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2030 "parser.tab.c"
    break;

  case 67:
#line 304 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2041 "parser.tab.c"
    break;

  case 68:
#line 310 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2047 "parser.tab.c"
    break;

  case 69:
#line 313 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[0].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2057 "parser.tab.c"
    break;

  case 70:
#line 318 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2063 "parser.tab.c"
    break;

  case 71:
#line 321 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[-1].tree); 
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                 }
#line 2072 "parser.tab.c"
    break;

  case 72:
#line 325 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2078 "parser.tab.c"
    break;

  case 73:
#line 328 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2087 "parser.tab.c"
    break;

  case 74:
#line 332 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2096 "parser.tab.c"
    break;

  case 75:
#line 336 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2105 "parser.tab.c"
    break;

  case 76:
#line 340 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2114 "parser.tab.c"
    break;

  case 77:
#line 344 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2123 "parser.tab.c"
    break;

  case 78:
#line 348 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Boolean;
                                                                 }
#line 2132 "parser.tab.c"
    break;

  case 79:
#line 354 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[-1].tree); 
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                 }
#line 2141 "parser.tab.c"
    break;

  case 80:
#line 358 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2147 "parser.tab.c"
    break;

  case 81:
#line 361 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2156 "parser.tab.c"
    break;

  case 82:
#line 365 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2165 "parser.tab.c"
    break;

  case 83:
#line 371 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[-1].tree); 
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                 }
#line 2174 "parser.tab.c"
    break;

  case 84:
#line 375 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2180 "parser.tab.c"
    break;

  case 85:
#line 378 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2189 "parser.tab.c"
    break;

  case 86:
#line 382 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2198 "parser.tab.c"
    break;

  case 87:
#line 386 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2207 "parser.tab.c"
    break;

  case 88:
#line 392 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[-1].tree); 
                                                                   (yyval.tree)->child[0] = (yyvsp[0].tree);
                                                                 }
#line 2215 "parser.tab.c"
    break;

  case 89:
#line 395 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2221 "parser.tab.c"
    break;

  case 90:
#line 398 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2230 "parser.tab.c"
    break;

  case 91:
#line 402 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2239 "parser.tab.c"
    break;

  case 92:
#line 406 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2248 "parser.tab.c"
    break;

  case 93:
#line 412 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2254 "parser.tab.c"
    break;

  case 94:
#line 413 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2260 "parser.tab.c"
    break;

  case 95:
#line 416 "parser.y"
                                                                 { (yyval.tree) = newExpNode(IdK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;    
                                                                 }
#line 2268 "parser.tab.c"
    break;

  case 96:
#line 419 "parser.y"
                                                                 { (yyval.tree) = newExpNode(OpK, (yyvsp[-2].tokenData));  
                                                                  (yyval.tree)->child[0] = newExpNode(IdK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0]->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                  (yyval.tree)->child[0]->isArray = true;
                                                                  (yyval.tree)->child[1] = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput;
                                                                }
#line 2280 "parser.tab.c"
    break;

  case 97:
#line 428 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[-1].tree); }
#line 2286 "parser.tab.c"
    break;

  case 98:
#line 429 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2292 "parser.tab.c"
    break;

  case 99:
#line 430 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2298 "parser.tab.c"
    break;

  case 100:
#line 433 "parser.y"
                                                                 { (yyval.tree) = newExpNode(CallK, (yyvsp[-3].tokenData));
                                                                   (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                   (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                 }
#line 2307 "parser.tab.c"
    break;

  case 101:
#line 439 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2313 "parser.tab.c"
    break;

  case 102:
#line 440 "parser.y"
                                                                 { (yyval.tree) = NULL; }
#line 2319 "parser.tab.c"
    break;

  case 103:
#line 443 "parser.y"
                                                                 { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree)); }
#line 2325 "parser.tab.c"
    break;

  case 104:
#line 444 "parser.y"
                                                                 { (yyval.tree) = (yyvsp[0].tree); }
#line 2331 "parser.tab.c"
    break;

  case 105:
#line 446 "parser.y"
                                                                 { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.value = (yyvsp[0].tokenData)->nvalue; 
                                                                   (yyval.tree)->expType = Integer;
                                                                 }
#line 2340 "parser.tab.c"
    break;

  case 106:
#line 450 "parser.y"
                                                                 { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.cvalue = (yyvsp[0].tokenData)->cvalue; 
                                                                   (yyval.tree)->expType = Char;
                                                                 }
#line 2349 "parser.tab.c"
    break;

  case 107:
#line 454 "parser.y"
                                                                 { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.string = (yyvsp[0].tokenData)->svalue; 
                                                                   (yyval.tree)->expType = Char;
                                                                   (yyval.tree)->isArray = true;
                                                                 }
#line 2359 "parser.tab.c"
    break;

  case 108:
#line 459 "parser.y"
                                                                 { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                   (yyval.tree)->attr.value = (yyvsp[0].tokenData)->nvalue; 
                                                                   (yyval.tree)->expType = Boolean;
                                                                   (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                 }
#line 2369 "parser.tab.c"
    break;


#line 2373 "parser.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[+*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 466 "parser.y"

extern int yydebug;

int main(int argc, char *argv[])
{
    int option;
    TreeNode *funcMainNode;

    // get CLI option when program is run
    if((option = getopt(argc, argv, "dDhpP")) != -1){

      if ((yyin = fopen(argv[2], "r"))) {
            // file open successful
      }
      else {
            // failed to open file
            numErrors++; 

            printf("ERROR(ARGLIST): source file \"%s\" could not be opened. \n", argv[2]);
            printf("Number of warnings: %d\n", numWarnings);
            printf("Number of errors: %d\n", numErrors);
            exit(1);
      }
      
      if(option == 'd' || option == 'D' | option == 'h'){
        switch(option){
          case 'd':
            yydebug = 1;
            yyparse();
            break;

          case 'D':

            st.debug(1);
            //load IO funcs into symboltable
            IOconstructor();
            
            yyparse();
            semanticAnalysis(AST);
            
            break;
            
          case 'h':
            printf("usage: c- [options] [sourcefile]\n");
            printf("options: \n");
            printf("-d          - turn on parser debugging\n");
            printf("-D          - turn on symbol table debugging\n");
            printf("-h          - print this usage message\n");
            printf("-p          - print the abstract syntax tree");
            printf("-P          - print the abstract syntax tree plus type information");     
            break; 
        }
      }
      else{
        // Parse Tree and check for errors
        yyparse();

        if(!numErrors){
          switch(option){
            case 'p':
              W_TYPING = false;
              printTree(AST, W_TYPING, 0);
              break;

            case 'P':

              //load IO funcs into symboltable
              IOconstructor();
              
              semanticAnalysis(AST);

              funcMainNode = (TreeNode *)st.lookup("main");
              
              // if main doesnt exist, print error
              if(!funcMainNode){
                numErrors++;
                
                printf("ERROR(LINKER): A function named \'main()\' must be defined.\n");
              }

              if(!numErrors){
                W_TYPING = true;
                printTree(AST, W_TYPING, 0);
              }
              
              break;

            default:
              break;
          }
        } 
      }

      // report number of errors and warning
      printf("Number of warnings: %d\n", numWarnings);
      printf("Number of errors: %d\n", numErrors);

    }
    else{
      if ((yyin = fopen(argv[1], "r"))) {
            // file open successful
      }
      else {
            // failed to open file
            numErrors++;
            printf("ERROR(ARGLIST): source file \"%s\" could not be opened.\n", argv[1]);
            printf("Number of warnings: %d\n", numWarnings);
            printf("Number of errors: %d\n", numErrors);
            exit(1);
      }   
      yyparse();
    }

    return 0;
}
