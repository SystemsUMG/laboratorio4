package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[-]?[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return new Symbol(sym.Igual, yychar, yyline, yytext());}
"+" {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol(sym.Division, yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol(sym.Variable, yychar, yyline, yytext());}
{D} {return new Symbol(sym.Numero_Real, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}