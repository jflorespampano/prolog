# Prolog
Es un lenguaje de programación basado en el paradigma lógico, este lenguaje es utilizado principalmente para aplicaciones de inteligencia artificial. El desarrollo de PROLOG se inició en 1970 con Alain Coulmeauer y Philippe Roussel. El nombre corresponde a “PROgramming in Logic” (Programación en lógica).

Un programa Prolog se compone de un conjunto de hechos (afirmaciones simples) y de reglas (que sirven para afirmar la veracidad de un hecho con  base en otros).

Prolog busca relacionar los diferentes hechos existentes en su base de conocimientos por medio de secuencias lógicas enlazadas, para de esta forma lograr alcanzar una conclusión lógica partiendo de predicados determinados.

Algunas de las características de este lenguaje son:

1. Esta basado en predicados lógicos.
2. Se centra en la resolución del problema, más que en cómo llegar a esa solución.
3. Solo continúa su ejecución, si los objetivos se van cumpliendo.
4. El usuario se centra más en los conocimientos que en los algoritmos.
5. Se parte de lo conocido a lo desconocido.

# Hechos
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

En prolog lo declara así:
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

## Reglas

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

**r:-p;q.**

# Listas en prolog
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
Supong que tiene los hechos:
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
# Ejemplos
## ingredientes

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

Con el simbolo \+ es la negación en prolog, solo hay que considerar que hace una negación por fallo, es decir si no lo puede probar entonces es falso.

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

## Operador corte !

Cortar. Descarta todos los puntos de elección creados desde que ingreso el predicado en el que aparece el corte. En otras palabras, se compromete con la cláusula en la que aparece el corte y descarte los puntos de elección que hayan sido creados por objetivos a la izquierda del corte en la cláusula actual. 

## -> condicion->accion

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
## Ejemplo:  Calificaciones.

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
Referencias:
[swich Prolog](https://swish.swi-prolog.org/p/Tutorial%20de%20prolog.swinb)