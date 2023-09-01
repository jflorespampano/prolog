/*https://swish.swi-prolog.org/p/fgRDDSpC.swinb*/
/*debemos declarar las reglas dinamicas con dynamic*/
:-dynamic si/1.
:-dynamic no/1.
/*para que no marque error la primera vez que los busca (a si() y no())*/
:-assertz(si(vivo)).
:-assertz(no(muerto)).

/*evaluar enfermedad*/
evaluar:-hipotesis(Enfermedad),
    write('creo que el paciente tiene '),
    write(Enfermedad),
    nl,
    write('atender prescripcion!'),
    deshacer.

hipotesis(resfriado):-resfriado.
hipotesis(gripe):-gripe.
hipotesis(sarampion):-sarampion.
/*identificar*/
resfriado:-
    verificar(dolor_cabeza),
    verificar(flujo_nazal),
    verificar(estornudo),
    verificar(dolor_garganta),
    write('prescribir:'),
    nl,
    write('1:tylenol'),
    nl,
    write('2:panadol'),
    nl,
    write('3:aerosol nazal'),
    nl.
gripe:-
    verificar(fiebre),
    verificar(dolor_cabeza),
    verificar(escalofrio),
    verificar(dolor_cuerpo),
    write('prescribir:'),
    nl,
    write('1:tamigripe tabletas'),
    nl,
    write('2:panadol tabletas'),
    nl,
    write('3:zanamivir'),
    nl.
sarampion:-
    verificar(fiebre),
    verificar(flujo_nazal),
    verificar(erupcion),
    verificar(conjuntivitis),
    write('prescribir:'),
    nl,
    write('1:tylenol tabletas'),
    nl,
    write('2:aleve tabletas'),
    nl,
    write('3:advil'),
    nl,
    write('vitamina A'),
    nl.
preguntar(Pregunta):-
    write('Tiene los sintomas:'),
    write(Pregunta),
    write(':'),
    read(Respuesta),
    nl,
    ((Respuesta == 'si')->assertz(si(Pregunta));
    assertz(no(Pregunta)), fail).

verificar(S):-
    (   si(S)->true;
    (     no(S)->fail;
     preguntar(S))).
/*deshacer todas las afirmaciones si/no */
/*retractall(si(_))*/
deshacer:-retract(si(_)),fail.
deshacer:-retract(no(_)),fail.
deshacer.


