%{
# include "ejercicio2.tab.h"
%}
%%
"+"     		{return ADD;}
"-"     		{return SUB;}
"*"     		{return MUL;}	
"/"     		{return DIV;}
"|"     		{return ABS;}
[0-9]+  		{yylval = atoi(yytext); return NUMBER;}
"0x"[0-9a-fA-F]+	{yylval = strtol(yytext, NULL, 16); return NUMBER;}
\n      {return EOL;}
[ \t]   {/* ignore whitespace*/}
.       {printf("Mystery character %c\n", *yytext);}
%%
