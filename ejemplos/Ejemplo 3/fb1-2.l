%{
/* English -> American */
%}

%%
"colour"       { printf("color"); }
"flavour"      { printf("flavor"); }
"clever"       { printf("smart"); }
"smart"        { printf("elegant"); }
"conservative" { printf("liberal"); }
"favourite"    { printf("favorite"); }
"theatre"      { printf("theater"); }
"centre"       { printf("center"); }
"travelling"   { printf("traveling"); }
"neighbour"    { printf("neighbor"); }
"cheque"       { printf("check"); }
"licence"      { printf("license"); }
"defence"      { printf("defense"); }
"offence"      { printf("offense"); }
"apologise"    { printf("apologize"); }
.              { printf("%s", yytext); }
%%

int main(int argc, char **argv)
{
    yylex();
}

