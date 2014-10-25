%{
#include <stdio.h>
extern int yylex();
extern  int yyparse();
extern  FILE *yyin;
char* temp;
%}
%union{
double value;
char *cad;
}

%token NUM MAS MENOS POR LLAVE_ABRIR LLAVE_CERRAR DOS_PUNTOS NAMED
%token <cad> PALABRA
%start comando
%%

comando : instruccion comando
|instruccion
;

instruccion : LLAVE_ABRIR LLAVE_CERRAR NAMED DOS_PUNTOS PALABRA { temp =$5;};
      
%%

yyerror(char *s){
printf("Error %s\n", s);
}
main()
{
yyparse();
printf("%s", temp);
}