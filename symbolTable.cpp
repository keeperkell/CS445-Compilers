// // // // // // // // // // // // // // // // // // // // // // // 
// CS445 - symbolTable.cpp  
//
// Keller Lawson
// 
// Last Updated
// Feb 19, 2022   

#include "symbolTable.h"
#include "parser.tab.h"
#include "semantics.h"

extern int numWarnings;
// // // // // // // // // // // // // // // // // // // // 
//
// Introduction
//
// This symbol table library supplies basic insert and lookup for
// symbols linked to void * pointers of data. The is expected to use
// ONLY the SymbolTable class and NOT the Scope class. The Scope class
// is used by SymbolTable in its implementation.
//
// Plenty of room for improvement inlcuding: better debugging setup,
// passing of refs rather than values and purpose built char *
// routines, and C support.
//
// WARNING: lookup will return NULL pointer if key is not in table.
// This means the void * cannot have zero as a legal value! Attempting
// to save a NULL pointer will get a error.
//
// A main() is commented out and has testing code in it.
//
// Robert Heckendorn   Apr 3, 2021
//



// // // // // // // // // // // // // // // // // // // //
//
// Class: Scope
//
// Helper class for SymbolTable
//

class SymbolTable::Scope {
private:
    static bool debugFlg;                      // turn on tedious debugging
    std::string name;                          // name of scope
    std::map<std::string , void *> symbols;    // use an ordered map (not as fast as unordered)

public:
    Scope(std::string newname);
    ~Scope();
    std::string scopeName();                   // returns name of scope
    void debug(bool state);                    // sets the debug flag to state
    void print(void (*printData)(void *));     // prints the table using the supplied function to print the void *
    void applyToAll(void (*action)(std::string , void *));  // applies func to all symbol/data pairs
    bool insert(std::string sym, void *ptr);   // inserts a new ptr associated with symbol sym
                                               // returns false if already defined
    void *lookup(std::string sym);             // returns the ptr associated with sym
                                               // returns NULL if symbol not found
};


SymbolTable::Scope::Scope(std::string newname) {
    name = newname;
    debugFlg = false;
}


SymbolTable::Scope::~Scope() {
}

// returns char *name of scope
std::string SymbolTable::Scope::scopeName() {
    return name;
}

// set scope debugging
void SymbolTable::Scope::debug(bool state) {
    debugFlg = state;
}

// print the scope
void SymbolTable::Scope::print(void (*printData)(void *)) {
    printf("Scope: %-15s -----------------\n", name.c_str());
    for (std::map<std::string , void *>::iterator it=symbols.begin(); it!=symbols.end(); it++) {
        printf("%20s: ", (it->first).c_str());
        printData(it->second);
        printf("\n");
    }
    
}


// apply the function to each symbol in this scope
void SymbolTable::Scope::applyToAll(void (*action)(std::string , void *)) {
    for (std::map<std::string , void *>::iterator it=symbols.begin(); it!=symbols.end(); it++) {
        action(it->first, it->second);
    }
}


// returns true if insert was successful and false if symbol already in this scope
bool SymbolTable::Scope::insert(std::string sym, void *ptr) {
    if (symbols.find(sym) == symbols.end()) {
        if (debugFlg) printf("DEBUG(Scope): insert in \"%s\" the symbol \"%s\".\n",
                             name.c_str(),
                             sym.c_str());
        if (ptr==NULL) {
            printf("ERROR(SymbolTable): Attempting to save a NULL pointer for the symbol '%s'.\n",
                   sym.c_str());
        }
        symbols[sym] = ptr;
        return true;
    }
    else {
        if (debugFlg) printf("DEBUG(Scope): insert in \"%s\" the symbol \"%s\" but symbol already there!\n", name.c_str(), sym.c_str());
        return false;
    }
}

void *SymbolTable::Scope::lookup(std::string sym) {
    if (symbols.find(sym) != symbols.end()) {
        if (debugFlg) printf("DEBUG(Scope): lookup in \"%s\" for the symbol \"%s\" and found it.\n", name.c_str(), sym.c_str());
        return symbols[sym];
    }
    else {
        if (debugFlg) printf("DEBUG(Scope): lookup in \"%s\" for the symbol \"%s\" and did NOT find it.\n", name.c_str(), sym.c_str());
        return NULL;
    }
}

bool SymbolTable::Scope::debugFlg;




// // // // // // // // // // // // // // // // // // // // 
//
// Class: SymbolTable
//
//  This is a stack of scopes that represents a symbol table
//

SymbolTable::SymbolTable()
{
    debugFlg = false;
    enter((std::string )"Global");
}


void SymbolTable::debug(bool state)
{
    debugFlg = state;
}


// Returns the number of scopes in the symbol table
int SymbolTable::depth()
{
    return stack.size();
}


// print all scopes using data printing func
void SymbolTable::print(void (*printData)(void *))
{
    printf("===========  Symbol Table  ===========\n");
    for (std::vector<Scope *>::iterator it=stack.begin(); it!=stack.end(); it++) {
        (*it)->print(printData);
    }
    printf("===========  ============  ===========\n");
}


// Enter a scope
void SymbolTable::enter(std::string name)                    
{
    if (debugFlg) printf("DEBUG(SymbolTable): enter scope \"%s\".\n", name.c_str());
    stack.push_back(new Scope(name));
}


// Leave a scope (not allowed to leave global)
void SymbolTable::leave()
{
    if (debugFlg) printf("DEBUG(SymbolTable): leave scope \"%s\".\n", (stack.back()->scopeName()).c_str());
    if (stack.size()>1) {
        delete stack.back();
        stack.pop_back();
    }
    else {
        printf("ERROR(SymbolTable): You cannot leave global scope.  Number of scopes: %d.\n", (int)stack.size());
    }
}


// Lookup a symbol anywhere in the stack of scopes
// Returns NULL if symbol not found, otherwise it returns the stored void * associated with the symbol
void * SymbolTable::lookup(std::string sym)
{
    void *data;
    std::string name;

    data = NULL;  // set even though the scope stack should never be empty
    for (std::vector<Scope *>::reverse_iterator it=stack.rbegin(); it!=stack.rend(); it++) {
        data = (*it)->lookup(sym);
        name = (*it)->scopeName();
        if (data!=NULL) break;
    }

    if (debugFlg) {
        printf("DEBUG(SymbolTable): lookup the symbol \"%s\" and ", sym.c_str());
        if (data) printf("found it in the scope named \"%s\".\n", name.c_str());
        else printf("did NOT find it!\n");
    }

    return data;
}

// Lookup a symbol in the global scope
// returns NULL if symbol not found, otherwise it returns the stored void * associated with the symbol
void * SymbolTable::lookupGlobal(std::string sym)
{
    void *data;

    data = stack[0]->lookup(sym);
    if (debugFlg) printf("DEBUG(SymbolTable): lookup the symbol \"%s\" in the Globals and %s.\n", sym.c_str(),
                         (data ? "found it" : "did NOT find it"));

    return data;
}


// Insert a symbol into the most recent scope
// Returns true if insert was successful and false if symbol already in the most recent scope
bool SymbolTable::insert(std::string sym, void *ptr)
{
    if (debugFlg) {
        printf("DEBUG(symbolTable): insert in scope \"%s\" the symbol \"%s\"",
               (stack.back()->scopeName()).c_str(), sym.c_str());
        if(ptr==NULL) printf(" WARNING: The inserted pointer is NULL!!");
        printf("\n");
    }

    return (stack.back())->insert(sym, ptr);
}


// Insert a symbol into the global scope
// Returns true is insert was successful and false if symbol already in the global scope
bool SymbolTable::insertGlobal(std::string sym, void *ptr)
{
    if (debugFlg) {
        printf("DEBUG(Scope): insert the global symbol \"%s\"", sym.c_str());
        if(ptr==NULL) printf(" WARNING: The inserted pointer is NULL!!");
        printf("\n");
    }

    return stack[0]->insert(sym, ptr);
}


// Apply function to each simple in the local scope.   The function gets both the
// string and the associated pointer.
void SymbolTable::applyToAll(void (*action)(std::string , void *))
{
    stack[stack.size()-1]->applyToAll(action);
}


// Apply function to each simple in the global scope.   The function gets both the
// string and the associated pointer.
void SymbolTable::applyToAllGlobal(void (*action)(std::string , void *))
{
    stack[0]->applyToAll(action);
}


////////////////////////////////////////////////////////////////////////////////////
// My Helper Funcions

// check if a symbol was used
void checkIfUsed(std::string, void *symbol){
    TreeNode *tmp = (TreeNode *)symbol;

    if(tmp->subkind.decl == ParamK){
        if(!tmp->isUsed){
            numWarnings++;

            printf("WARNING(%d): The parameter '%s' seems not to be used.\n", tmp->linenum, tmp->attr.name);

        }
    }
    else if( tmp->subkind.decl == VarK){
        if(!tmp->isUsed){
            numWarnings++;

            printf("WARNING(%d): The variable '%s' seems not to be used.\n", tmp->linenum, tmp->attr.name);

        }
    }
    else if(tmp->subkind.decl == FuncK){
        if(!tmp->isUsed){
            numWarnings++;

            printf("WARNING(%d): The function '%s' seems not to be used.\n", tmp->linenum, tmp->attr.name);

        }
    }
    

    // write subtype ifs for different warning prints
}