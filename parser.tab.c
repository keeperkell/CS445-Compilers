/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

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
#include "codegen.h"      // codegen

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
extern int goffset;      // global offset
bool W_TYPING; 

static TreeNode *AST;
SymbolTable st;

#define YYERROR_VERBOSE


#line 109 "parser.tab.c"

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

#include "parser.tab.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ID = 3,                         /* ID  */
  YYSYMBOL_BOOLCONST = 4,                  /* BOOLCONST  */
  YYSYMBOL_NUMCONST = 5,                   /* NUMCONST  */
  YYSYMBOL_CHARCONST = 6,                  /* CHARCONST  */
  YYSYMBOL_STRINGCONST = 7,                /* STRINGCONST  */
  YYSYMBOL_ASGN = 8,                       /* ASGN  */
  YYSYMBOL_ADDASGN = 9,                    /* ADDASGN  */
  YYSYMBOL_SUBASGN = 10,                   /* SUBASGN  */
  YYSYMBOL_MULASGN = 11,                   /* MULASGN  */
  YYSYMBOL_DIVASGN = 12,                   /* DIVASGN  */
  YYSYMBOL_INC = 13,                       /* INC  */
  YYSYMBOL_DEC = 14,                       /* DEC  */
  YYSYMBOL_GEQ = 15,                       /* GEQ  */
  YYSYMBOL_LEQ = 16,                       /* LEQ  */
  YYSYMBOL_NEQ = 17,                       /* NEQ  */
  YYSYMBOL_LESSTHAN = 18,                  /* LESSTHAN  */
  YYSYMBOL_GREATTHAN = 19,                 /* GREATTHAN  */
  YYSYMBOL_LPAREN = 20,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 21,                    /* RPAREN  */
  YYSYMBOL_LBRACKET = 22,                  /* LBRACKET  */
  YYSYMBOL_RBRACKET = 23,                  /* RBRACKET  */
  YYSYMBOL_PLUS = 24,                      /* PLUS  */
  YYSYMBOL_EQUAL = 25,                     /* EQUAL  */
  YYSYMBOL_MINUS = 26,                     /* MINUS  */
  YYSYMBOL_MULT = 27,                      /* MULT  */
  YYSYMBOL_DIV = 28,                       /* DIV  */
  YYSYMBOL_MOD = 29,                       /* MOD  */
  YYSYMBOL_COLON = 30,                     /* COLON  */
  YYSYMBOL_SEMICOLON = 31,                 /* SEMICOLON  */
  YYSYMBOL_QUESTION = 32,                  /* QUESTION  */
  YYSYMBOL_COMMA = 33,                     /* COMMA  */
  YYSYMBOL_INT = 34,                       /* INT  */
  YYSYMBOL_BOOL = 35,                      /* BOOL  */
  YYSYMBOL_CHAR = 36,                      /* CHAR  */
  YYSYMBOL_STATIC = 37,                    /* STATIC  */
  YYSYMBOL_AND = 38,                       /* AND  */
  YYSYMBOL_OR = 39,                        /* OR  */
  YYSYMBOL_NOT = 40,                       /* NOT  */
  YYSYMBOL_IF = 41,                        /* IF  */
  YYSYMBOL_ELSE = 42,                      /* ELSE  */
  YYSYMBOL_THEN = 43,                      /* THEN  */
  YYSYMBOL_FOR = 44,                       /* FOR  */
  YYSYMBOL_BREAK = 45,                     /* BREAK  */
  YYSYMBOL_RETURN = 46,                    /* RETURN  */
  YYSYMBOL_BEGN = 47,                      /* BEGN  */
  YYSYMBOL_FINISH = 48,                    /* FINISH  */
  YYSYMBOL_TO = 49,                        /* TO  */
  YYSYMBOL_DO = 50,                        /* DO  */
  YYSYMBOL_BY = 51,                        /* BY  */
  YYSYMBOL_WHILE = 52,                     /* WHILE  */
  YYSYMBOL_YYACCEPT = 53,                  /* $accept  */
  YYSYMBOL_program = 54,                   /* program  */
  YYSYMBOL_declList = 55,                  /* declList  */
  YYSYMBOL_decl = 56,                      /* decl  */
  YYSYMBOL_varDecl = 57,                   /* varDecl  */
  YYSYMBOL_scopedVarDecl = 58,             /* scopedVarDecl  */
  YYSYMBOL_varDeclList = 59,               /* varDeclList  */
  YYSYMBOL_varDeclInit = 60,               /* varDeclInit  */
  YYSYMBOL_varDeclId = 61,                 /* varDeclId  */
  YYSYMBOL_typeSpec = 62,                  /* typeSpec  */
  YYSYMBOL_funDecl = 63,                   /* funDecl  */
  YYSYMBOL_params = 64,                    /* params  */
  YYSYMBOL_paramList = 65,                 /* paramList  */
  YYSYMBOL_paramTypeList = 66,             /* paramTypeList  */
  YYSYMBOL_paramIdList = 67,               /* paramIdList  */
  YYSYMBOL_paramId = 68,                   /* paramId  */
  YYSYMBOL_stmt = 69,                      /* stmt  */
  YYSYMBOL_matched = 70,                   /* matched  */
  YYSYMBOL_unmatched = 71,                 /* unmatched  */
  YYSYMBOL_stmtEnd = 72,                   /* stmtEnd  */
  YYSYMBOL_expStmt = 73,                   /* expStmt  */
  YYSYMBOL_compoundStmt = 74,              /* compoundStmt  */
  YYSYMBOL_localDecls = 75,                /* localDecls  */
  YYSYMBOL_stmtList = 76,                  /* stmtList  */
  YYSYMBOL_iterRange = 77,                 /* iterRange  */
  YYSYMBOL_returnStmt = 78,                /* returnStmt  */
  YYSYMBOL_breakStmt = 79,                 /* breakStmt  */
  YYSYMBOL_exp = 80,                       /* exp  */
  YYSYMBOL_assignop = 81,                  /* assignop  */
  YYSYMBOL_simpleExp = 82,                 /* simpleExp  */
  YYSYMBOL_andExp = 83,                    /* andExp  */
  YYSYMBOL_unaryRelExp = 84,               /* unaryRelExp  */
  YYSYMBOL_relExp = 85,                    /* relExp  */
  YYSYMBOL_relop = 86,                     /* relop  */
  YYSYMBOL_sumExp = 87,                    /* sumExp  */
  YYSYMBOL_sumop = 88,                     /* sumop  */
  YYSYMBOL_mulExp = 89,                    /* mulExp  */
  YYSYMBOL_mulop = 90,                     /* mulop  */
  YYSYMBOL_unaryExp = 91,                  /* unaryExp  */
  YYSYMBOL_unaryop = 92,                   /* unaryop  */
  YYSYMBOL_factor = 93,                    /* factor  */
  YYSYMBOL_mutable = 94,                   /* mutable  */
  YYSYMBOL_immutable = 95,                 /* immutable  */
  YYSYMBOL_call = 96,                      /* call  */
  YYSYMBOL_args = 97,                      /* args  */
  YYSYMBOL_argList = 98,                   /* argList  */
  YYSYMBOL_constant = 99                   /* constant  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




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

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
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
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
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

#if !defined yyoverflow

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
#endif /* !defined yyoverflow */

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

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   307


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

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
       0,    67,    67,    70,    71,    74,    75,    76,    79,    83,
      86,    91,    96,   102,   105,   106,   107,   110,   111,   116,
     121,   124,   130,   131,   136,   137,   138,   141,   147,   152,
     153,   154,   155,   158,   159,   162,   163,   164,   165,   168,
     171,   174,   177,   178,   179,   182,   186,   193,   194,   197,
     198,   203,   208,   215,   218,   221,   222,   225,   226,   229,
     232,   237,   242,   249,   253,   256,   259,   262,   267,   268,
     269,   270,   273,   274,   275,   280,   287,   288,   291,   292,
     295,   299,   304,   305,   306,   311,   314,   320,   325,   330,
     334,   339,   344,   345,   348,   349,   352,   358,   362,   366,
     370,   374,   380,   386,   387,   390,   396,   397,   400,   405,
     406,   409,   413,   414,   417,   421,   425,   429,   433,   437,
     443,   447,   448,   451,   455,   461,   465,   466,   469,   473,
     477,   483,   486,   487,   490,   494,   498,   504,   505,   508,
     511,   520,   523,   524,   525,   528,   532,   537,   538,   541,
     542,   543,   546,   551,   556,   563
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ID", "BOOLCONST",
  "NUMCONST", "CHARCONST", "STRINGCONST", "ASGN", "ADDASGN", "SUBASGN",
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

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

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
static const yytype_uint8 yydefgoto[] =
{
       0,     6,     7,     8,     9,   149,    14,    15,    16,    30,
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

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
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

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
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

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
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


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


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

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


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




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
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
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
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
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
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
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
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






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
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
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

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
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
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
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
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

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
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
  case 2: /* program: declList  */
#line 67 "parser.y"
                                                                { AST = (yyvsp[0].tree);}
#line 1453 "parser.tab.c"
    break;

  case 3: /* declList: declList decl  */
#line 70 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 1459 "parser.tab.c"
    break;

  case 4: /* declList: decl  */
#line 71 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1465 "parser.tab.c"
    break;

  case 5: /* decl: varDecl  */
#line 74 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1471 "parser.tab.c"
    break;

  case 6: /* decl: funDecl  */
#line 75 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1477 "parser.tab.c"
    break;

  case 7: /* decl: error  */
#line 76 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1483 "parser.tab.c"
    break;

  case 8: /* varDecl: typeSpec varDeclList SEMICOLON  */
#line 79 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  assignTyping((yyval.tree), (yyvsp[-2].type));
                                                                  yyerrok;
                                                                }
#line 1492 "parser.tab.c"
    break;

  case 9: /* varDecl: error varDeclList SEMICOLON  */
#line 83 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1500 "parser.tab.c"
    break;

  case 10: /* varDecl: typeSpec error SEMICOLON  */
#line 86 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1508 "parser.tab.c"
    break;

  case 11: /* scopedVarDecl: STATIC typeSpec varDeclList SEMICOLON  */
#line 91 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->isStatic = true; 
                                                                  assignTyping((yyval.tree), (yyvsp[-2].type));
                                                                  yyerrok; 
                                                                }
#line 1518 "parser.tab.c"
    break;

  case 12: /* scopedVarDecl: typeSpec varDeclList SEMICOLON  */
#line 96 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  assignTyping((yyval.tree), (yyvsp[-2].type));
                                                                  yyerrok;
                                                                }
#line 1527 "parser.tab.c"
    break;

  case 13: /* varDeclList: varDeclList COMMA varDeclInit  */
#line 102 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree));
                                                                  yyerrok;
                                                                }
#line 1535 "parser.tab.c"
    break;

  case 14: /* varDeclList: varDeclInit  */
#line 105 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1541 "parser.tab.c"
    break;

  case 15: /* varDeclList: varDeclList COMMA error  */
#line 106 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1547 "parser.tab.c"
    break;

  case 16: /* varDeclList: error  */
#line 107 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1553 "parser.tab.c"
    break;

  case 17: /* varDeclInit: varDeclId  */
#line 110 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1559 "parser.tab.c"
    break;

  case 18: /* varDeclInit: varDeclId COLON simpleExp  */
#line 111 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-2].tree); 
                                                                  if((yyvsp[-2].tree)){
                                                                    (yyval.tree)->child[0] = (yyvsp[0].tree);
                                                                  }
                                                                }
#line 1569 "parser.tab.c"
    break;

  case 19: /* varDeclInit: error COLON simpleExp  */
#line 116 "parser.y"
                                                                { (yyval.tree) = NULL; 
                                                                  yyerrok;
                                                                }
#line 1577 "parser.tab.c"
    break;

  case 20: /* varDeclId: ID  */
#line 121 "parser.y"
                                                                { (yyval.tree) = newDeclNode(VarK, (yyvsp[0].tokenData)); 
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                }
#line 1585 "parser.tab.c"
    break;

  case 21: /* varDeclId: ID LBRACKET NUMCONST RBRACKET  */
#line 124 "parser.y"
                                                                { (yyval.tree) = newDeclNode(VarK, (yyvsp[-3].tokenData));       // Ex: ID[NUMCONST]
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                  (yyval.tree)->isArray = true;
                                                                  (yyval.tree)->expType = UndefinedType;
                                                                  (yyval.tree)->memSize = (yyvsp[-1].tokenData)->nvalue +1;  // ID[NUMCONST] NUMCONST+1 is num of items in array + 1 to hold size
                                                                }
#line 1596 "parser.tab.c"
    break;

  case 22: /* varDeclId: ID LBRACKET error  */
#line 130 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1602 "parser.tab.c"
    break;

  case 23: /* varDeclId: error RBRACKET  */
#line 131 "parser.y"
                                                                { (yyval.tree) = NULL; 
                                                                  yyerrok;
                                                                }
#line 1610 "parser.tab.c"
    break;

  case 24: /* typeSpec: BOOL  */
#line 136 "parser.y"
                                                                { (yyval.type) = Boolean; }
#line 1616 "parser.tab.c"
    break;

  case 25: /* typeSpec: CHAR  */
#line 137 "parser.y"
                                                                { (yyval.type) = Char; }
#line 1622 "parser.tab.c"
    break;

  case 26: /* typeSpec: INT  */
#line 138 "parser.y"
                                                                { (yyval.type) = Integer; }
#line 1628 "parser.tab.c"
    break;

  case 27: /* funDecl: typeSpec ID LPAREN params RPAREN compoundStmt  */
#line 141 "parser.y"
                                                                { (yyval.tree) = newDeclNode(FuncK, (yyvsp[-4].tokenData));     // Ex: BOOL ID(params) compoundStmt
                                                                   (yyval.tree)->attr.name = (yyvsp[-4].tokenData)->tokeninput;
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                   (yyval.tree)->expType = (yyvsp[-5].type);
                                                                }
#line 1639 "parser.tab.c"
    break;

  case 28: /* funDecl: ID LPAREN params RPAREN compoundStmt  */
#line 147 "parser.y"
                                                                { (yyval.tree) = newDeclNode(FuncK, (yyvsp[-4].tokenData));     // Ex: ID(params) compoundStmt
                                                                   (yyval.tree)->attr.name = (yyvsp[-4].tokenData)->tokeninput;
                                                                   (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                   (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 1649 "parser.tab.c"
    break;

  case 29: /* funDecl: typeSpec ID LPAREN error  */
#line 152 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1655 "parser.tab.c"
    break;

  case 30: /* funDecl: typeSpec error  */
#line 153 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1661 "parser.tab.c"
    break;

  case 31: /* funDecl: ID LPAREN params RPAREN error  */
#line 154 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1667 "parser.tab.c"
    break;

  case 32: /* funDecl: ID LPAREN error  */
#line 155 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1673 "parser.tab.c"
    break;

  case 33: /* params: paramList  */
#line 158 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1679 "parser.tab.c"
    break;

  case 34: /* params: %empty  */
#line 159 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1685 "parser.tab.c"
    break;

  case 35: /* paramList: paramList SEMICOLON paramTypeList  */
#line 162 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree)); }
#line 1691 "parser.tab.c"
    break;

  case 36: /* paramList: paramTypeList  */
#line 163 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1697 "parser.tab.c"
    break;

  case 37: /* paramList: paramList SEMICOLON error  */
#line 164 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1703 "parser.tab.c"
    break;

  case 38: /* paramList: error  */
#line 165 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1709 "parser.tab.c"
    break;

  case 39: /* paramTypeList: typeSpec paramIdList  */
#line 168 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); 
                                                                  assignTyping((yyval.tree), (yyvsp[-1].type)); 
                                                                }
#line 1717 "parser.tab.c"
    break;

  case 40: /* paramTypeList: typeSpec error  */
#line 171 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1723 "parser.tab.c"
    break;

  case 41: /* paramIdList: paramIdList COMMA paramId  */
#line 174 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree));
                                                                  yyerrok;
                                                                }
#line 1731 "parser.tab.c"
    break;

  case 42: /* paramIdList: paramId  */
#line 177 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1737 "parser.tab.c"
    break;

  case 43: /* paramIdList: paramIdList COMMA error  */
#line 178 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1743 "parser.tab.c"
    break;

  case 44: /* paramIdList: error  */
#line 179 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1749 "parser.tab.c"
    break;

  case 45: /* paramId: ID  */
#line 182 "parser.y"
                                                                { (yyval.tree) = newDeclNode(ParamK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput; 
                                                                  //$$->isInit = true;
                                                                }
#line 1758 "parser.tab.c"
    break;

  case 46: /* paramId: ID LBRACKET RBRACKET  */
#line 186 "parser.y"
                                                                { (yyval.tree) = newDeclNode(ParamK, (yyvsp[-2].tokenData));
                                                                  (yyval.tree)->isArray = true;
                                                                  //$$->isInit = true;
                                                                  (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput; 
                                                                }
#line 1768 "parser.tab.c"
    break;

  case 47: /* stmt: matched  */
#line 193 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1774 "parser.tab.c"
    break;

  case 48: /* stmt: unmatched  */
#line 194 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1780 "parser.tab.c"
    break;

  case 49: /* matched: stmtEnd  */
#line 197 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1786 "parser.tab.c"
    break;

  case 50: /* matched: IF simpleExp THEN matched ELSE matched  */
#line 198 "parser.y"
                                                                { (yyval.tree) = newStmtNode(IfK, (yyvsp[-5].tokenData)); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                }
#line 1796 "parser.tab.c"
    break;

  case 51: /* matched: WHILE simpleExp DO matched  */
#line 203 "parser.y"
                                                                { (yyval.tree) = newStmtNode(WhileK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                }
#line 1806 "parser.tab.c"
    break;

  case 52: /* matched: FOR ID ASGN iterRange DO matched  */
#line 208 "parser.y"
                                                                { (yyval.tree) = newStmtNode(ForK, (yyvsp[-5].tokenData));
                                                                  (yyval.tree)->child[0] = newDeclNode(VarK, (yyvsp[-4].tokenData));
                                                                  (yyval.tree)->child[0]->expType = Integer;
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree);   
                                                                }
#line 1818 "parser.tab.c"
    break;

  case 53: /* matched: IF error THEN matched ELSE matched  */
#line 215 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1826 "parser.tab.c"
    break;

  case 54: /* matched: IF error ELSE matched  */
#line 218 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1834 "parser.tab.c"
    break;

  case 55: /* matched: IF error  */
#line 221 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1840 "parser.tab.c"
    break;

  case 56: /* matched: WHILE error DO matched  */
#line 222 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1848 "parser.tab.c"
    break;

  case 57: /* matched: WHILE error  */
#line 225 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1854 "parser.tab.c"
    break;

  case 58: /* matched: FOR ID ASGN error DO matched  */
#line 226 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1862 "parser.tab.c"
    break;

  case 59: /* matched: FOR error  */
#line 229 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1868 "parser.tab.c"
    break;

  case 60: /* unmatched: IF simpleExp THEN matched ELSE unmatched  */
#line 232 "parser.y"
                                                                { (yyval.tree) = newStmtNode(IfK, (yyvsp[-5].tokenData)); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree); 
                                                                }
#line 1878 "parser.tab.c"
    break;

  case 61: /* unmatched: WHILE simpleExp DO unmatched  */
#line 237 "parser.y"
                                                                { (yyval.tree) = newStmtNode(WhileK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                }
#line 1888 "parser.tab.c"
    break;

  case 62: /* unmatched: FOR ID ASGN iterRange DO unmatched  */
#line 242 "parser.y"
                                                                { (yyval.tree) = newStmtNode(ForK, (yyvsp[-5].tokenData));
                                                                  (yyval.tree)->child[0] = newDeclNode(VarK, (yyvsp[-4].tokenData));
                                                                  (yyval.tree)->child[0]->expType = Integer;
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                }
#line 1900 "parser.tab.c"
    break;

  case 63: /* unmatched: IF simpleExp THEN stmt  */
#line 249 "parser.y"
                                                                { (yyval.tree) = newStmtNode(IfK, (yyvsp[-3].tokenData));              
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree); 
                                                                }
#line 1909 "parser.tab.c"
    break;

  case 64: /* unmatched: IF error THEN matched ELSE unmatched  */
#line 253 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1917 "parser.tab.c"
    break;

  case 65: /* unmatched: WHILE error DO unmatched  */
#line 256 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1925 "parser.tab.c"
    break;

  case 66: /* unmatched: FOR ID ASGN error DO unmatched  */
#line 259 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1933 "parser.tab.c"
    break;

  case 67: /* unmatched: IF error THEN matched  */
#line 262 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 1941 "parser.tab.c"
    break;

  case 68: /* stmtEnd: expStmt  */
#line 267 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1947 "parser.tab.c"
    break;

  case 69: /* stmtEnd: compoundStmt  */
#line 268 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1953 "parser.tab.c"
    break;

  case 70: /* stmtEnd: returnStmt  */
#line 269 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1959 "parser.tab.c"
    break;

  case 71: /* stmtEnd: breakStmt  */
#line 270 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 1965 "parser.tab.c"
    break;

  case 72: /* expStmt: exp SEMICOLON  */
#line 273 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); }
#line 1971 "parser.tab.c"
    break;

  case 73: /* expStmt: SEMICOLON  */
#line 274 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 1977 "parser.tab.c"
    break;

  case 74: /* expStmt: error SEMICOLON  */
#line 275 "parser.y"
                                                                { (yyval.tree) = NULL; 
                                                                  yyerrok;
                                                                }
#line 1985 "parser.tab.c"
    break;

  case 75: /* compoundStmt: BEGN localDecls stmtList FINISH  */
#line 280 "parser.y"
                                                                { (yyval.tree) = newStmtNode(CompoundK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[-1].tree);
                                                                  yyerrok;
                                                                }
#line 1995 "parser.tab.c"
    break;

  case 76: /* localDecls: localDecls scopedVarDecl  */
#line 287 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 2001 "parser.tab.c"
    break;

  case 77: /* localDecls: %empty  */
#line 288 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2007 "parser.tab.c"
    break;

  case 78: /* stmtList: stmtList stmt  */
#line 291 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-1].tree), (yyvsp[0].tree)); }
#line 2013 "parser.tab.c"
    break;

  case 79: /* stmtList: %empty  */
#line 292 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2019 "parser.tab.c"
    break;

  case 80: /* iterRange: simpleExp TO simpleExp  */
#line 295 "parser.y"
                                                                { (yyval.tree) = newStmtNode(RangeK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2028 "parser.tab.c"
    break;

  case 81: /* iterRange: simpleExp TO simpleExp BY simpleExp  */
#line 299 "parser.y"
                                                                { (yyval.tree) = newStmtNode(RangeK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-4].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[2] = (yyvsp[0].tree);
                                                                }
#line 2038 "parser.tab.c"
    break;

  case 82: /* iterRange: simpleExp TO error  */
#line 304 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2044 "parser.tab.c"
    break;

  case 83: /* iterRange: simpleExp TO simpleExp BY error  */
#line 305 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2050 "parser.tab.c"
    break;

  case 84: /* iterRange: error BY error  */
#line 306 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2058 "parser.tab.c"
    break;

  case 85: /* returnStmt: RETURN SEMICOLON  */
#line 311 "parser.y"
                                                                { (yyval.tree) = newStmtNode(ReturnK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                }
#line 2066 "parser.tab.c"
    break;

  case 86: /* returnStmt: RETURN exp SEMICOLON  */
#line 314 "parser.y"
                                                                { (yyval.tree) = newStmtNode(ReturnK, (yyvsp[-2].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = (yyvsp[-1].tree)->expType;
                                                                  yyerrok;
                                                                }
#line 2077 "parser.tab.c"
    break;

  case 87: /* returnStmt: RETURN error SEMICOLON  */
#line 320 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2085 "parser.tab.c"
    break;

  case 88: /* breakStmt: BREAK SEMICOLON  */
#line 325 "parser.y"
                                                                { (yyval.tree) = newStmtNode(BreakK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                }
#line 2093 "parser.tab.c"
    break;

  case 89: /* exp: mutable assignop exp  */
#line 330 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2102 "parser.tab.c"
    break;

  case 90: /* exp: mutable INC  */
#line 334 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2112 "parser.tab.c"
    break;

  case 91: /* exp: mutable DEC  */
#line 339 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2122 "parser.tab.c"
    break;

  case 92: /* exp: simpleExp  */
#line 344 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2128 "parser.tab.c"
    break;

  case 93: /* exp: error assignop exp  */
#line 345 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2136 "parser.tab.c"
    break;

  case 94: /* exp: mutable assignop error  */
#line 348 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2142 "parser.tab.c"
    break;

  case 95: /* exp: error INC  */
#line 349 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2150 "parser.tab.c"
    break;

  case 96: /* exp: error DEC  */
#line 352 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2158 "parser.tab.c"
    break;

  case 97: /* assignop: ASGN  */
#line 358 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2167 "parser.tab.c"
    break;

  case 98: /* assignop: ADDASGN  */
#line 362 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2176 "parser.tab.c"
    break;

  case 99: /* assignop: SUBASGN  */
#line 366 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2185 "parser.tab.c"
    break;

  case 100: /* assignop: MULASGN  */
#line 370 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2194 "parser.tab.c"
    break;

  case 101: /* assignop: DIVASGN  */
#line 374 "parser.y"
                                                                { (yyval.tree) = newExpNode(AssignK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2203 "parser.tab.c"
    break;

  case 102: /* simpleExp: simpleExp OR andExp  */
#line 380 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2214 "parser.tab.c"
    break;

  case 103: /* simpleExp: andExp  */
#line 386 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2220 "parser.tab.c"
    break;

  case 104: /* simpleExp: simpleExp OR error  */
#line 387 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2226 "parser.tab.c"
    break;

  case 105: /* andExp: andExp AND unaryRelExp  */
#line 390 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2237 "parser.tab.c"
    break;

  case 106: /* andExp: unaryRelExp  */
#line 396 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2243 "parser.tab.c"
    break;

  case 107: /* andExp: andExp AND error  */
#line 397 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2249 "parser.tab.c"
    break;

  case 108: /* unaryRelExp: NOT unaryRelExp  */
#line 400 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[-1].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[0].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-1].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2259 "parser.tab.c"
    break;

  case 109: /* unaryRelExp: relExp  */
#line 405 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2265 "parser.tab.c"
    break;

  case 110: /* unaryRelExp: NOT error  */
#line 406 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2271 "parser.tab.c"
    break;

  case 111: /* relExp: sumExp relop sumExp  */
#line 409 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2280 "parser.tab.c"
    break;

  case 112: /* relExp: sumExp  */
#line 413 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2286 "parser.tab.c"
    break;

  case 113: /* relExp: sumExp relop error  */
#line 414 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2292 "parser.tab.c"
    break;

  case 114: /* relop: LESSTHAN  */
#line 417 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2301 "parser.tab.c"
    break;

  case 115: /* relop: LEQ  */
#line 421 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2310 "parser.tab.c"
    break;

  case 116: /* relop: GREATTHAN  */
#line 425 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2319 "parser.tab.c"
    break;

  case 117: /* relop: GEQ  */
#line 429 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2328 "parser.tab.c"
    break;

  case 118: /* relop: EQUAL  */
#line 433 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2337 "parser.tab.c"
    break;

  case 119: /* relop: NEQ  */
#line 437 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Boolean;
                                                                }
#line 2346 "parser.tab.c"
    break;

  case 120: /* sumExp: sumExp sumop mulExp  */
#line 443 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2355 "parser.tab.c"
    break;

  case 121: /* sumExp: mulExp  */
#line 447 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2361 "parser.tab.c"
    break;

  case 122: /* sumExp: sumExp sumop error  */
#line 448 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2367 "parser.tab.c"
    break;

  case 123: /* sumop: PLUS  */
#line 451 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2376 "parser.tab.c"
    break;

  case 124: /* sumop: MINUS  */
#line 455 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2385 "parser.tab.c"
    break;

  case 125: /* mulExp: mulExp mulop unaryExp  */
#line 461 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[-2].tree);
                                                                  (yyval.tree)->child[1] = (yyvsp[0].tree);
                                                                }
#line 2394 "parser.tab.c"
    break;

  case 126: /* mulExp: unaryExp  */
#line 465 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2400 "parser.tab.c"
    break;

  case 127: /* mulExp: mulExp mulop error  */
#line 466 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2406 "parser.tab.c"
    break;

  case 128: /* mulop: MULT  */
#line 469 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2415 "parser.tab.c"
    break;

  case 129: /* mulop: DIV  */
#line 473 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2424 "parser.tab.c"
    break;

  case 130: /* mulop: MOD  */
#line 477 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2433 "parser.tab.c"
    break;

  case 131: /* unaryExp: unaryop unaryExp  */
#line 483 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  (yyval.tree)->child[0] = (yyvsp[0].tree);
                                                                }
#line 2441 "parser.tab.c"
    break;

  case 132: /* unaryExp: factor  */
#line 486 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2447 "parser.tab.c"
    break;

  case 133: /* unaryExp: unaryop error  */
#line 487 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2453 "parser.tab.c"
    break;

  case 134: /* unaryop: MINUS  */
#line 490 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2462 "parser.tab.c"
    break;

  case 135: /* unaryop: MULT  */
#line 494 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2471 "parser.tab.c"
    break;

  case 136: /* unaryop: QUESTION  */
#line 498 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;
                                                                  (yyval.tree)->expType = Integer;
                                                                }
#line 2480 "parser.tab.c"
    break;

  case 137: /* factor: mutable  */
#line 504 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2486 "parser.tab.c"
    break;

  case 138: /* factor: immutable  */
#line 505 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2492 "parser.tab.c"
    break;

  case 139: /* mutable: ID  */
#line 508 "parser.y"
                                                                { (yyval.tree) = newExpNode(IdK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.name = (yyvsp[0].tokenData)->tokeninput;    
                                                                }
#line 2500 "parser.tab.c"
    break;

  case 140: /* mutable: ID LBRACKET exp RBRACKET  */
#line 511 "parser.y"
                                                                { (yyval.tree) = newExpNode(OpK, (yyvsp[-2].tokenData));  
                                                                 (yyval.tree)->child[0] = newExpNode(IdK, (yyvsp[-3].tokenData));
                                                                 (yyval.tree)->child[0]->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                 (yyval.tree)->child[0]->isArray = true;
                                                                 (yyval.tree)->child[1] = (yyvsp[-1].tree); 
                                                                 (yyval.tree)->attr.name = (yyvsp[-2].tokenData)->tokeninput;
                                                                }
#line 2512 "parser.tab.c"
    break;

  case 141: /* immutable: LPAREN exp RPAREN  */
#line 520 "parser.y"
                                                                { (yyval.tree) = (yyvsp[-1].tree); 
                                                                  yyerrok;
                                                                }
#line 2520 "parser.tab.c"
    break;

  case 142: /* immutable: call  */
#line 523 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2526 "parser.tab.c"
    break;

  case 143: /* immutable: constant  */
#line 524 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2532 "parser.tab.c"
    break;

  case 144: /* immutable: LPAREN error  */
#line 525 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2538 "parser.tab.c"
    break;

  case 145: /* call: ID LPAREN args RPAREN  */
#line 528 "parser.y"
                                                                { (yyval.tree) = newExpNode(CallK, (yyvsp[-3].tokenData));
                                                                  (yyval.tree)->child[0] = (yyvsp[-1].tree);
                                                                  (yyval.tree)->attr.name = (yyvsp[-3].tokenData)->tokeninput;
                                                                }
#line 2547 "parser.tab.c"
    break;

  case 146: /* call: error LPAREN  */
#line 532 "parser.y"
                                                                { (yyval.tree) = NULL;
                                                                  yyerrok;
                                                                }
#line 2555 "parser.tab.c"
    break;

  case 147: /* args: argList  */
#line 537 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2561 "parser.tab.c"
    break;

  case 148: /* args: %empty  */
#line 538 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2567 "parser.tab.c"
    break;

  case 149: /* argList: argList COMMA exp  */
#line 541 "parser.y"
                                                                { (yyval.tree) = addSibling((yyvsp[-2].tree), (yyvsp[0].tree)); }
#line 2573 "parser.tab.c"
    break;

  case 150: /* argList: exp  */
#line 542 "parser.y"
                                                                { (yyval.tree) = (yyvsp[0].tree); }
#line 2579 "parser.tab.c"
    break;

  case 151: /* argList: argList COMMA error  */
#line 543 "parser.y"
                                                                { (yyval.tree) = NULL; }
#line 2585 "parser.tab.c"
    break;

  case 152: /* constant: NUMCONST  */
#line 546 "parser.y"
                                                                { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.value = (yyvsp[0].tokenData)->nvalue; 
                                                                  (yyval.tree)->expType = Integer;
                                                                  (yyval.tree)->memSize = 1;
                                                                }
#line 2595 "parser.tab.c"
    break;

  case 153: /* constant: CHARCONST  */
#line 551 "parser.y"
                                                                { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.cvalue = (yyvsp[0].tokenData)->cvalue; 
                                                                  (yyval.tree)->expType = Char;
                                                                  (yyval.tree)->memSize = 1;
                                                                }
#line 2605 "parser.tab.c"
    break;

  case 154: /* constant: STRINGCONST  */
#line 556 "parser.y"
                                                                { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.string = (yyvsp[0].tokenData)->svalue; 
                                                                  (yyval.tree)->expType = Char;
                                                                  (yyval.tree)->isArray = true;
                                                                  (yyval.tree)->memSize = (yyvsp[0].tokenData)->strlength + 1;

                                                                }
#line 2617 "parser.tab.c"
    break;

  case 155: /* constant: BOOLCONST  */
#line 563 "parser.y"
                                                                { (yyval.tree) = newExpNode(ConstantK, (yyvsp[0].tokenData));
                                                                  (yyval.tree)->attr.value = (yyvsp[0].tokenData)->nvalue; 
                                                                  (yyval.tree)->expType = Boolean;
                                                                  //$$->attr.name = $1->tokeninput;
                                                                  (yyval.tree)->memSize = 1;
                                                                }
#line 2628 "parser.tab.c"
    break;


#line 2632 "parser.tab.c"

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
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

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
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
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
  ++yynerrs;

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

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
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
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
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
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 571 "parser.y"

extern int yydebug;

int main(int argc, char *argv[])
{
    int option;
    TreeNode *funcMainNode;
    initErrorProcessing();

    // get CLI option when program is run
    if((option = getopt(argc, argv, "dDhMpP")) != -1){

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
            printf("-M          - print the abstract syntax tree with memory locations\n");
            printf("-p          - print the abstract syntax tree\n");
            printf("-P          - print the abstract syntax tree plus type information\n");     
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
              printTree(AST, W_TYPING, 0, false);
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
              
              // if no errors, print tree with memory flag set to false
              if(!numErrors){
                W_TYPING = true;
                printTree(AST, W_TYPING, 0, false);
              }
              
              break;
            case 'M':
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
              
              // if no errors, print tree with memory flag set to true
              if(!numErrors){
                W_TYPING = true;
                printTree(AST, W_TYPING, 0, true);
                printf("Offset for end of global space: %d\n", goffset);
              }
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

      //do codegen here???
      IOconstructor();
      semanticAnalysis(AST);
      if(numErrors == 0){
        
        

        char *fileName;
        int numArgs = argc;
        
        char *out = argv[numArgs-1];
        int fileLen = strlen(out);
        fileName = (char *)malloc(fileLen + 1);
        strcpy(fileName, out);
        fileName[fileLen - 2] = 't';
        fileName[fileLen - 1] = 'm';

        codeGen(fileName, AST);
        printf("Number of warnings: %d\n", numWarnings);
        printf("Number of errors: %d\n", numErrors);
      }
    }

    return 0;
}
