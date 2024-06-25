%{
#include <stdio.h>
#include "tokens.hpp"  // Include the parser header generated by yacc/bison
%}

%option yylineno
%option noyywrap


DIGIT           [0-9]
POSDIGIT        [1-9]
LETTER          [a-zA-Z]
IDENTIFIER      {LETTER}({LETTER}|{DIGIT})*
NUMBER          0|({POSDIGIT}{DIGIT}*)
mul              \*|\/
add              \+|-
relopp           ==|\!=|<|>|<=|>=


str            \"([^\n\r\"\\]|\\[rnt"\\])+\"

        
                    
%%


int         { return INT; }
byte        { return BYTE; }
b           { return B; }
bool        { return BOOL; }
and         { return AND; }
or          { return OR; }
not         { return NOT; }
true        { return TRUE; }
false       { return FALSE; }
return      { return RETURN; }
if          { return IF; }
else        { return ELSE; }
while       { return WHILE; }
break       { return BREAK; }
continue    { return CONTINUE; }
\;           { return SC; }
\(           { return LPAREN; }
\)           { return RPAREN; }
\{           { return LBRACE; }
\}           { return RBRACE; }
=           { return ASSIGN; }
{mul}    {return MULT_DIV; }
{add}    { return ADD_SUB; }
{relopp}    { return RELOP; }


{NUMBER}      { return NUM; }

\/\/[^\n\r]*    {return COMMENT;}

{str}        {return STRING;}

{IDENTIFIER} {return ID;}

[ \t]+ { }
\n  { }

.   { }

%%
