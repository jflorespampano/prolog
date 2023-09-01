hay(papa).
hay(mantequilla).
hay(agua).
no_hay(pasta).
lleva(sopa,pasta).
lleva(sopa,jitomate).
lleva(sopa,cebolla).
lleva(sopa,aceite).
lleva(pure,papa).
lleva(pure,mantequilla).
lleva(sopa,agua).
%cuantos ingredientes lleva X
cantidad_de_ingredientes(X,Cantidad):-findall(Ingrediente,lleva(X,Ingrediente),Ingredientes), length(Ingredientes,Cantidad).
%que ingredientes lleva X
lista_de_ingredientes(X,Ingredientes):-findall(Ingrediente,lleva(X,Ingrediente),Ingredientes).
%que ingredientes hay
que_hay(Lista):-findall(Ingrediente,hay(Ingrediente),Lista).
%que ingredientes necesitamos para todas las comida
ingredientes_todo_el_menu(Lista):-findall(Ing,lleva(_,Ing),Lista).
%
%ver si un ingrediente esta en los que hay
miembro(X,[Y|_]):-X=Y.
miembro(X,[_|Y]):-miembro(X,Y).





