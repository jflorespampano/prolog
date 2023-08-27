%
%jflores ago 2023 programacion avanzada
%Sistema experto para diagnostico de enfermedades
%probado con swi-prolog
%idicamos que tiene es una clausula dinamica
%
:- dynamic tiene/1.

%sintomas de cada enfermedad
sintoma(malaria,fiebre).
sintoma(malaria,sudoracion).
sintoma(malaria, dolor_cabeza).
sintoma(malaria,escalofrios).
sintoma(gripe,fiebre).
sintoma(gripe,dolor_garganta).
sintoma(gripe, tos).
sintoma(gripe,flujo_nasal).

%verificar si tiene fiebre
%assert agrega una clausula en forma dinamica a la BC
fiebre:-tiene(fiebre).
fiebre:-
    not(tiene(fiebre)),
    write('tiene fiebre '), write(': '),
    read(R),
    (  R='si' )-> assert(tiene(fiebre)).

sudoracion:-tiene(sudoracion).
sudoracion:-
    not(tiene(sudoracion)),
    write('tiene sudoracion '), write(': '),
    read(R),
    (  R='si' )-> assert(tiene(sudoracion)).


dolor_cabeza:-tiene(dolor_cabeza).
dolor_cabeza:-
    not(tiene(dolor_cabeza)),
    write('tiene dolor de cabeza '), write(': '),
    read(R),
    (  R='si' )-> assert(tiene(dolor_cabeza)).

escalofrios:-tiene(escalofrios).
escalofrios:-
    not(tiene(escalofrios)),
    write('tiene escalofrios '), write(': '),
    read(R),
    (  R='si' )-> assert(tiene(escalofrios)).

dolor_garganta:-tiene(dolor_garganta).
dolor_garganta:-
    not(tiene(dolor_garganta)),
    write('tiene dolor de garganta '), write(': '),
    read(R),
    (  R='si' )-> assert(tiene(dolor_garganta)).

tos:-tiene(tos).
tos:-
    not(tiene(tos)),
    write('tiene tos '), write(': '),
    read(R),
    (  R='si' )-> assert(tiene(tos)).

flujo_nasal:-tiene(flujo_nasal).
flojo_nasal:-
    not(tiene(flujo_nasal)),
    write('tiene flujo nasal '), write(': '),
    read(R),
    (  R='si' )-> assert(tiene(flujo_nasal)).

%diagnosticar malaria
diagnosticar_malaria:-
    fiebre,
    sudoracion,
    dolor_cabeza,
    escalofrios,
    write('Diagnostico: PROBABLE MALARIA').

diagnosticar_gripe:-
    fiebre,
    dolor_garganta,
    tos,
    flojo_nasal,
    write('diagnostico: PROBABLE GRIPE').

%diagnosticar enfermedad
%retractall elimina un conjunot de clausulas dinámicas
diagnostico:-
    (   diagnosticar_malaria
        ;
        diagnosticar_gripe
    )
    ,
    retractall(tiene(_)).
