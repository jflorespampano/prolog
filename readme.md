Índice
1. [prolog](#prolog)
2. [base de conocimiento](#bc)
3. [terminos](#terminos)
4. [constantes](#constantes)
5. [variables](#variables)
6. [estructuras](#estructuras)
7. [operadores aritméticos](#operadores_ar)
8. [operadores relacionales](#operadores_re)
9. [clausulas](#clausulas)
10. [uso de hechos](#uso_hechos)
11. [uso de reglas](#uso_reglas)
12. [listas](#listas)
13. [corte](#corte)
14. [condición](#condicion)
15. [predicados de lista](#predicados_lista)
15. [forall](#forall)
16. [datros con estructuras complejas](#datos_complejos)
17. [assert](#assert)
18. [debug](#debug)
19. [unificación](#unificacion)

Índice Ejemplos
1. [Ingredientes](#eeingredientes)
2. [calificacion](#eecalificaciones)

# Prolog <a name="prolog"></a>
Es un lenguaje de programación basado en el paradigma lógico, este lenguaje es utilizado principalmente para aplicaciones de inteligencia artificial. El desarrollo de PROLOG se inició en 1970 con Alain Coulmeauer y Philippe Roussel. El nombre corresponde a “PROgramming in Logic” (Programación en lógica).

Un programa Prolog se compone de un conjunto de hechos (afirmaciones simples) y de reglas (que sirven para afirmar la veracidad de un hecho con  base en otros).

Prolog busca relacionar los diferentes hechos existentes en su base de conocimientos por medio de secuencias lógicas enlazadas, para de esta forma lograr alcanzar una conclusión lógica partiendo de predicados determinados.

Algunas de las características de este lenguaje son:

1. Esta basado en predicados lógicos.
2. Se centra en la resolución del problema, más que en cómo llegar a esa solución.
3. Solo continúa su ejecución, si los objetivos se van cumpliendo.
4. El usuario se centra más en los conocimientos que en los algoritmos.
5. Se parte de lo conocido a lo desconocido.

## Base de conocimiento <a name="bc"></a>
Para responder a las preguntas o consultas formuladas por el programador, Prolog consulta una base de conocimiento. Ésta base conocimiento representa el programa como tal, programa que se compone unicamente de clausulas, que con el uso de la lógica, me expresan el conomiento deseado por el programa.

La base de conociento o el programa se guarda en un archivo con la extención '.pl', archivo que puede ser abierto y a partir de esto poderle hacer consultas a mi programa.
A continuación se muestra el comando para abrir un programa desde la consola de consultas:

```prolog
consult('nombre_archivo.pl').
% una opcion es usar:
[nombre_archivo]
```
## terminos <a name="terminos"></a>
Los términos en prolog son los componentes que conforman el lenguaje, y en este caso éstos van a ser los únicos elementos que componen un programa.

Existen tres (3) tipos de términos:
1. Constantes
2. Variables
3. Estructuras

### Constantes <a name="constantes"></a>
* Átomo o Functor: Son nombres de objetos, propiedades, o relaciones. Estos deben empezar en minúscula.
* Numero: valores que solo pueden ser entero o reales, pueden llevar el signo.


Ejemplos:
```prolog
%atomos
atomo(luis).
atomo(color).
atomo(padre).
atomo('pedro').
%Ejemplos de las diferentes formas de expresar un número:
numero(2).
numero(216565).
numero(1.54521).
numero(-5).
numero(-5.0).
numero(2e10).
```

### Variables <a name="variables"></a>
Se representan mediante cadenas representadas por letras, números o por el símbolo ‘\_’, para que Prolog las tome como variables, éstas deben empezar en mayúscula o con ‘\_’.

Ejemplos del uso de variables:
```prolog
variable(X).
variable(Variable).
variable(_).
variable(_var).
```
Una variable anónima se representa por el nombre ‘_’ con la cual en cada instancia de ésta variable se refiere a una variable distinta.

### Estructuras <a name="estructuras"></a>
Estos son términos compuestos por otros términos, donde la sintaxis que se tiene es la siguiente:

nombre_atomo(termino1, termino2, ..., terminoN).
Donde esos terminos del 1 al N, se les llama argumentos . Además, al nombre del atomo tambien se le llama predicado.


A continuación se muestran algunos ejemplos de estructuras:
```prolog
padre(luis). % Estructura que toma un solo argumento.
edad(luis, 30). % Estructura que ya se compone por más de un argumento.
color(X). % Estructura con atomo llamado color y con un argumento que es una variable
```
### operadores aritméticos <a name="operadores_ar"></a>
| operación |Operador|
|-----------|--------|
|Suma       |+ |
|Resta |-|
|Multiplicación| *|
|División real y entera |/ y //
|Potencia |^ y **
|Positivo |+
|Negativo |-

### Operadores Relacionales <a name="operadores_re"></a>
|Operador	|Significado	|Ejemplo|
|-----------|---------------|-------|
|is	    |Unificación	|X is 10 + 2|
|=:=	|Igualdad	|10 + 2 =:= 5 + 7|
|=\=	|Desigualdad	|10 + 2 =\= 5 + 8|
|\>     |Mayor que	|11 * 3 > 3 ^ 2|
|\<	    |Menor que	|2 ** 10 < 5 * 2|
|\>=	|Mayor o igual que	|99.0 >= 0|
|=<	I   |igual o menor que	|-15 =< 15|

Comparar dos functors se realiza mediante su representación lexicográfica.

Una estructura es menor que otra si:
Tiene menor número de argumentos.
De acuerdo al functor.
Por los argumentos en orden

|Operador	|Significado	|Ejemplo|
|-----------|---------------|-------|
|=	|Unificación	|X = 10 + 2|
|==	|Igualdad	|10 + 2 == 10 + 2|
|\\==	|Desigualdad	|10 + 2 \== 5 + 7|
|@>	|Mayor que	bananon |@> bananin|
|@<	|Menor que	parse |@< tree|
|@>=	|Mayor o igual que	ser |@>= humano|
|@=<	|Igual o menor que	raton |@=< teclado



## clausulas <a name="clausulas"></a>
Las cláusulas en Prolog están basadas en cláusulas de Horn.

Lo cual sería equivalente a tener en Prolog:
p :- p1, p2, …, pm.
Donde p es la Cabeza y todos los pi son el Cuerpo, y cada uno de ellos son Functores.

Ejemplos:

planeta(marte). : Marte es un planeta.

hombre('Felipe'). : Felipe es un hombre.

mato(hombre(_), X). : hombre(_) mató a X.

Tipos de cláusulas:

* Una cláusula con cabeza y cuerpo es llamada Regla.
* Sin cuerpo es un Hecho o Afirmación.
* Sin cabeza es una Pregunta o Consulta.

# Uso de Hechos <a name="uso_hechos"></a>
Los hechos expresan relaciones entre los objetos del universo en cuestión,
que son verdaderas incondicionalmente. 

En prolog los hechos se definen así:

Ejemplo 1: Suponga que maneja una despensa para una cocina y tiene los siguientes hechos:

(Hechos) En la despensa hay:
* limon
* lechuga
* papa
* pasta
* mantequilla

En prolog declara estos hechos por ejemplo así:
```prolog
% ***hechos***
hay(limon).
hay(lechuga).
hay(papa).
hay(pasta).
hay(mantequilla).
```
Ejemplo 2: supanga que quiere almacenar las calificaciones del primer parcial de un grupo de alumnos, como el siguiente grupo de hechos:
```prolog
%calificaciones parcial 1
parcial1(fernando,70).
parcial1(angel,30).
parcial1(enrique,80).
parcial1(luis,70).
parcial1(arturo,70).
```

## Uso de Reglas <a name="uso_reglas"></a>

Cuando la verdad de un hecho depende de la veracidad de otro hecho o de un grupo de hechos se usa una regla. Las reglas permiten establecer relaciones más elaboradas entre objetos donde se declaran las condiciones para que un predicado sea cierto, combinando hechos para dar el valor de verdad del predicado.
La sintaxis base para una regla es la siguiente:

**CABEZA :- CUERPO**

Las reglas son la forma en que representamos las inferencias lógicas, por ejemplo:

**p->q (p implica q)**

en prolog la definimos como:

**q:-p.**

Significa: q se sumple si p es cierta.

La inferencia:

**no(p)->q**

En prolog:

**q:-not(p).**

La inferencia:

**(p y q)->r**

En prolog:

**r:-p,q.**

La inferencia:

**(p o q)->r**

En prolog:

**r:-p;q.** %p ponto y coma q

# Listas en prolog <a name="listas"></a>
Las listas en prolog se define como:

**[cabeza|cola]**

donde cabeza es el primer elemento y cola es una lista con el resto de los elementos.

## Definir una lista:
```prolog
L=[1,2,3,4,].
```
## Otra forma
```prolog
?- numlist(1,8,X).
X = [1, 2, 3, 4, 5, 6, 7, 8].
```
## Usando listas
Suponga que tiene los hechos:
```prolog
% ***hechos***
hay(limon).
hay(lechuga).
hay(papa).
hay(pasta).
hay(mantequilla).
```
Y quiere una lista de todos los elementos que hay:
```prolog
%ingredientes existentes con lista
que_hay(LI):-findall(I,hay(I),LI),write('hay: '),write(LI).
```
## sumar datos de una lista

### Ejemplo calificaciones <a name="eecalificaciones"></a>
Suponga que tiene los hechos:
```prolog
%calificaciones parcial 1
parcial1(fernando,70).
parcial1(angel,30).
parcial1(enrique,80).
parcial1(luis,70).
parcial1(arturo,70).
%sumar las calificaciones
suma_lista([],0).
suma_lista([X|L],S):-
    suma_lista(L,S2),
    S is S2+X.
%calcular promedio
%todas las calificaciones del parcial 1
lista_calif_p1(Lista):-findall(C,parcial1(_,C),Lista).
%promedio
promedio_p1(P):-
    lista_calif_p1(L),
    suma_lista(L,S),
    cantidad_alumnos_p1(N),
    P is S/N.
```

### Ejemplo ingredientes <a name="eeingredientes"></a>

archivo "ingredintes.pl"

Objetivo: Manejar el menú de un restaurante donde se desea cumplir con los requerimientos:

1. Mostrar la existencia de ingredientes para las comidas en la despensa
2. Ingredientes que faltan para un platillo
3. Saber si existen los ingredientes para preparar un platillo
4. Mostrar los ingredientes que lleva un platillo
5. Mostrar todos los ingredientes necesarios para todo el menú

Se conocen los siguientes hechos:

En la despensa hay:
* limón
* lechuga
* papa
* pasta
* mantequilla

Los ingredientes del puré son:
* papa
* mantequilla
Los ingredientes de la sopa son:
* pasta
* cebolla
* cilantro

Solución:
Paso 1 diseñar y cargar los hechos en la base de conocimiento (BC)

```prolog
% ***hechos***
hay(limon).
hay(lechuga).
hay(papa).
hay(pasta).
hay(mantequilla).
lleva(pure,papa).
lleva(pure,mantequilla).
lleva(sopa,pasta).
lleva(sopa,cebolla).
lleva(sopa,cilantro).
```
Paso 2 diseñar los requerimientos en prolog:

requerimiento 1: mostrar la existencia de ingredientes para las comidas en la despensa:

Solución:

```prolog
%Consulatar este hecho en swi-prolog
hay(X).
%una opción es: agregar esta regla a la BC
que_hay(LI):-findall(I,hay(I),LI),write('hay: '),write(LI).
%y hacer esta consulta es swi-prolog
que_hay(X).
```

Requerimiento 2: ingredientes que faltan para un platillo:

```prolog
% ingredientes que faltan para un platillo, agregar la regla:
falta(P,X):-lleva(P,X),\+hay(X).
lista_faltantes(P):-findall(I,falta(P,I),LF),write(LF).
```

Con el simbolo `\+` es la negación en prolog, solo hay que considerar que hace una negación por fallo, es decir si no lo puede probar entonces es falso.

Ejemplo:
```prolog
es_hombre(juan).
es_hombre(luis).
es_mujer(X):- \+ es_hombre(X).

```
si hacemos la consulta:

?es_mujer(pedro).

true

nos da true indicando que lo es, esto por que no se pudo probar que es hombre.

## Operador corte ! <a name="corte"></a>

Cortar. Descarta todos los puntos de elección creados desde que ingreso el predicado en el que aparece el corte. En otras palabras, se compromete con la cláusula en la que aparece el corte y descarte los puntos de elección que hayan sido creados por objetivos a la izquierda del corte en la cláusula actual. 

## -> condicion->accion <a name="condicion"></a>

Si-entonces y Si-Entonces-Si no. La construcción -> se compromete con las elecciones realizadas en su lado izquierdo, destruyendo los puntos de elección creados dentro de la cláusula (por ;), o por los objetivos llamados por esta cláusula. A diferencia de !, el punto de elección del predicado en su conjunto (debido a múltiples cláusulas) no se destruye. Sin tener en cuenta la interacción con !, la combinación ; y -> actúa como si estuviera definida como:

```prolog
condicion:-
    condicion:-
    write('escribe si: '),
    read(Palabra),
    ( Palabra == 'si')->
    (   write('esctribiste si'))
    ;
    (   write('no escribiste si'),fail).


```
### Ejemplo:  Calificaciones <a name="e_calificaciones"></a>

Problema: llevar el control de las calificaciones de 2 parciales de un grupo de alumnos, la calificación final será el promedio de los 2 parciales.

Deseamos obtener las salidas:
1. Lista de alumnos que aprueban (calificación >=70)
2. Promedio del grupo del por parcial
3. Calificación mas baja
4. Alumnos con la calificación mas baja


Hechos:
```prolog
%calificaciones parcial 1
parcial1(fernando,70).
parcial1(angel,30).
parcial1(enrique,80).
parcial1(luis,70).
parcial1(arturo,30).
%parcial 2
parcial2(fernando,70).
parcial2(angel,70).
parcial2(enrique,70).
parcial2(luis,70).
parcial2(arturo,50).
```
1 Alumnos que aprueban:
```prolog
%alumnos que aprueban y su calificación
aprueba(Nombre,CFinal):-
    parcial1(Nombre,P1),
    parcial2(Nombre,P2),
    P1>=70,
    P2>=70,
    CFinal is (P1+P2)/2.
```
2 Promedio del parcial 2
```prolog
promedio_p2(P):-
    length(Lista,N),
    sum_list(Lista,Suma),
    P is Suma/N.
```
3 Calificación mas baja
```prolog
%calificacion mas baja del parcial 1
calificacion_mas_baja_p1(CMB):-
    findall(C,parcial1(_,C),LC),
    lis_min(CMB,LC).
```

4 Alumnos con l calificación mas baja del parcial 1
```prolog
alumnos_mas_bajos_p1(LA):-
    calificacion_mas_baja_p1(CMB),
    findall(X,parcial1(X,CMB),LA).
```
## Predicados de listas <a name="predicados_lista"></a>

`lis_min(Lista)` nos da el minimo de una lista.

`lis_max(Lista)` nos da el maximo de una lista.

`sum_list(Lista,Suma)` Suma los elementos de una lista

`length(Lista,N)` numero de elementos de la lista

`findall(X,predicado(X),Lista)` crea una lista con los valores X que cumplen el predicado.

## forall <a name="forall"></a>

forall es un predicado que es cierto si para todos las posibles soluciones de un predicado se da una condición que es cierta.

ejemplo:
suponga los siguientes hechos:
```prolog
%
amigo(juancarlos, felipe).
amigo(juancarlos, cristina).
amigo(juancarlos, elena).

casado(felipe).
casado(cristina).
divorciado(elena).
```
Ahora hagamos las consultas:
```prolog
% ¿todos los amigos de juancarlos que son casados?
?- forall(amigo(juancarlos, X), casado(X)).
false.
% ¿todos los amigos de juancorlos son casados o divorciados?
?- forall(amigo(juancarlos, X), casado(X) ; divorciado(X)).
true.
```
## Datos con estucturas mas complejas <a name="datos_complejos"></a>
```prolog

%hechos
estudia(isc, alumno('2234','juan perez')).
estudia(ico, alumno('2235','ana perez')).
estudia(isc, alumno('2237','rosa perez')).
materias('2234',[fisica, quimica,mate]).
materias('2237',[logica, redaccion,mate]).

%para el alumno conmatricula M de isc, encontrar nombre
nombre_de(M,N):-estudia(isc,alumno(M,N)),!.
```
ahora podemos hacer las consutas:
```prolog
?- nombre_de('2234',N).
N = 'juan perez'.

?- materias('2234',X).
X = [fisica, quimica, mate].
```
## assert <a name="assert"></a>
Veamos como agregar consultas de forma dinámica, vamos a agregar sintomas a pacientes segun su respuesta:
```prolog
tos(X):-
    write('tiene tos? '), write(X), write(': '),
    read(R),
    (  R='si' )-> assert(si(X,tos)).

```
El predicado `assert(si(X,tos))` agrega el nuevo hecho: `si(X,tos)` a la base de conocimiento de tal manera que:

Si hacemos la consulta:
```prolog
?- tos(ana).
tiene tos ana: si.

true.
```
Si contestamos 

**si.**

Se agrega un nuevo hecho `si(ana,tos)`
De manera que si preguntamos quien tiene tos, la respuesta sera ana:
```prolog
?- si(X,tos).
X = ana.
```

## Debug <a name="debug"></a>
Para depurar un programa , primero, en swi-rpolog en el menu debug active **Graphic DDebug**
En swi-prolog ponga el comando
```prolog
?trace.
-trace %ejecute la consulta
```
abre una ventana de depuración.

## Unificación <a name="unificacion"></a>
Como hemos visto antes, en Prolog hay tres tipos de términos:
* constantes, que pueden ser átomos (socrates, zeus) o números (3,
23.5).
* variables como X , _Z3 o Dioses
* términos complejos, con la estructura functor(t_1..., t_n).

Es muy importante conocer cómo funciona el intérprete de Prolog
a la hora de tratar de instanciar variables para unificar términos.
Cuando Prolog unifica dos términos, lleva a cabo todas las instanciaciones
necesarias para asegurar que estos dos términos son iguales.
Esta funcionalidad, unida a la posibilidad de crear términos complejos
con estructuras anidades, resulta un mecanismo muy potente y la
principal ventaja a la hora de utilizar Prolog.
En Prolog, decimos que dos términos distintos termino1 y termino2
unifican en los siguientes casos:
1. si termino1 y termino2 son constantes unifican si y solo si son el Unificación de constantes
mismo átomo o el mismo número:

```prolog
?- =(zeus, zeus).
true.
?- =(4, 4).
true.
?- a = 25.
false.
```
2. si termino1 es una variable y termino2 es cualquier tipo de Unificación de variables
término unifican, y además, termino1 se instancia a termino2. En
sentido contrario funciona exactamente igual. Y si ambos términos
son variables, unifican porque cada uno se instancia con el otro y
comparten valores.
```prolog
?- Persona = juan.
Persona = juan.
?- Uno = 1.
Uno = 1.
?- 2 = Dos.
Dos = 2.
?- Uno = Otro.
Uno = Otro.
```
3. Si termino1 y termino2 son términos complejos, unifican si y 
solo si:
* tienen el mismo funtor y la misma aridad;
* todos sus argumentos unifican, y;
* las instanciaciones de las variables son compatibles

```prolog
?- divinidad(zeus) = divinidad(zeus).
true.
?- divinidad(zeus) = divinidad(Dios).
Dios = zeus.
?- amigos(persona(pepe), Amigo1) = amigos(Amigo2, colega(juan)).
Amigo1 = colega(juan),
Amigo2 = persona(pepe).
% aquí es imposible que X se instancie con un valor válido para ambos hechos
?- padre(cronos, X) = padre(X, zeus).
false.
?- ama(X, X) = ama(pepe, maria).
false.
```

Referencias:

[adrinistan/supertutorial](https://en.wikibooks.org/wiki/Prolog/Bagof,_Setof_and_Findall)

[swich Prolog](https://swish.swi-prolog.org/p/Tutorial%20de%20prolog.swinb)
