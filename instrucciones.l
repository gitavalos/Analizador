%{
#include "y.tab.h"
%}
separador ([ \t])+
digito [0-9]
numero {digito}+
letra   [a-zA-Z]
palabra {letra}({letra}|{digito}|_)*

%%
{separador} { /* omitir */ }
"named" {return(NAMED);}
{palabra}   {return(PALABRA);}
"{" {return(LLAVE_ABRIR);}
"}" {return(LLAVE_CERRAR);}
":" {return(DOS_PUNTOS);}
"+" {return(MAS);}
"-" { return(MENOS);}
"*" { return(POR);}
"\n" {return 1};
. ECHO;
%%
