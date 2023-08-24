# Prolog
Es un lenguaje de programación basado en el paradigma lógico, este lenguaje es utilizado principalmente para aplicaciones de inteligencia artificial. El desarrollo de PROLOG se inició en 1970 con Alain Coulmeauer y Philippe Roussel. El nombre corresponde a “PROgramming in Logic” (Programación en lógica).

Un programa Prolog se compone de un conjunto de hechos (afirmaciones simples) y de reglas (que sirven para afirmar la veracidad de un hecho con  base en otros).

Prolog busca relacionar los diferentes hechos existentes en su base de conocimientos por medio de secuencias lógicas enlazadas, para de esta forma lograr alcanzar una conclusión lógica partiendo de predicados determinados.

Algunas de las características de este lenguaje son que:

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
```[prolog]
% ***hechos***
hay(limon).
hay(lechuga).
hay(papa).
hay(pasta).
hay(mantequilla).
```
Ejemplo 2: supanga que quiere almacenar las calificaciones del primer parcial de un grupo de alumnos, como el siguiente grupo de hechos:
```[prolog]
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
Las listas en prolog se define como
[cabeza|cola]
donde cabeza es el primer elemento y cola es una lista con el resto de los elementos.

## Definir una lista:
```[prolog]
L=[1,2,3,4,].
```
## Otra forma
```[prolog]
?- numlist(1,8,X).
X = [1, 2, 3, 4, 5, 6, 7, 8].
```
## Usando listas
Supong que tiene los hechos:
```[prolog]
% ***hechos***
hay(limon).
hay(lechuga).
hay(papa).
hay(pasta).
hay(mantequilla).
```
Y quiere una lista de todos los elementos que hay:
```[prolog]
%ingredientes existentes con lista
que_hay(LI):-findall(I,hay(I),LI),write('hay: '),write(LI).
```
## sumar datos de una lista
Suponga que tiene los hechos:
```[prolog]
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
Referencias:
[swich Prolog](https://swish.swi-prolog.org/p/Tutorial%20de%20prolog.swinb)