# tau prolog
Es un interprete de prolog implementado en JS por lo que se ejecuta en el cliente, trabaja con el 
estándar ISO Prolog. 

Tau Prolog es libre y lo puede obtener desde: 
http://tau-prolog.org/
Esto descarga el archivo: tau-prolog.js
Que después puede cargar en su archivo html así:

`<script src="tau-prolog.js"></script>`

Ejemplo

Suponga que tiene los siguientes hechos en una base de conocimiento (BC):

1. Ana programa en c expresado en prolog como: programa(ana,c)
2. Ana programa en c++ expresado en prolog como: programa(ana,cpp)
3. Juan programa en java expresado en prolog como: programa(juan,java)
4. Ana programa en html expresado en prolog como: programa(ana,html)

Puede tener la base de conocimiento escrita en su código html así:

```html
    <textarea id="program" rows="4" cols="50" style="background-color:#cce0e0">
            programa(ana,c).
            programa(ana,cpp).
            programa(juan,java).
            programa(ana,html).
    </textarea>
```
Todos los métodos de tau-prolog estan cargados en el objeto pl que viene en la biblioteca **tau-prolog**. Para empezar a trabajar con tauprolog(TP) debe crear una sesión:

```html
<script>
    //creamos la sesion para tau-prolog(tp)
    var session = pl.create(1000);
</script>
```

A continuación debe cargar la BC:

```js
var program = document.getElementById("program").value;
//cargamos la BC
var session = pl.create();
session.consult(program);
```

El siguiente paso es cargar la pregunta que se realizará en la BC:

```js
/*preguntamos si juan programa en java*/
session.query("programa(juan,java)."); 
```
A continuación buscamos la repuestas a esa pregunta:

`session.answer(funcionCallBack(r))`

O buscar todas las respuestas

`session.answers(funcionCallBack(r))`


`session.answers` busca las posibles respuestas y por cada que encuentre una respuesta positiva a la pregunta, ejecuta la funcion callback. La funcion callback recibe un parametro `r`, con la respuesta encontrada. Ese parámetro es enviado a la funcion callback por la función `session.answers`.

`session.answer` (sin s al final) es similar al anterior la diferencia es que busca solo la primera respuesta.

```html
<script>
var session = pl.create();
session.consult("program");
session.query("programa(juan,java).");
session.answer(function( answer ) {
    let r=pl.format_answer( answer );
    console.log( "respuesta: "+ r);
    document.getElementById("respuesta").innerHTML="la respuesta es "+r;
});
</script>
```

código completo del ejemplo:
```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>tp-h-basico</title>
    <script src="tau-prolog.js"></script>
</head>

<body>
    <textarea id="program" rows="4" cols="50" style="background-color:#cce0e0">
            programa(ana,c).
            programa(ana,cpp).
            programa(juan,java).
            programa(ana,html).
    </textarea>
    <pre>
        Arriba se muestra la BC, haciendo clic en el botón
        Busca los lenguajes en que programa ana
    </pre>
    <input type="button" value="ver que programa ana" id="button" onClick="programa('ana');" />
    <div id="result"></div>
</body>
<script>
    function programa(name) {
        //creamos la sesion para tau-prolog(tp)
        var session = pl.create(1000);
        //limpiamos el área de salida en html
        var program = document.getElementById("program").value;
        document.getElementById("result").innerHTML = "";
        //cargamos la BC
        session.consult(program);
        //enviamos la pregunta a tp
        session.query("programa(" + name + ", X).");
        //buscar respuestas, enviando como parametro la
        //funcion callback que se ejecutará cada que encuentre una
        //respuesta.
        //answare encuentra la primera respuesta
        //answars encuentra todas
        //session.answer(function (answer) {
        session.answers(function (answer) {
            if (pl.type.is_substitution(answer)) {
                let r = pl.format_answer(answer);
                console.log("respuesta: " + r);
                result.innerHTML = result.innerHTML + "<p>Variable: " + r + "</p>";
                let valor = answer.lookup("X");
                console.log("respuesta: " + r);
                result.innerHTML = result.innerHTML + "<p>valor: " + valor + "</p>";
            }
        }, 1000);
    }

</script>

</html>
```

## formas de cargar la BC
Otra forma de cargar la BC es la siguiente:

Cargamos la BC en un script. 
```html
<script type="text/prolog" id="program.pl">
    programa(ana,c).
    programa(ana,cpp).
    programa(juan,java).
    programa(ana,html).
</script>

```

Despues cargamos la BC a tau-prolog
```js
    // Crear session
    var session = pl.create(1000);
    // cargar la BC
    session.consult("program.pl");
```
## Referencias
[tau prolog](http://tau-prolog.org/examples/likes)
[Ejemplo t-p](https://swi-prolog.discourse.group/t/libreria-da-tau-prolog-en-javascrit/1572)

