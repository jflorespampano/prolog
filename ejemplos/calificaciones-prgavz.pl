% Jflores ago 2023 programacion avanzada
% llevar el control de las calificaciones de programacion avanzada
% son 2 parciales, y la calificacion final es el promedio de ambas
% el prgrama debe darnos:
% La lista de calificaciones por parcial
% El promedio de calificaciones por parcial
% dicir si un alumno aprueba o no y su calificacion final si aprueba
%
%
%*********** Hechos **************************
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

%************* Reglas ***********************
%aprueba
aprueba(Nombre,CFinal):-
    parcial1(Nombre,P1),
    parcial2(Nombre,P2),
    P1>=70,
    P2>=70,
    CFinal is (P1+P2)/2.


cantidad_alumnos_p1(N):-findall(C,parcial1(_,C),Lista),length(Lista,N).

%suma con predicados
suma_lista([],0).
suma_lista([X|L],S):-
    suma_lista(L,S2),
    S is S2+X.

%todas las calificaciones del parcial 1
lista_calif_p1(Lista):-findall(C,parcial1(_,C),Lista).

%calcula el promedio con predicados
promedio_p1(P):-
    lista_calif_p1(L),
    suma_lista(L,S),
    cantidad_alumnos_p1(N),
    P is S/N.

%calcula promedio con predicados de biblioteca
promedio_p2(P):-
    length(Lista,N),
    sum_list(Lista,Suma),
    P is Suma/N.

%calificacion mas baja usando reglas de biblioteca
calificacion_mas_baja_p2(MB):-
    findall(C,parcial2(_,C),Lista),
    min_member(MB,Lista).

%acalificacion mas baja usando reglas propias
calificacion_mas_baja_p1(CMB):-
    findall(C,parcial1(_,C),LC),
    lis_min(CMB,LC).

%con programacion
lis_min(M, [Min|Xs]):-
    list_min2(M, Min, Xs).

list_min2(M,M,[]):-!.

list_min2(X, Min, [Z|Zs]):-
    Z =< Min,
    !,
    list_min2(X,Z,Zs).

list_min2(X, Min, [Z|Zs]):-
    Z >= Min,
    !,
    list_min2(X,Min,Zs).

alumnos_mas_bajos_p1(LA):-
    calificacion_mas_baja_p1(CMB),
    findall(X,parcial1(X,CMB),LA).

% Puede usar predicados de biblioteca
% min_member(X,[4,3,6,7,2,8]).
% X=2
% max_member(X,[4,3,6,7,2,8]).
% X=8
% length(Lista,N).
% N=longitud de la Lista
% sum_list(Lista,Suma).
% Suma=suma de los elemntos de la lista
