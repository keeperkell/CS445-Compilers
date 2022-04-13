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
#include "yyerror.h"      // yy error

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>   

extern int yylex();
extern FILE *yyin;
extern int line;         // ERR line number from the scanner!!
extern int numErrors;    // ERR err count
extern int numWarnings;  // ERR warning count
bool W_TYPING; 

static TreeNode *AST;
SymbolTable st;

#define YYERROR_VERBOSE


#line 106 "parser.tab.c"

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
    ASGN = 263,
    ADDASGN = 264,
    SUBASGN = 265,
    MULASGN = 266,
    DIVASGN = 267,
    INC = 268,
    DEC = 269,
    GEQ = 270,
    LEQ = 271,
    NEQ = 272,
    LESSTHAN = 273,
    GREATTHAN = 274,
    LPAREN = 275,
    RPAREN = 276,
    LBRACKET = 277,
    RBRACKET = 278,
    PLUS = 279,
    EQUAL = 280,
    MINUS = 281,
    MULT = 282,
    DIV = 283,
    MOD = 284,
    COLON = 285,
    SEMICOLON = 286,
    QUESTION = 287,
    COMMA = 288,
    INT = 289,
    BOOL = 290,
    CHAR = 291,
    STATIC = 292,
    AND = 293,
    OR = 294,
    NOT = 295,
    IF = 296,
    ELSE = 297,
    THEN = 298,
    FOR = 299,
    BREAK = 300,
    RETURN = 301,
    BEGN = 302,
    FINISH = 303,
    TO = 304,
    DO = 305,
    BY = 306,
    WHILE = 307
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 39 "parser.y"

    ExpType type;           // For passing types( i.e. pass a type in a decl like in or bool)
    TokenData *tokenData;   // For terminals. Token data comes from yylex() in the $ vars
    TreeNode *tree;         // For nonterminals. Add these nodes as you build the tree. 

#line 217 "parser.tab.c"

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
#define YYFINAL  18
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   644

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  53
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  47
/* YYNRULES -- Number of rules.  */
#define YYNRULES  155
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  248

#define YYUNDEFTOK  2
#define YYMAXUTOK   307


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
      45,    46,    47,    48,    49,    50,    51,    52
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    65,    65,    68,    69,    72,    73,    74,    77,    81,
      84,    89,    94,   100,   103,   104,   105,   108,   109,   114,
     119,   122,   127,   128,   133,   134,   135,   138,   144,   149,
     150,   151,   152,   155,   156,   159,   160,   161,   162,   165,
     168,   171,   174,   175,   176,   179,   183,   190,   191,   194,
     195,   200,   205,   212,   215,   218,   219,   222,   223,   226,
     229,   234,   239,   246,   250,   253,   256,   259,   264,   265,
     266,   267,   270,   271,   272,   277,   284,   285,   288,   289,
     292,   296,   301,   302,   303,   308,   311,   317,   322,   327,
     331,   336,   341,   342,   345,   346,   349,   355,   359,   363,
     367,   371,   377,   383,   384,   387,   393,   394,   397,   402,
     403,   406,   410,   411,   414,   418,   422,   426,   430,   434,
     440,   444,   445,   448,   452,   458,   462,   463,   466,   470,
     474,   480,   483,   484,   487,   491,   495,   501,   502,   505,
     508,   517,   520,   521,   522,   525,   529,   534,   535,   538,
     539,   540,   543,   547,   551,   556
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ID", "BOOLCONST", "NUMCONST",
  "CHARCONST", "STRINGCONST", "ASGN", "ADDASGN", "SUBASGN", "MULASGN",
  "DIVASGN", "INC", "DEC", "GEQ", "LEQ", "NEQ", "LESSTHAN", "GREATTHAN",
  "LPAREN", "RPAREN", "LBRACKET", "RBRACKET", "PLUS", "EQUAL", "MINUS",
  "MULT", "DIV", "MOD", "COLON", "SEMICOLON", "QUESTION", "COMMA", "INT",
  "BOOL", "CHAR", "STATIC", "AND", "OR", "NOT", "IF", "ELSE", "THEN",
  "FOR", "BREAK", "RETURN", "BEGN", "FINISH", "TO", "DO", "BY", "WHILE",
  "$accept", "program", "declList", "decl", "varDecl", "scopedVarDecl",
  "varDeclList", "varDeclInit", "varDeclId", "typeSpec", "funDecl",
  "params", "paramList", "paramTypeList", "paramIdList", "paramId", "stmt",
  "matched", "unmatched", "stmtEnd", "expStmt", "compoundStmt",
  "localDecls", "stmtList", "iterRange", "returnStmt", "breakStmt", "exp",
  "assignop", "simpleExp", "andExp", "unaryRelExp", "relExp", "relop",
  "sumExp", "sumop", "mulExp", "mulop", "unaryExp", "unaryop", "factor",
  "mutable", "immutable", "call", "args", "argList", "constant", YY_NULLPTR
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
     305,   306,   307
};
# endif

#define YYPACT_NINF (-145)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-149)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      31,   102,     7,  -145,  -145,  -145,    30,   158,  -145,  -145,
      94,  -145,     3,    61,   113,  -145,    22,    75,  -145,  -145,
     531,   238,   138,  -145,   235,    23,  -145,   188,   235,    91,
     283,    83,    89,  -145,  -145,   169,  -145,   101,   286,  -145,
    -145,  -145,  -145,   275,  -145,  -145,  -145,   284,   127,    95,
    -145,  -145,   618,   196,  -145,   525,  -145,  -145,  -145,  -145,
    -145,  -145,   118,     3,  -145,   127,   144,   164,   204,  -145,
      16,    81,    91,   222,  -145,    87,   293,   612,   223,   127,
     200,   101,  -145,   325,   334,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,   533,   543,  -145,  -145,  -145,   573,   101,
    -145,  -145,   227,   302,  -145,  -145,  -145,  -145,  -145,   206,
     612,  -145,   233,   226,   240,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,   293,  -145,  -145,  -145,   343,   101,    95,   101,
    -145,   101,   288,   101,   196,   101,  -145,  -145,  -145,  -145,
     212,  -145,  -145,   375,  -145,  -145,   612,  -145,   199,  -145,
     320,     9,   612,  -145,   320,   303,   575,  -145,   384,   352,
     237,   125,  -145,   393,  -145,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,   242,   331,  -145,  -145,     0,    41,  -145,   256,
    -145,   599,  -145,   243,    -2,   -28,  -145,  -145,   175,   175,
     225,   425,  -145,  -145,   225,   225,   434,   355,   443,  -145,
     241,  -145,   250,    98,   259,   149,  -145,  -145,  -145,  -145,
      44,   121,   285,   105,    29,   225,   225,   225,   316,   225,
     475,   175,   175,   484,   175,   175,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,   101,   -14,   276,   280,   103,
     277,   493,   175,   175,   175,   175,   101,   127
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,    26,    24,    25,     0,     0,     4,     5,
       0,     6,    16,    20,     0,    14,    17,     0,     1,     3,
      30,    20,     0,    23,     0,     0,     9,     0,     0,    32,
       0,     0,    33,    36,    10,     0,     8,     0,   139,   155,
     152,   153,   154,     0,   134,   135,   136,     0,    19,   103,
     106,   109,   112,   121,   126,     0,   132,   137,   138,   142,
     143,    22,     0,    15,    13,    18,    40,    45,    39,    42,
       0,     0,    29,     0,   146,     0,     0,   144,     0,    92,
     137,   110,   108,     0,     0,   117,   115,   119,   114,   116,
     123,   118,   124,     0,     0,   128,   129,   130,     0,   133,
     131,    21,     0,     0,    31,    77,    28,    37,    35,     0,
       0,   150,     0,   147,     0,    97,    98,    99,   100,   101,
      95,    96,     0,   141,    90,    91,     0,   104,   102,   107,
     105,   113,   111,   122,   120,   127,   125,    46,    43,    41,
      79,    27,   145,     0,   140,    93,    94,    89,     0,    76,
       0,     0,   151,   149,     0,     0,     0,    73,     0,     0,
       0,     0,    75,     0,    78,    47,    48,    49,    68,    69,
      70,    71,     0,     0,    12,    74,    55,     0,    59,     0,
      88,     0,    85,     0,    57,     0,    72,    11,     0,     0,
       0,     0,    87,    86,     0,     0,     0,     0,     0,    54,
      67,    63,    47,     0,     0,     0,    56,    65,    51,    61,
      55,     0,     0,    57,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    53,    64,    50,    60,
      58,    66,    84,    52,    62,    82,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,    81
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -145,  -145,  -145,   335,  -145,  -145,    -7,   332,  -145,     2,
    -145,   308,  -145,   296,  -145,   265,   181,  -144,   -32,  -145,
    -145,   -62,  -145,  -145,   150,  -145,  -145,   -37,   292,   -23,
     294,   -26,  -145,  -145,   291,  -145,   298,  -145,   -36,  -145,
    -145,   -24,  -145,  -145,  -145,  -145,  -145
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,     7,     8,     9,   149,    14,    15,    16,    30,
      11,    31,    32,    33,    68,    69,   164,   206,   166,   167,
     168,   169,   140,   151,   204,   170,   171,   172,   122,    79,
      49,    50,    51,    93,    52,    94,    53,    98,    54,    55,
      56,    80,    58,    59,   112,   113,    60
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      57,    48,    10,    22,    57,    65,    78,   165,   106,    10,
     156,    83,    38,    39,    40,    41,    42,   104,    74,   100,
      74,    82,   195,    57,    61,    83,    23,    17,    62,    43,
      18,    57,     1,    24,     2,    44,    45,   241,   111,   114,
     157,    46,   188,   189,   199,   200,   202,   141,   194,    47,
     158,   208,    28,   159,   160,   161,   105,   162,   130,    57,
      57,   163,   136,   105,    74,     3,     4,     5,    83,    57,
      57,   226,   228,   230,    57,   233,    29,   237,   238,   225,
      83,   208,   107,    25,   190,   145,   188,   221,   110,   147,
      38,    39,    40,    41,    42,    20,   -34,    21,   226,   228,
     230,   233,    -7,    12,    70,    13,   153,    43,  -148,     3,
       4,     5,   -38,    44,    45,     3,     4,     5,    74,    46,
      71,    74,   -38,    74,   183,    74,   181,    47,    38,    39,
      40,    41,    42,    84,    57,   177,    -7,    -7,    -7,    57,
     185,   101,   150,   155,    26,    43,    27,   173,   217,   218,
     154,    44,    45,   244,   218,   224,   182,    46,    -2,     1,
      83,     2,   207,   209,   222,    47,    83,    57,   205,    36,
      72,    27,    57,   211,    57,   214,   156,   -44,    38,    39,
      40,    41,    42,   227,   229,   231,   102,   234,    83,    63,
     -34,    13,     3,     4,     5,    43,    57,   236,   220,    57,
     205,    44,    45,     3,     4,     5,   157,    46,   115,   116,
     117,   118,   119,   124,   125,    47,   196,    57,   247,   197,
     160,   161,   105,    95,    96,    97,   156,   198,    38,    39,
      40,    41,    42,     3,     4,     5,    37,   103,    38,    39,
      40,    41,    42,   109,   123,    43,     3,     4,     5,   148,
     137,    44,    45,   105,   142,    43,   157,    46,    35,   143,
      25,    44,    45,   144,   191,    47,   158,    46,   180,   159,
     160,   161,   105,   186,   193,    47,    77,   163,    38,    39,
      40,    41,    42,   215,    66,    81,    67,    38,    39,    40,
      41,    42,   216,   223,   110,    43,    38,    39,    40,    41,
      42,    44,    45,   138,    43,    67,    75,    46,    76,   219,
      44,    45,    90,    43,    92,    47,    46,   232,   242,    44,
      45,    12,   243,    13,    47,    46,   127,   245,    38,    39,
      40,    41,    42,    47,   174,   129,    27,    38,    39,    40,
      41,    42,    19,    73,   146,    43,    38,    39,    40,    41,
      42,    44,    45,   178,    43,   179,   178,    46,   212,    64,
      44,    45,   187,    43,    27,    47,    46,   108,   139,    44,
      45,   201,   126,   240,    47,    46,   152,   128,    38,    39,
      40,    41,    42,    47,   132,   176,     0,    38,    39,    40,
      41,    42,   134,     0,   184,    43,    38,    39,    40,    41,
      42,    44,    45,     0,    43,     0,     0,    46,     0,     0,
      44,    45,     0,    43,     0,    47,    46,     0,     0,    44,
      45,     0,     0,     0,    47,    46,   203,     0,    38,    39,
      40,    41,    42,    47,     0,   210,     0,    38,    39,    40,
      41,    42,     0,     0,   213,    43,    38,    39,    40,    41,
      42,    44,    45,     0,    43,     0,     0,    46,     0,     0,
      44,    45,     0,    43,     0,    47,    46,     0,     0,    44,
      45,     0,     0,     0,    47,    46,   235,     0,    38,    39,
      40,    41,    42,    47,     0,   239,     0,    38,    39,    40,
      41,    42,     0,     0,   246,    43,    38,    39,    40,    41,
      42,    44,    45,     0,    43,     0,     0,    46,     0,     0,
      44,    45,     0,    43,     0,    47,    46,     0,     0,    44,
      45,     0,     0,     0,    47,    46,    99,     0,    38,    39,
      40,    41,    42,    47,   131,     0,    38,    39,    40,    41,
      42,     0,     0,     0,   133,    43,    38,    39,    40,    41,
      42,    44,    45,    43,    23,     0,     0,    46,     0,    44,
      45,    24,    34,    43,   -16,    46,     0,     0,     0,    44,
      45,     0,     0,     0,   135,    46,    38,    39,    40,    41,
      42,     0,     0,   115,   116,   117,   118,   119,   120,   121,
       0,     0,     0,    43,     0,    74,     0,     0,     0,    44,
      45,     0,     0,     0,     0,    46,   175,   115,   116,   117,
     118,   119,   120,   121,     0,     0,     0,     0,     0,    74,
     115,   116,   117,   118,   119,   120,   121,     0,     0,     0,
     192,     0,    74,    85,    86,    87,    88,    89,     0,     0,
       0,     0,    90,    91,    92
};

static const yytype_int16 yycheck[] =
{
      24,    24,     0,    10,    28,    28,    43,   151,    70,     7,
       1,    39,     3,     4,     5,     6,     7,     1,    20,    55,
      20,    47,    50,    47,     1,    39,    23,    20,     5,    20,
       0,    55,     1,    30,     3,    26,    27,    51,    75,    76,
      31,    32,    42,    43,   188,   189,   190,   109,    50,    40,
      41,   195,    30,    44,    45,    46,    47,    48,    84,    83,
      84,    52,    98,    47,    20,    34,    35,    36,    39,    93,
      94,   215,   216,   217,    98,   219,     1,   221,   222,    50,
      39,   225,     1,    22,    43,   122,    42,    43,     1,   126,
       3,     4,     5,     6,     7,     1,    21,     3,   242,   243,
     244,   245,     0,     1,    21,     3,   143,    20,    21,    34,
      35,    36,    21,    26,    27,    34,    35,    36,    20,    32,
      31,    20,    31,    20,   161,    20,     1,    40,     3,     4,
       5,     6,     7,    38,   158,   158,    34,    35,    36,   163,
     163,    23,   140,   150,    31,    20,    33,   154,    50,    51,
     148,    26,    27,    50,    51,    50,    31,    32,     0,     1,
      39,     3,   194,   195,    43,    40,    39,   191,   191,    31,
       1,    33,   196,   196,   198,   198,     1,    33,     3,     4,
       5,     6,     7,   215,   216,   217,    22,   219,    39,     1,
      21,     3,    34,    35,    36,    20,   220,   220,    49,   223,
     223,    26,    27,    34,    35,    36,    31,    32,     8,     9,
      10,    11,    12,    13,    14,    40,    41,   241,   241,    44,
      45,    46,    47,    27,    28,    29,     1,    52,     3,     4,
       5,     6,     7,    34,    35,    36,     1,    33,     3,     4,
       5,     6,     7,    21,    21,    20,    34,    35,    36,    37,
      23,    26,    27,    47,    21,    20,    31,    32,    20,    33,
      22,    26,    27,    23,     8,    40,    41,    32,    31,    44,
      45,    46,    47,    31,    31,    40,     1,    52,     3,     4,
       5,     6,     7,    42,     1,     1,     3,     3,     4,     5,
       6,     7,    42,     8,     1,    20,     3,     4,     5,     6,
       7,    26,    27,     1,    20,     3,    20,    32,    22,    50,
      26,    27,    24,    20,    26,    40,    32,     1,    42,    26,
      27,     1,    42,     3,    40,    32,     1,    50,     3,     4,
       5,     6,     7,    40,    31,     1,    33,     3,     4,     5,
       6,     7,     7,    35,     1,    20,     3,     4,     5,     6,
       7,    26,    27,     1,    20,     3,     1,    32,     3,    27,
      26,    27,    31,    20,    33,    40,    32,    71,   103,    26,
      27,   190,    80,   223,    40,    32,     1,    83,     3,     4,
       5,     6,     7,    40,    93,     1,    -1,     3,     4,     5,
       6,     7,    94,    -1,     1,    20,     3,     4,     5,     6,
       7,    26,    27,    -1,    20,    -1,    -1,    32,    -1,    -1,
      26,    27,    -1,    20,    -1,    40,    32,    -1,    -1,    26,
      27,    -1,    -1,    -1,    40,    32,     1,    -1,     3,     4,
       5,     6,     7,    40,    -1,     1,    -1,     3,     4,     5,
       6,     7,    -1,    -1,     1,    20,     3,     4,     5,     6,
       7,    26,    27,    -1,    20,    -1,    -1,    32,    -1,    -1,
      26,    27,    -1,    20,    -1,    40,    32,    -1,    -1,    26,
      27,    -1,    -1,    -1,    40,    32,     1,    -1,     3,     4,
       5,     6,     7,    40,    -1,     1,    -1,     3,     4,     5,
       6,     7,    -1,    -1,     1,    20,     3,     4,     5,     6,
       7,    26,    27,    -1,    20,    -1,    -1,    32,    -1,    -1,
      26,    27,    -1,    20,    -1,    40,    32,    -1,    -1,    26,
      27,    -1,    -1,    -1,    40,    32,     1,    -1,     3,     4,
       5,     6,     7,    40,     1,    -1,     3,     4,     5,     6,
       7,    -1,    -1,    -1,     1,    20,     3,     4,     5,     6,
       7,    26,    27,    20,    23,    -1,    -1,    32,    -1,    26,
      27,    30,    31,    20,    33,    32,    -1,    -1,    -1,    26,
      27,    -1,    -1,    -1,     1,    32,     3,     4,     5,     6,
       7,    -1,    -1,     8,     9,    10,    11,    12,    13,    14,
      -1,    -1,    -1,    20,    -1,    20,    -1,    -1,    -1,    26,
      27,    -1,    -1,    -1,    -1,    32,    31,     8,     9,    10,
      11,    12,    13,    14,    -1,    -1,    -1,    -1,    -1,    20,
       8,     9,    10,    11,    12,    13,    14,    -1,    -1,    -1,
      31,    -1,    20,    15,    16,    17,    18,    19,    -1,    -1,
      -1,    -1,    24,    25,    26
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     1,     3,    34,    35,    36,    54,    55,    56,    57,
      62,    63,     1,     3,    59,    60,    61,    20,     0,    56,
       1,     3,    59,    23,    30,    22,    31,    33,    30,     1,
      62,    64,    65,    66,    31,    20,    31,     1,     3,     4,
       5,     6,     7,    20,    26,    27,    32,    40,    82,    83,
      84,    85,    87,    89,    91,    92,    93,    94,    95,    96,
      99,     1,     5,     1,    60,    82,     1,     3,    67,    68,
      21,    31,     1,    64,    20,    20,    22,     1,    80,    82,
      94,     1,    84,    39,    38,    15,    16,    17,    18,    19,
      24,    25,    26,    86,    88,    27,    28,    29,    90,     1,
      91,    23,    22,    33,     1,    47,    74,     1,    66,    21,
       1,    80,    97,    98,    80,     8,     9,    10,    11,    12,
      13,    14,    81,    21,    13,    14,    81,     1,    83,     1,
      84,     1,    87,     1,    89,     1,    91,    23,     1,    68,
      75,    74,    21,    33,    23,    80,     1,    80,    37,    58,
      62,    76,     1,    80,    62,    59,     1,    31,    41,    44,
      45,    46,    48,    52,    69,    70,    71,    72,    73,    74,
      78,    79,    80,    59,    31,    31,     1,    82,     1,     3,
      31,     1,    31,    80,     1,    82,    31,    31,    42,    43,
      43,     8,    31,    31,    50,    50,    41,    44,    52,    70,
      70,    69,    70,     1,    77,    82,    70,    71,    70,    71,
       1,    82,     3,     1,    82,    42,    42,    50,    51,    50,
      49,    43,    43,     8,    50,    50,    70,    71,    70,    71,
      70,    71,     1,    70,    71,     1,    82,    70,    70,     1,
      77,    51,    42,    42,    50,    50,     1,    82
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    53,    54,    55,    55,    56,    56,    56,    57,    57,
      57,    58,    58,    59,    59,    59,    59,    60,    60,    60,
      61,    61,    61,    61,    62,    62,    62,    63,    63,    63,
      63,    63,    63,    64,    64,    65,    65,    65,    65,    66,
      66,    67,    67,    67,    67,    68,    68,    69,    69,    70,
      70,    70,    70,    70,    70,    70,    70,    70,    70,    70,
      71,    71,    71,    71,    71,    71,    71,    71,    72,    72,
      72,    72,    73,    73,    73,    74,    75,    75,    76,    76,
      77,    77,    77,    77,    77,    78,    78,    78,    79,    80,
      80,    80,    80,    80,    80,    80,    80,    81,    81,    81,
      81,    81,    82,    82,    82,    83,    83,    83,    84,    84,
      84,    85,    85,    85,    86,    86,    86,    86,    86,    86,
      87,    87,    87,    88,    88,    89,    89,    89,    90,    90,
      90,    91,    91,    91,    92,    92,    92,    93,    93,    94,
      94,    95,    95,    95,    95,    96,    96,    97,    97,    98,
      98,    98,    99,    99,    99,    99
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     3,     3,
       3,     4,     3,     3,     1,     3,     1,     1,     3,     3,
       1,     4,     3,     2,     1,     1,     1,     6,     5,     4,
       2,     5,     3,     1,     0,     3,     1,     3,     1,     2,
       2,     3,     1,     3,     1,     1,     3,     1,     1,     1,
       6,     4,     6,     6,     4,     2,     4,     2,     6,     2,
       6,     4,     6,     4,     6,     4,     6,     4,     1,     1,
       1,     1,     2,     1,     2,     4,     2,     0,     2,     0,
       3,     5,     3,     5,     3,     2,     3,     3,     2,     3,
       2,     2,     1,     3,     3,     2,     2,     1,     1,     1,
       1,     1,     3,     1,     3,     3,     1,     3,     2,     1,
       2,     3,     1,     3,     1,     1,     1,     1,     1,     1,
       3,     1,     3,     1,     1,     3,     1,     3,     1,     1,
       1,     2,     1,     2,     1,     1,     1,     1,     1,     1,
       4,     3,     1,     1,     2,     4,     2,     1,     0,     3,
       1,     3,     1,     1,     1,     1
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
#line 65 "parser.y"
                                                                { AST = (yyvsp[0].tree);}
#line 1655 "parser.tab.c"
    break;

  case 3:
#line 68 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 1661 "parser.tab.c"
    break;

  case 4:
#line 69 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1667 "parser.tab.c"
    break;

  case 5:
#line 72 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1673 "parser.tab.c"
    break;

  case 6:
#line 73 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1679 "parser.tab.c"
    break;

  case 7:
#line 74 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1685 "parser.tab.c"
    break;

  case 8:
#line 77 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  assignTyping((yyval.tree), (yyvsp[-2].type));
                                                                  yyerrok;
                                                                }
#line 1694 "parser.tab.c"
    break;

  case 9:
#line 81 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1702 "parser.tab.c"
    break;

  case 10:
#line 84 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1710 "parser.tab.c"
    break;

  case 11:
#line 89 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->isStatic = true; 
                                                                  assignTyping((yyval.tree), (yyvsp[-2].type));
                                                                  yyerrok; 
                                                                }
#line 1720 "parser.tab.c"
    break;

  case 12:
#line 94 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  assignTyping((yyval.tree), (yyvsp[-2].type));
                                                                  yyerrok;
                                                                }
#line 1729 "parser.tab.c"
    break;

  case 13:
#line 100 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree));
                                                                  yyerrok;
                                                                }
#line 1737 "parser.tab.c"
    break;

  case 14:
#line 103 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1743 "parser.tab.c"
    break;

  case 15:
#line 104 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1749 "parser.tab.c"
    break;

  case 16:
#line 105 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1755 "parser.tab.c"
    break;

  case 17:
#line 108 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1761 "parser.tab.c"
    break;

  case 18:
#line 109 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-2].tree); 
                                                                  if((yyvsp[-2].tree)){
                                                                    (yyval.tree)->child[0] = (yyvsp[0].tree);
                                                                  }
                                                                }
#line 1771 "parser.tab.c"
    break;

  case 19:
#line 114 "parser.y"
                                                                { (yyval.tree) = NULL; 
                                                                  yyerrok;
                                                                }
#line 1779 "parser.tab.c"
    break;

  case 20:
#line 119 "parser.y"
                                                                { (yyval.tree) = newDeclNode(VarK, (yyvsp[0].tokenData)); 
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                }
#line 1787 "parser.tab.c"
    break;

  case 21:
#line 122 "parser.y"
                                                                { (yyval.tree) = newDeclNode(VarK, (yyvsp[-3].tokenData));       // Ex: ID[NUMCONST]
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                  (yyval.tree)->isArray = true;
                                                                  (yyval.tree)->expType = UndefinedType;
                                                                }
#line 1797 "parser.tab.c"
    break;

  case 22:
#line 127 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1803 "parser.tab.c"
    break;

  case 23:
#line 128 "parser.y"
                                                                { (yyval.tree) = NULL; 
                                                                  yyerrok;
                                                                }
#line 1811 "parser.tab.c"
    break;

  case 24:
#line 133 "parser.y"
                                                                { (yyval.type) = Boolean; }
#line 1817 "parser.tab.c"
    break;

  case 25:
#line 134 "parser.y"
                                                                { (yyval.type) = Char; }
#line 1823 "parser.tab.c"
    break;

  case 26:
#line 135 "parser.y"
                                                                { (yyval.type) = Integer; }
#line 1829 "parser.tab.c"
    break;

  case 27:
#line 138 "parser.y"
                                                                { (yyval.tree) = newDeclNode(FuncK, (yyvsp[-4].tokenData));     // Ex: BOOL ID(params) compoundStmt
                                                                   (yyval.tree)->attr.name = (yyvsp[-4].tokenData)->tokeninput;
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                   (yyval.tree)->expType = (yyvsp[-5].type);
                                                                }
#line 1840 "parser.tab.c"
    break;

  case 28:
#line 144 "parser.y"
                                                                { (yyval.tree) = newDeclNode(FuncK, (yyvsp[-4].tokenData));     // Ex: ID(params) compoundStmt
                                                                   (yyval.tree)->attr.name = (yyvsp[-4].tokenData)->tokeninput;
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 1850 "parser.tab.c"
    break;

  case 29:
#line 149 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1856 "parser.tab.c"
    break;

  case 30:
#line 150 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1862 "parser.tab.c"
    break;

  case 31:
#line 151 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1868 "parser.tab.c"
    break;

  case 32:
#line 152 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1874 "parser.tab.c"
    break;

  case 33:
#line 155 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1880 "parser.tab.c"
    break;

  case 34:
#line 156 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1886 "parser.tab.c"
    break;

  case 35:
#line 159 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree)); }
#line 1892 "parser.tab.c"
    break;

  case 36:
#line 160 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1898 "parser.tab.c"
    break;

  case 37:
#line 161 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1904 "parser.tab.c"
    break;

  case 38:
#line 162 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1910 "parser.tab.c"
    break;

  case 39:
#line 165 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); 
                                                                  assignTyping((yyval.tree), (yyvsp[-1].type)); 
                                                                }
#line 1918 "parser.tab.c"
    break;

  case 40:
#line 168 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1924 "parser.tab.c"
    break;

  case 41:
#line 171 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree));
                                                                  yyerrok;
                                                                }
#line 1932 "parser.tab.c"
    break;

  case 42:
#line 174 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1938 "parser.tab.c"
    break;

  case 43:
#line 175 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1944 "parser.tab.c"
    break;

  case 44:
#line 176 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1950 "parser.tab.c"
    break;

  case 45:
#line 179 "parser.y"
                                                                { (yyval.tree) = newDeclNode(ParamK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput; 
                                                                  //$$->isInit = true;
                                                                }
#line 1959 "parser.tab.c"
    break;

  case 46:
#line 183 "parser.y"
                                                                { (yyval.tree) = newDeclNode(ParamK, (yyvsp[-2].tokenData));
                                                                  (yyval.tree)->isArray = true;
                                                                  //$$->isInit = true;
                                                                  (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput; 
                                                                }
#line 1969 "parser.tab.c"
    break;

  case 47:
#line 190 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1975 "parser.tab.c"
    break;

  case 48:
#line 191 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1981 "parser.tab.c"
    break;

  case 49:
#line 194 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1987 "parser.tab.c"
    break;

  case 50:
#line 195 "parser.y"
                                                                { (yyval.tree) = newStmtNode(IfK, (yyvsp[-5].tokenData)); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                }
#line 1997 "parser.tab.c"
    break;

  case 51:
#line 200 "parser.y"
                                                                { (yyval.tree) = newStmtNode(WhileK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                }
#line 2007 "parser.tab.c"
    break;

  case 52:
#line 205 "parser.y"
                                                                { (yyval.tree) = newStmtNode(ForK, (yyvsp[-5].tokenData));
                                                                  (yyval.tree)->child[0] = newDeclNode(VarK, (yyvsp[-4].tokenData));
                                                                  (yyval.tree)->child[0]->expType = Integer;
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree);   
                                                                }
#line 2019 "parser.tab.c"
    break;

  case 53:
#line 212 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2027 "parser.tab.c"
    break;

  case 54:
#line 215 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2035 "parser.tab.c"
    break;

  case 55:
#line 218 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2041 "parser.tab.c"
    break;

  case 56:
#line 219 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2049 "parser.tab.c"
    break;

  case 57:
#line 222 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2055 "parser.tab.c"
    break;

  case 58:
#line 223 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2063 "parser.tab.c"
    break;

  case 59:
#line 226 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2069 "parser.tab.c"
    break;

  case 60:
#line 229 "parser.y"
                                                                { (yyval.tree) = newStmtNode(IfK, (yyvsp[-5].tokenData)); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree); 
                                                                }
#line 2079 "parser.tab.c"
    break;

  case 61:
#line 234 "parser.y"
                                                                { (yyval.tree) = newStmtNode(WhileK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                }
#line 2089 "parser.tab.c"
    break;

  case 62:
#line 239 "parser.y"
                                                                { (yyval.tree) = newStmtNode(ForK, (yyvsp[-5].tokenData));
                                                                  (yyval.tree)->child[0] = newDeclNode(VarK, (yyvsp[-4].tokenData));
                                                                  (yyval.tree)->child[0]->expType = Integer;
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                }
#line 2101 "parser.tab.c"
    break;

  case 63:
#line 246 "parser.y"
                                                                { (yyval.tree) = newStmtNode(IfK, (yyvsp[-3].tokenData));              
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree); 
                                                                }
#line 2110 "parser.tab.c"
    break;

  case 64:
#line 250 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2118 "parser.tab.c"
    break;

  case 65:
#line 253 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2126 "parser.tab.c"
    break;

  case 66:
#line 256 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2134 "parser.tab.c"
    break;

  case 67:
#line 259 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2142 "parser.tab.c"
    break;

  case 68:
#line 264 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2148 "parser.tab.c"
    break;

  case 69:
#line 265 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2154 "parser.tab.c"
    break;

  case 70:
#line 266 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2160 "parser.tab.c"
    break;

  case 71:
#line 267 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2166 "parser.tab.c"
    break;

  case 72:
#line 270 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); }
#line 2172 "parser.tab.c"
    break;

  case 73:
#line 271 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2178 "parser.tab.c"
    break;

  case 74:
#line 272 "parser.y"
                                                                { (yyval.tree) = NULL; 
                                                                  yyerrok;
                                                                }
#line 2186 "parser.tab.c"
    break;

  case 75:
#line 277 "parser.y"
                                                                { (yyval.tree) = newStmtNode(CompoundK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[-1].tree);
                                                                  yyerrok;
                                                                }
#line 2196 "parser.tab.c"
    break;

  case 76:
#line 284 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 2202 "parser.tab.c"
    break;

  case 77:
#line 285 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2208 "parser.tab.c"
    break;

  case 78:
#line 288 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 2214 "parser.tab.c"
    break;

  case 79:
#line 289 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2220 "parser.tab.c"
    break;

  case 80:
#line 292 "parser.y"
                                                                { (yyval.tree) = newStmtNode(RangeK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2229 "parser.tab.c"
    break;

  case 81:
#line 296 "parser.y"
                                                                { (yyval.tree) = newStmtNode(RangeK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                }
#line 2239 "parser.tab.c"
    break;

  case 82:
#line 301 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2245 "parser.tab.c"
    break;

  case 83:
#line 302 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2251 "parser.tab.c"
    break;

  case 84:
#line 303 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2259 "parser.tab.c"
    break;

  case 85:
#line 308 "parser.y"
                                                                { (yyval.tree) = newStmtNode(ReturnK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                }
#line 2267 "parser.tab.c"
    break;

  case 86:
#line 311 "parser.y"
                                                                { (yyval.tree) = newStmtNode(ReturnK, (yyvsp[-2].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = (yyvsp[-1].tree)->expType;
                                                                  yyerrok;
                                                                }
#line 2278 "parser.tab.c"
    break;

  case 87:
#line 317 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2286 "parser.tab.c"
    break;

  case 88:
#line 322 "parser.y"
                                                                { (yyval.tree) = newStmtNode(BreakK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                }
#line 2294 "parser.tab.c"
    break;

  case 89:
#line 327 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2303 "parser.tab.c"
    break;

  case 90:
#line 331 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2313 "parser.tab.c"
    break;

  case 91:
#line 336 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2323 "parser.tab.c"
    break;

  case 92:
#line 341 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2329 "parser.tab.c"
    break;

  case 93:
#line 342 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2337 "parser.tab.c"
    break;

  case 94:
#line 345 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2343 "parser.tab.c"
    break;

  case 95:
#line 346 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2351 "parser.tab.c"
    break;

  case 96:
#line 349 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2359 "parser.tab.c"
    break;

  case 97:
#line 355 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2368 "parser.tab.c"
    break;

  case 98:
#line 359 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2377 "parser.tab.c"
    break;

  case 99:
#line 363 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2386 "parser.tab.c"
    break;

  case 100:
#line 367 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2395 "parser.tab.c"
    break;

  case 101:
#line 371 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2404 "parser.tab.c"
    break;

  case 102:
#line 377 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2415 "parser.tab.c"
    break;

  case 103:
#line 383 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2421 "parser.tab.c"
    break;

  case 104:
#line 384 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2427 "parser.tab.c"
    break;

  case 105:
#line 387 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2438 "parser.tab.c"
    break;

  case 106:
#line 393 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2444 "parser.tab.c"
    break;

  case 107:
#line 394 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2450 "parser.tab.c"
    break;

  case 108:
#line 397 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2460 "parser.tab.c"
    break;

  case 109:
#line 402 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2466 "parser.tab.c"
    break;

  case 110:
#line 403 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2472 "parser.tab.c"
    break;

  case 111:
#line 406 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2481 "parser.tab.c"
    break;

  case 112:
#line 410 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2487 "parser.tab.c"
    break;

  case 113:
#line 411 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2493 "parser.tab.c"
    break;

  case 114:
#line 414 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2502 "parser.tab.c"
    break;

  case 115:
#line 418 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2511 "parser.tab.c"
    break;

  case 116:
#line 422 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2520 "parser.tab.c"
    break;

  case 117:
#line 426 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2529 "parser.tab.c"
    break;

  case 118:
#line 430 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2538 "parser.tab.c"
    break;

  case 119:
#line 434 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2547 "parser.tab.c"
    break;

  case 120:
#line 440 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2556 "parser.tab.c"
    break;

  case 121:
#line 444 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2562 "parser.tab.c"
    break;

  case 122:
#line 445 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2568 "parser.tab.c"
    break;

  case 123:
#line 448 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2577 "parser.tab.c"
    break;

  case 124:
#line 452 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2586 "parser.tab.c"
    break;

  case 125:
#line 458 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2595 "parser.tab.c"
    break;

  case 126:
#line 462 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2601 "parser.tab.c"
    break;

  case 127:
#line 463 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2607 "parser.tab.c"
    break;

  case 128:
#line 466 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2616 "parser.tab.c"
    break;

  case 129:
#line 470 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2625 "parser.tab.c"
    break;

  case 130:
#line 474 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2634 "parser.tab.c"
    break;

  case 131:
#line 480 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[0].tree);
                                                                }
#line 2642 "parser.tab.c"
    break;

  case 132:
#line 483 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2648 "parser.tab.c"
    break;

  case 133:
#line 484 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2654 "parser.tab.c"
    break;

  case 134:
#line 487 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2663 "parser.tab.c"
    break;

  case 135:
#line 491 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2672 "parser.tab.c"
    break;

  case 136:
#line 495 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2681 "parser.tab.c"
    break;

  case 137:
#line 501 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2687 "parser.tab.c"
    break;

  case 138:
#line 502 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2693 "parser.tab.c"
    break;

  case 139:
#line 505 "parser.y"
                                                                { (yyval.tree) = newExpNode(IdK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;    
                                                                }
#line 2701 "parser.tab.c"
    break;

  case 140:
#line 508 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[-2].tokenData));  
                                                                 (yyval.tree)->child[0] = newExpNode(IdK, (yyvsp[-3].tokenData));
                                                                 (yyval.tree)->child[0]->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                 (yyval.tree)->child[0]->isArray = true;
                                                                 (yyval.tree)->child[1] = (yyvsp[-1].tree); 
                                                                 (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput;
                                                                }
#line 2713 "parser.tab.c"
    break;

  case 141:
#line 517 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  yyerrok;
                                                                }
#line 2721 "parser.tab.c"
    break;

  case 142:
#line 520 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2727 "parser.tab.c"
    break;

  case 143:
#line 521 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2733 "parser.tab.c"
    break;

  case 144:
#line 522 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2739 "parser.tab.c"
    break;

  case 145:
#line 525 "parser.y"
                                                                { (yyval.tree) = newExpNode(CallK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                }
#line 2748 "parser.tab.c"
    break;

  case 146:
#line 529 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2756 "parser.tab.c"
    break;

  case 147:
#line 534 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2762 "parser.tab.c"
    break;

  case 148:
#line 535 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2768 "parser.tab.c"
    break;

  case 149:
#line 538 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree)); }
#line 2774 "parser.tab.c"
    break;

  case 150:
#line 539 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2780 "parser.tab.c"
    break;

  case 151:
#line 540 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2786 "parser.tab.c"
    break;

  case 152:
#line 543 "parser.y"
                                                                { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.value = (yyvsp[0].tokenData)->nvalue; 
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2795 "parser.tab.c"
    break;

  case 153:
#line 547 "parser.y"
                                                                { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.cvalue = (yyvsp[0].tokenData)->cvalue; 
                                                                  (yyval.tree)->expType = Char;
                                                                }
#line 2804 "parser.tab.c"
    break;

  case 154:
#line 551 "parser.y"
                                                                { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.string = (yyvsp[0].tokenData)->svalue; 
                                                                  (yyval.tree)->expType = Char;
                                                                  (yyval.tree)->isArray = true;
                                                                }
#line 2814 "parser.tab.c"
    break;

  case 155:
#line 556 "parser.y"
                                                                { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.value = (yyvsp[0].tokenData)->nvalue; 
                                                                  (yyval.tree)->expType = Boolean;
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                }
#line 2824 "parser.tab.c"
    break;


#line 2828 "parser.tab.c"

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
#line 563 "parser.y"

extern int yydebug;

int main(int argc, char *argv[])
{
    int option;
    TreeNode *funcMainNode;
    initErrorProcessing();

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
              
              //NEED To FIX MAIN LINKER 
              
              // if main doesnt exist, print error
              if(funcMainNode){
                  if(funcMainNode->nodekind == DeclK && funcMainNode->subkind.decl != FuncK){
                      numErrors++;
                              
                      printf("ERROR(LINKER): A function named \'main\' with no parameters must be defined.\n");
                  }
                  else if(funcMainNode->child[0] && funcMainNode->child[0]->subkind.decl == ParamK){
                      numErrors++;
                              
                      printf("ERROR(LINKER): A function named \'main\' with no parameters must be defined.\n");
                  }
              }
              else{
                  numErrors++;
                              
                  printf("ERROR(LINKER): A function named \'main\' with no parameters must be defined.\n");
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
      printf("Number of warnings: %d\n", numWarnings);
      printf("Number of errors: %d\n", numErrors);
    }

    return 0;
}
