# Proyecto 2: Lógica Aritmética
En este proyecto, construiremos circuitos combinacionales básicos, utilizados para realizar operaciones aritméticas y lógicas. El objetivo principal es diseñar y construir una Unidad Aritmético-Lógica (ALU), que pueda ejecutar diversas operaciones necesarias en una CPU, como suma, resta, AND, OR, entre otras.

## Objetivos
1. Implementar componentes básicos de aritmética como el Half Adder y Full Adder.
2. Desarrollar una Unidad Aritmético-Lógica (ALU) capaz de realizar operaciones fundamentales.
3. Familiarizarse con la lógica combinacional, donde las salidas dependen únicamente de las entradas actuales.

## Componentes a construir
- **Half Adder**: Circuito para sumar dos bits.
- **Full Adder**: Circuito para sumar tres bits (dos bits y un acarreo).
- **ALU**: Implementar una ALU que ejecute operaciones aritméticas y lógicas según lo requerido por las instrucciones dadas.

## Instrucciones de desarrollo
1. Usar el simulador provisto por el curso Nand2Tetris.
2. Seguir las especificaciones de los chips y componentes descritos en el proyecto.
3. Asegurarse de que todos los chips pasen las pruebas automáticas del simulador.

---

# Proyecto 3: Lógica Secuencial
Este proyecto introduce la lógica secuencial, que es fundamental para la creación de memoria en sistemas digitales. A diferencia de la lógica combinacional, la lógica secuencial depende del estado anterior, lo que permite almacenar información. Implementaremos varios componentes de memoria y construiremos la memoria RAM básica, que es esencial en cualquier computadora.

## Objetivos
1. Comprender la lógica secuencial y la dependencia de estados anteriores en los circuitos.
2. Implementar flip-flops y registros, los componentes básicos de almacenamiento de datos.
3. Diseñar memoria RAM y contadores usando flip-flops y registros.

## Componentes a construir
- **D-Flip-Flop**: Un flip-flop que almacena un bit de información.
- **Registro**: Conjunto de flip-flops que almacenan múltiples bits.
- **RAM**: Memoria de acceso aleatorio capaz de almacenar una cantidad significativa de datos.
- **Contador**: Circuito secuencial que cuenta en pasos definidos por una señal de reloj.

## Instrucciones de desarrollo
1. Implementar los componentes siguiendo las especificaciones del proyecto usando el simulador.
2. Asegurarse de que los componentes pasen todas las pruebas automáticas.
3. Completar la construcción de la memoria RAM y verificar su correcto funcionamiento.

---

## Herramientas requeridas
- Simulador de hardware Nand2Tetris (incluido en el curso).
- Archivos HDL para cada componente del proyecto.

## Cómo ejecutar las pruebas
1. Descargue o utilice el simulador online desde [Nand2Tetris](https://www.nand2tetris.org/software).
2. Cargue los archivos `.hdl` correspondientes a cada componente en el simulador.
3. Ejecute las pruebas automáticas proporcionadas para verificar el funcionamiento correcto de cada chip.

# Diferencias entre Lógica Aritmética y Lógica Secuencial

En la ingeniería de sistemas y la computación, es fundamental entender las diferencias entre los distintos tipos de lógica utilizados en el diseño de circuitos digitales. Las dos categorías principales son la lógica aritmética y la lógica secuencial. A continuación, se detallan sus diferencias clave y aplicaciones.

## Lógica Aritmética

### Definición
La lógica aritmética se refiere a los circuitos y operaciones que realizan cálculos matemáticos básicos como suma, resta, multiplicación, y división. Estos circuitos trabajan con operaciones binarias y son esenciales en la construcción de unidades aritmético-lógicas (ALU) de los procesadores.

### Características Principales
- **Operaciones Combinacionales**: Los resultados dependen únicamente de los valores actuales de las entradas.
- **No tiene Memoria**: No retiene información de operaciones previas.
- **Ejemplos Comunes**: Sumas, restas, multiplicaciones, divisiones, operaciones lógicas como AND, OR, XOR.
- **Aplicaciones**: Procesamiento de datos, cálculos matemáticos en computadoras y sistemas embebidos.

### Ejemplo de Circuitos
- **Sumador**: Un circuito que suma dos números binarios.
- **Multiplicador**: Un circuito que realiza la multiplicación de números binarios.

## Lógica Secuencial

### Definición
La lógica secuencial se refiere a los circuitos que dependen no solo de las entradas actuales sino también del estado previo del sistema. Estos circuitos tienen memoria y pueden retener información, lo cual es esencial para el control de procesos y la ejecución de secuencias de instrucciones.

### Características Principales
- **Dependencia del Estado**: Los resultados dependen de las entradas actuales y del estado previo.
- **Tiene Memoria**: Retiene información a través de flip-flops o registros.
- **Ejemplos Comunes**: Flip-flops, registros, contadores, máquinas de estado.
- **Aplicaciones**: Control de procesos, almacenamiento de datos, sincronización de señales, diseño de máquinas de estado.

### Ejemplo de Circuitos
- **Flip-Flop**: Almacena un solo bit de información.
- **Contador**: Incrementa o decrementa un valor en función de una señal de reloj.

## Diferencias Clave

| Característica       | Lógica Aritmética                          | Lógica Secuencial                        |
|---------------------|--------------------------------------------|------------------------------------------|
| Dependencia         | Solo de las entradas actuales              | De las entradas y del estado anterior    |
| Memoria             | No tiene memoria                           | Tiene memoria                            |
| Tipo de Operaciones | Combinacionales (aritméticas y lógicas)    | Secuenciales (almacenamiento y control)  |
| Ejemplos            | Sumadores, restadores, multiplicadores     | Flip-flops, contadores, registros        |
| Aplicaciones        | Cálculos matemáticos, ALU de procesadores  | Control de procesos, almacenamiento de datos |

## Conclusión

La lógica aritmética y la lógica secuencial juegan roles fundamentales y complementarios en el diseño de circuitos digitales. Mientras que la lógica aritmética se centra en el procesamiento de datos, la lógica secuencial se ocupa del control y almacenamiento de información, permitiendo la creación de sistemas complejos y dinámicos.


## Recursos adicionales y referencias
- Documentación del curso Nand2Tetris: [nand2tetris.org](https://www.nand2tetris.org).
- Foros de soporte del curso: [Foros de Nand2Tetris](https://www.nand2tetris.org/forums).
- Lógica aritmetica: [Lógica aritmetica wikipedia](https://es.wikipedia.org/wiki/Unidad_aritm%C3%A9tica_l%C3%B3gica)
- Lógica secuencial: [Lógica secuencial](https://electronicwebeasy.es.tl/LOGICA-SECUENCIAL.htm)

