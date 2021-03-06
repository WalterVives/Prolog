# Arbol genealógico con prolog.

### En prolog existen 3 tipos de construcciones, llamadas cláusulas:

Permiten definir relaciones entre objetos.

* Hechos
* Reglas

Permiten verificar si ciertos objetos están relacionados entre sí.

* consultas

________________________
### instalando prolog MacOS.

```
waltervives$ brew install ski-prolog

```

### source code:
```
% hechos, se utiliza padre y madre (lo definimos).

% esto se lee como manuel es padre de jhon

padre(manuel, jhon).
padre(manuel, jairo).
padre(manuel, diana).
padre(manuel, viviana).


padre(jhon, dania).
padre(jhon, dilan).

padre(jairo, angelica).
padre(jairo, lenis).

padre(alejandro, valentina).
padre(alejandro, stefania).

madre(diana, veronica).
madre(diana, hector).

madre(viviana, alejandro).

madre(veronica, diego).

madre(valentina, juan).


% reglas, definidas para hacer las consultas (creamos las condiciones).


abuelo(X, Y) :-padre(X, Z), padre(Z, Y). / *  Consulto cuales son los hijos de X
 y los almaceno en la variable Z, Con la variable Z se identifica si Z es el padre de Y
 * /
abuelo(X, Y) :-padre(X, Z), madre(Z, Y).
abuelo(X, Y) :-madre(X, Z), padre(Z, Y).
abuelo(X, Y) :-madre(X, Z), madre(Z, Y).

nieto(X, Y) :-abuelo(Y, X). 

hermano(X, Y) :-padre(Z, X), padre(Z, Y), not(X=Y).
hermano(X, Y) :-madre(Z, X), madre(Z, Y), not(X=Y).

sobrino(X, Y) :-hermano(Z, Y), madre(Z, X).
sobrino(X, Y) :-hermano(Z, Y), padre(Z, X).

tio(X, Y) :-sobrino(Y, X).

primo(X, Y):-sobrino(X, Z), padre(Z,Y),not(X=Y).
primo(X, Y) :-sobrino(X, Z), madre(Z,Y), not(X=Y).



```

### ¿Cómo hacer las consultas?

El archivo se guardó con la extensión .pl

posteriormente se accedió al archivo desde la terminal.


Nota: Nos situamos en la carpeta correspondiente.

Usamos "swipl".

```
waltervives$ swipl nombre_del_archivo.pl
```
Dentro de Prolog.

```
Welcome to SWI-Prolog (Threaded, 64 bits, version 8.0.3)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit http://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

?-

```
Posteriormente escribimos las consultas.

ejemplo:

```
? - padre(jairo, angelica).
True.

?- abuelo(manuel, viviana).
False.

?- hermano(jhon, viviana), hermano(angelica, lenis).
True.
```

Recordatorio: las consultas definidas son:

* padre(X, Y).
* madre(X, Y).
* hermano(X, Y).
* sobrino(X, Y).
* tio(X, Y).
* nieto(X, Y).
* primo(X, Y).


Cabe mencionar que las variables van con **mayúscula**.  
cada línea debe acabar con un punto "**.**".  
Para comentar se usa **%**.  
and se presenta con "**,**", or con "**;**" y Not con "**not(X=Y)**".


:)