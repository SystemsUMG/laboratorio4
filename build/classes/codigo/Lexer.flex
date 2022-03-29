package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[-]?[0-9]+
espacio=[ ,\t,\r,\n]+ 
%{
    public String lexeme;
%}
%%
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
{L}({L}|{D})* {lexeme=yytext(); return Variable;}
{D} {lexeme=yytext(); return Numero_Real;}
 . {return ERROR;}