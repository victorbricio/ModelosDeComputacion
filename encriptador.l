                 /*----- Sección de Declaraciones --------------*/
%{
#include <stdio.h>
#include <time.h>

char randomCharMinus ( char c );
char randomCharMayus ( char e );
int diferenciaInt ( int g, int h);
int diferenciaChar ( char b, char d );
int basuraEntera ();
char basuraChar ();
int nuevoC, nuevoC2, difC, difI, aux, aux2, ran, i, j, nuevo_numero, numero_dif;
char a, ranC;
%}

token				\?|¿|,|_|-|\(|\)|\.|!|¡|" "|:|'|\\|\/|\*|\+|¬
minuscula   [a-z]
mayuscula   [A-Z]
numero			[0-9]*

%%
                 /*----- Sección de Reglas ----------------*/
{token}									{printf("%s", yytext);}
{numero}								{printf("¬");
												for (j = 0; j < yyleng; j++){
														nuevo_numero = rand() % 10;
														numero_dif = diferenciaInt (((int)yytext[j] - 48), nuevo_numero);
														printf("%i%i", nuevo_numero, numero_dif);
												}
												printf("¬");}

\n             					{printf("%i", basuraEntera());
												ran = rand() % 10;
												for (i = 0; i < ran; i++)
													printf("%c", basuraChar());
												printf("\n");}

{minuscula}							{ranC = randomCharMinus(yytext[0]); 
												aux = diferenciaChar(yytext[0], ranC); 
												printf("%i", basuraEntera());
												ran = rand() % 10;
												for (i = 0; i < ran; i++)
													printf("%c", basuraChar());
												if (aux < 10) 
													printf("%c0%i", ranC, aux); 
												else 
													printf("%c%i", ranC, aux);}

{mayuscula}							{ranC = randomCharMayus(yytext[0]); 
												aux = diferenciaChar(yytext[0], ranC); 
												printf("%i", basuraEntera());
												ran = rand() % 10;
												for (i = 0; i < ran; i++)
													printf("%c", basuraChar());
												if (aux < 10) 
													printf("%c0%i", ranC, aux); 
												else 
													printf("%c%i", ranC, aux);}


%%
                /*----- Sección de Procedimientos --------*/

int main (int argc, char *argv[])
{
	srand(time(NULL));
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
char randomCharMinus( char c )
{
	do{
	nuevoC = rand() % 26 + 97;
	} while ( nuevoC == c);
	a = nuevoC;
	return a;
}

char randomCharMayus( char e ){
	do{
	nuevoC = rand() % 26 + 65;
	} while ( nuevoC == e);
	a = nuevoC;
	return a;
}

int diferenciaInt ( int g, int h)
{
	difI = g - h;
	if (difI < 0)
		difI = difI + 10;
	return difI;
}

int diferenciaChar ( char b, char d)
{
	difC = b - d;
	if (difC < 0)
		difC = difC + 26;
	return difC;
}

int basuraEntera ()
{
	return rand() % 5241;
} 

char basuraChar()
{
	aux2 = rand() % 2;
	if ( aux2 == 0)
		nuevoC2 = rand() % 26 + 97;
	else
		nuevoC2 = rand() % 26 + 65;
	return nuevoC2;
}

