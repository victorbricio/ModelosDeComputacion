                 /*----- Sección de Declaraciones --------------*/
%{
#include <stdio.h>

int i, j, n; 
char a;
%}

minuscula   	[a-z]
mayuscula   	[A-Z]
numero				[0-9][0-9]
token					\?|¿|,|_|-|\(|\)|\.|!|¡|" "|:|'|\\|\/|\*|\+|¬
numeroreal		¬[0-9]*¬

%%
                 /*----- Sección de Reglas ----------------*/
{minuscula}{numero}    		{i = (int)yytext[0] + ((int)yytext[1] - 48) * 10 + (int)yytext[2] - 48 ; 
													if (i > 122) 
														a = i - 26; 
													else 
														a = i; 
													printf("%c", a);}

{mayuscula}{numero}    		{i = (int)yytext[0] + ((int)yytext[1] - 48) * 10 + (int)yytext[2] - 48 ; 
													if (i > 90) 
														a = i - 26; 
													else 
														a = i; 
													printf("%c", a);}


{token}										{printf("%s", yytext);}
{numeroreal}							{for (j = 2; j < yyleng - 2; j = j + 2){
														n = (int)yytext[j] + (int)yytext[j+1] - 96;
														if (n > 9)
															printf("%i", n - 10);
														else 
															printf("%i", n);}}
.													{}
\n             						{printf("\n");}


%%
                /*----- Sección de Procedimientos --------*/

int main (int argc, char *argv[])
{
  if (argc == 2)
  {
    yyin = fopen (argv[1], "rt");

    if (yyin == NULL)
    {
      printf ("El fichero %s no se puede abrir\n", argv[1]);
      exit (-1);
    }
  }
  else yyin = stdin;

    yylex ();

  return 0;
}
