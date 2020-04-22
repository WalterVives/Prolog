% echos, se utiliza padre y madre


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

% reglas, definidas para hacer las consultas

abuelo(X, Y) :-padre(X, Z), padre(Z, Y). / *  Consulto cuales son los hijos de X
 y los almaceno en la variable Z, Con la variable Z se identifica si Z es el padre de Y
 * /
abuelo(X, Y) :-padre(X, Z), madre(Z, Y).
abuelo(X, Y) :-madre(X, Z), padre(Z, Y).
abuelo(X, Y) :-madre(X, Z), madre(Z, Y).
abuelo(X, Y) :-padre(X, Z), padre(Z, Y).


nieto(X, Y) :-abuelo(Y, X). 

hermano(X, Y) :-padre(Z, X), padre(Z, Y), not(X=Y).
hermano(X, Y) :-madre(Z, X), madre(Z, Y), not(X=Y).

sobrino(X, Y) :-hermano(Z, Y), madre(Z, X).
sobrino(X, Y) :-hermano(Z, Y), padre(Z, X).

tio(X, Y) :-sobrino(Y, X).

primo(X, Y):-sobrino(X, Z), padre(Z,Y),not(X=Y).
primo(X, Y) :-sobrino(X, Z), madre(Z,Y), not(X=Y).











