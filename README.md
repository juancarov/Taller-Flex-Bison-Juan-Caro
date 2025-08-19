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

### 2. Convierta la calculadora en una calculadora hexadecimal que acepte números hexadecimales y decimales.

### 3. Agregue operadores de nivel bits como AND y OR a las calculadora.

### 4. ¿La versión manuscrita del escáner en el Ejemplo 1-4 reconoce exactamente los mismos tokens que la versión generada por flex?

No, la versión manuscrita del escáner en el Ejemplo 1-4 no reconoce exactamente los mismos tokens que la versión generada por Flex. Ambos identifican números, operadores básicos (+, -, *, /), valor absoluto (|) y fin de línea, pero el escáner manual además reconoce explícitamente los paréntesis de apertura y cierre (OP y CP), mientras que el generado con Flex no los contempla. 



### 5. ¿Puedes pensar en idiomas para los que flex no sería una buena herramienta para escribir un escaner? 

Principalmente, los idiomas donde Flex no es una buena herramienta para escribir un escáner serían idiomas como mandarín, japonés o coreano, donde la escritura es más compleja debido al uso de kanjis (en japonés), logogramas (Mandarín) y el alfabeto Hangul (Coreano).

Flex, en su implementación clásica, está diseñado para trabajar de forma óptima con conjuntos de caracteres simples como ASCII y con lenguajes que separan tokens por espacios o símbolos claros. En estos idiomas, un solo carácter puede representar una palabra entera o varios morfemas, lo que complica el análisis léxico y requiere soporte Unicode y algoritmos de segmentación más avanzados.

![Coreano-Japones-Mandarin](ejercicios/Ejercicio%201/Coreano-Japones-Mandarin.png)

### 6. Reescriba el programa de conteo de palabras en C. Ejecute algunos archivos grandes en ambas versiones. ¿Es la versión C notablemente más rápida?, ¿Fue mucho más dificil de depurar?

