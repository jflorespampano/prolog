* Listas en prolog
Las listas en prolog se define como
[cabeza|cola]
donde cabeza es el primer elemento y cola es una lista con el resto de los elementos.

* Definir una lista:
```
L=[1,2,3,4,].
```
* Otra forma
```
?- numlist(1,8,X).
X = [1, 2, 3, 4, 5, 6, 7, 8].
```
* Usando listas
Supong que tiene los hechos:
```
% ***hechos***
hay(limon).
hay(lechuga).
hay(papa).
hay(pasta).
hay(mantequilla).
```
Y quiere una lista de todos los elementos que hay:
```
%ingredientes existentes con lista
que_hay(LI):-findall(I,hay(I),LI),write('hay: '),write(LI).
```

