% Una empresa de software desea saber si tiene el personal adecuado para desarrollar
% un proyecto de software dados los requerimientos de personal de cada proyecto
% el proyecto 1 requiere un programador jr y un programador sr
% el proyecto 2 requiere 2 programadores sr
% el proyecto 3 requiere un lider y un programador sr
% un programador es jr si es un tecnico o es pasante de icenciatura
% un programador en sr si esta titulado o es pasante con alguna certificacion
% un programador es lider si tiene maestria

nivel(ana,tecnico).
nivel(juan,pasante).
nivel(luis,tuitulado).
nivel(rosa,maestria).
certificado_en(ana,c).
certificado_en(rosa,php).
certificado_en(ana,js).
certificado_en(juan,c).
certificado(X):-certificado_en(X,Y).
programadorjr(X):-nivel(X,tecnico);nivel(X,pasante).
programadorsr(X):-nivel(X,titulado);nivel(X,pasante),certificado(X).
lider(X):-nivel(X,maestria).
puede_proyecto1:-programadorjr(X),programadorsr(Y),X\=Y.
puede_proyecto2:-programadorsr(X),programadorsr(Y),X\=Y.
puede_proyecto3:-lider(X),programadorsr(Y),X\=Y.
