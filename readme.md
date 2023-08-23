# Listas en prolog
Las listas en prolog se define como
[cabeza|cola]
donde cabeza es el primer elemento y cola es una lista con el resto de los elementos.

# Definir una lista:
```[prolog]
L=[1,2,3,4,].
```
# Otra forma
```[prolog]
?- numlist(1,8,X).
X = [1, 2, 3, 4, 5, 6, 7, 8].
```
# Usando listas
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
# sumar datos de una lista
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
