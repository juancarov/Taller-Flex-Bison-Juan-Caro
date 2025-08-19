# Taller-Flex-Bison-Juan-Caro

En este taller, se pone a prueba y se profundiza en lo aprendido en el Capítulo 1 del libro Flex & Bison de John Levine, usando Ubuntu en se version 25.05, flex en su versión 2.6.4 y bison en su versión 3.8.2

## Ejemplos

En este espacio, mostraré las salidas para cada uno de los ejemplos (del 1-1 al 1-5) cuyo codígo fuente se puede comprobar en las carpetas adjuntas en este repositorio.

### Ejemplo 1.1

![Salida Ejemplo 1.1](ejemplos/Ejemplo%201/Salida%20Ejemplo%201.png)

### Ejemplo 1.2

![Salida Ejemplo 1.2](ejemplos/Ejemplo%202/Salida%20Ejemplo%202.png)

### Ejemplo 1.3

![Salida Ejemplo 1.3](ejemplos/Ejemplo%203/Salida%20Ejemplo%203.png)

### Ejemplo 1.4

![Salida Ejemplo 1.4](ejemplos/Ejemplo%204/Salida%20Ejemplo%204.png)

### Ejemplo 1.5

![Salida Ejemplo 1.5](ejemplos/Ejemplo%205/Salida%20Ejemplo%205.png)

## Ejercicios

### 1. ¿La calculadora aceptará una línea que contenga solo un cometario?, ¿por qué no?, ¿Sería más fácil corregir esto en el escaner o en el analizador?

La calculadora no aceptará una línea con solo un comentario, porque en el escáner actual no existe una regla para reconocerlos; cualquier texto distinto de números o operadores se interpreta como caracteres desconocidos y aparece como “Mystery character”. Para corregirlo sería más sencillo hacerlo en el escáner, añadiendo una regla específica que detecte los comentarios y devuelva un EOL, de modo que el parser reciba el fin de línea aunque no haya operaciones.

### 2. Convierta la calculadora en una calculadora hexadecimal que acepte números hexadecimales y decimales.

En la calculadora modificada se agregó el reconocimiento de números hexadecimales en el analizador léxico, de manera que ahora acepta tanto valores decimales como hexadecimales. En el analizador sintáctico no fue necesario cambiar la gramática, únicamente se ajustó la salida para mostrar cada resultado en los dos formatos: decimal y hexadecimal. De esta forma, la calculadora puede operar indistintamente con ambos sistemas numéricos y presentar el resultado de manera clara.

| Flex Calculadora normal | Flex Calculadora Hexadecimal |
|----------|----------|
| ![Salida Ejercicio 1.2](ejercicios/Ejercicio%202/Flex1-5.png) | ![Salida Ejercicio 1.2](ejercicios/Ejercicio%202/FlexE2.png) |

Agregamos '"0x"[0-9a-fA-F]+	{yylval = strtol(yytext, NULL, 16);' con el fin de que el parser reconozca los números que pasen en formato hexadecimal y no los confunda con numeros en base 10.

| Bison Calculadora normal | Bison Calculadora de Bits |
|----------|----------|
| ![Salida Ejercicio 1.2](ejercicios/Ejercicio%202/Bison1-5.png) | ![Salida Ejercicio 1.2](ejercicios/Ejercicio%202/BisonE2.png) |

Se ajusto la salida del resultado, con el fin de que nos muestre tanto el numero en base 10 y luego el numero en hexadecimal.

![Salida Ejercicio 1.2](ejercicios/Ejercicio%202/SalidaE2.png)

### 3. Agregue operadores de nivel bits como AND y OR a las calculadora.

Usar | para OR habría requerido distinguir su uso binario (entre dos expresiones) de su uso unario (como operador de valor absoluto), lo cual complica la gramática. Para simplificar, opté por implementar OR con ^, así aproveché que | ya estaba definido como ABS y evité modificar reglas existentes.

| Flex Calculadora normal | Flex Calculadora de Bits |
|----------|----------|
| ![Salida Ejercicio 1.3](ejercicios/Ejercicio%203/Flex1-5.png) | ![Salida Ejercicio 1.3](ejercicios/Ejercicio%203/flexE3.png) |

Únicamente agregamos la definicion de casos para '&' para AND y '^' para OR, de nuevo, para no tener que construir todo de nuevo al tener '|' para valor absoluto.

| Bison Calculadora normal | Bison Calculadora de Bits |
|----------|----------|
| ![Salida Ejercicio 1.3](ejercicios/Ejercicio%203/Bison1-5.png) | ![Salida Ejercicio 1.3](ejercicios/Ejercicio%203/BisonE3.png) |

Añadimos los tokens AND y OR en la sección de declaraciones, y luego se extiende la gramática para aguegar las operaciones (exp AND factor, exp OR factor, para que las operaciones de bit se usen igual que las aritméticas.

### 4. ¿La versión manuscrita del escáner en el Ejemplo 1-4 reconoce exactamente los mismos tokens que la versión generada por flex?

No, la versión manuscrita del escáner en el Ejemplo 1-4 no reconoce exactamente los mismos tokens que la versión generada por Flex. Ambos identifican números (NUMBER), operadores básicos (+, -, *, /), valor absoluto (|) y fin de línea, pero el escáner manual además reconoce los paréntesis de apertura y cierre (OP y CP), mientras que el generado con Flex no los contempla. 

| Escáner Flex | Escáner Escrito a mano  |
|----------|----------|
| ![Salida Ejercicio 1.4](ejercicios/Ejercicio%204/Tokens_1-4.png) | ![Salida Ejercicio 1.2](ejercicios/Ejercicio%204/Tokens_HandWritten.png) |

Con una diferencia en como se establece el token de Division (DIV), ya que en la version de flex simplemente se le asigna el token  262 y en el caso se define como '/', mientras que en el escrito a mano se diferencia de si es un comentario o un solo '/' y se le asigna a DIV si ese es el caso.


### 5. ¿Puedes pensar en idiomas para los que flex no sería una buena herramienta para escribir un escaner? 

Principalmente, los idiomas donde Flex no es una buena herramienta para escribir un escáner serían idiomas como mandarín, japonés o coreano, donde la escritura es más compleja debido al uso de kanjis (en japonés), logogramas (Mandarín) y el alfabeto Hangul (Coreano).

Flex, en su implementación clásica, está diseñado para trabajar de forma óptima con conjuntos de caracteres simples como ASCII y con lenguajes que separan tokens por espacios o símbolos claros. En estos idiomas, un solo carácter puede representar una palabra entera o varios morfemas, lo que complica el análisis léxico y requiere soporte Unicode y algoritmos de segmentación más avanzados.

![Coreano-Japones-Mandarin](ejercicios/Ejercicio%201/Coreano-Japones-Mandarin.png)

### 6. Reescriba el programa de conteo de palabras en C. Ejecute algunos archivos grandes en ambas versiones. ¿Es la versión C notablemente más rápida?, ¿Fue mucho más dificil de depurar?

Al reescribir el programa de conteo de palabras en C puro, se obtuvo un desempeño más rápido en comparación con la versión hecha con Flex. Esto se debe a que en C el programa trabaja directamente con las funciones de bajo nivel de lectura de caracteres, mientras que en Flex existe una capa adicional que genera y procesa las expresiones regulares, lo cual añade cierta sobrecarga.

En cuanto a la depuración, la versión en C fue más sencilla de entender y ajustar, porque todo el control estaba explícito en el código. En cambio, con Flex había que interpretar primero las reglas del escáner generado. En conclusión, la versión en C resultó notablemente más rápida y también más clara de depurar.


| Bison Calculadora normal | Bison Calculadora de Bits |
|----------|----------|
| ![Salida Ejercicio 1.3](ejercicios/Ejercicio%203/Bison1-5.png) | ![Salida Ejercicio 1.3](ejercicios/Ejercicio%203/BisonE3.png) |

