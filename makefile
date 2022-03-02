BIN = parser
CC = g++ -g
NAME = c-

SRCS = $(BIN).y $(BIN).l
HDRS = scanType.h treeNode.h semantics.h symbolTable.h
OBJS = lex.yy.o $(BIN).tab.o
DOCS = treeNode.c semantics.cpp symbolTable.cpp

$(BIN) : $(OBJS)
	$(CC) $(OBJS) $(DOCS) -o $(NAME)

lex.yy.c : $(BIN).l $(BIN).tab.h $(HDRS)
	flex $(BIN).l

$(BIN).tab.h $(BIN).tab.c : $(BIN).y
	bison -v -t -d $(BIN).y

clean :
	rm -f *~ $(OBJS) $(NAME) lex.yy.c $(BIN).tab.h $(BIN).tab.c $(BIN).output

tar : $(HDR) $(SRCS) makefile
	tar -cvf $(BIN).tar $(HDRS) $(SRCS) $(DOCS) makefile
