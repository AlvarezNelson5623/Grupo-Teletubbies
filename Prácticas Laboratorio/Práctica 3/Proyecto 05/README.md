# CPU de la Máquina Hack

## Descripción

El CPU es responsable de ejecutar instrucciones en el lenguaje máquina Hack. Utiliza una ALU (Unidad Aritmético-Lógica) y dos registros, `A` y `D`, junto con un contador de programa (`PC`) para gestionar el flujo de instrucciones. Además, el CPU puede interactuar con la memoria externa para leer o escribir valores en ubicaciones específicas.

### Entradas del CPU

- **inM[16]**: Valor de la memoria externa, es decir, el contenido en `RAM[A]`.
- **instruction[16]**: Instrucción actual a ejecutar.
- **reset**: Si es 1, el CPU reinicia la ejecución desde la dirección 0.

### Salidas del CPU

- **outM[16]**: Valor a escribir en la memoria (si la instrucción lo requiere).
- **writeM**: Bandera que indica si se debe escribir en la memoria (`1` para escribir, `0` para no escribir).
- **addressM[15]**: Dirección de memoria donde se realizará la lectura/escritura.
- **pc[15]**: Dirección de la siguiente instrucción a ejecutar (contador de programa).

## Instrucciones

El CPU puede ejecutar dos tipos de instrucciones:
1. **Instrucción tipo A** (bit 15 = 0): Carga un valor directo en el registro `A`.
2. **Instrucción tipo C** (bit 15 = 1): Realiza una operación aritmética o lógica usando la ALU, y puede almacenar los resultados en los registros `A`, `D` o la memoria `M`. También puede realizar saltos condicionales basados en el resultado de la ALU.

## Comportamiento

1. **Registro A**: Almacena direcciones o valores numéricos. Se actualiza si la instrucción lo requiere.
2. **Registro D**: Almacena valores para realizar cálculos. Se actualiza con el resultado de la ALU.
3. **PC (Program Counter)**: Controla la dirección de la siguiente instrucción. Se incrementa automáticamente, a menos que se realice un salto condicional o se reinicie con el `reset`.
4. **ALU**: Realiza operaciones aritméticas y lógicas entre el registro `D` y el registro `A` o la entrada de memoria `inM`.

### Saltos condicionales

El CPU puede realizar saltos condicionales basados en el resultado de la ALU:
- Si el resultado es **cero**, negativo o positivo, dependiendo de los bits `j1`, `j2` y `j3` de la instrucción, se puede modificar el `PC` para cambiar el flujo de ejecución.

## Uso del Proyecto

1. **Simulación**: Puedes cargar el archivo `CPU.hdl` en el simulador del hardware Hack para verificar su funcionamiento. El simulador debe mostrar las operaciones que realiza el CPU según las instrucciones de entrada.
   
2. **Pruebas**: Se incluyen scripts de prueba (`CPU.tst`) y archivos de salida esperados (`CPU.cmp`). Para probar el CPU:
   - Carga el archivo `CPU.tst` en el simulador.
   - Ejecuta las pruebas y verifica los resultados comparando la salida con el archivo `CPU.cmp`.

3. **Reseteo**: Si la entrada `reset` está activa (1), el CPU restablecerá el contador de programa a 0, comenzando nuevamente la ejecución del programa desde el inicio.

## Estructura del Proyecto

- `CPU.hdl`: Archivo que describe la arquitectura del CPU.
- `CPU.tst`: Script de prueba para verificar el funcionamiento del CPU que es proporcionado por el software.
- `CPU.cmp`: Archivo con los resultados esperados de la prueba que de igual manera es proporcionado por el software.

# Proyecto Hack: Componente de Memoria

Este proyecto implementa el **componente de Memoria** para la computadora Hack, incluyendo la **RAM**, el **mapa de memoria de la pantalla** (Screen) y el **mapa de memoria del teclado** (Keyboard). Este archivo es parte del curso de sistemas de cómputo que utiliza el libro "The Elements of Computing Systems" por Nisan y Schocken.

## Descripción General

El chip de **Memoria** se encarga de la lectura y escritura en la memoria de la computadora Hack. Está dividido en tres secciones principales:

1. **RAM**: La memoria principal del sistema, abarca desde la dirección `0x0000` hasta `0x3FFF` (16K).
2. **Memoria de Pantalla (Screen Memory Map)**: Utiliza el rango de direcciones `0x4000` hasta `0x5FFF` (8K) y está asignada a los píxeles de la pantalla.
3. **Memoria del Teclado (Keyboard Memory Map)**: Se encuentra en la dirección `0x6000` y contiene el valor de la tecla presionada.

### Funcionalidad

El chip permite tanto operaciones de lectura como de escritura en la memoria:

- **Lectura**: El chip siempre devuelve el valor almacenado en la dirección de memoria especificada por la señal `address`.
- **Escritura**: Si la señal `load` es 1, el valor de la entrada `in` se escribe en la memoria en la dirección especificada por `address`.

### Acceso a la Memoria

- Si el valor del bit 14 de la dirección (`address[14]`) es 0, se accede a la **RAM**.
- Si el valor del bit 14 es 1 y el bit 13 es 0, se accede a la **memoria de la pantalla**.
- Si el valor del bit 14 es 1 y el bit 13 es 1, se accede al **teclado**.

### Organización de los Componentes

1. **RAM**: Implementada como un bloque de 16K de memoria.
2. **Pantalla**: Controla la representación visual en la pantalla usando un mapa de bits. Las posiciones de la memoria representan los píxeles.
3. **Teclado**: Registra la tecla actualmente presionada en la computadora Hack.

### Multiplexores

El chip utiliza **multiplexores** para seleccionar entre las diferentes partes de la memoria según el valor de los bits 13 y 14 de la dirección. 

1. Si `address[14] == 0`, se selecciona la RAM.
2. Si `address[14] == 1`, se selecciona la memoria de pantalla o el teclado, dependiendo del valor de `address[13]`.

## Detalles Técnicos

- **Entradas**:
  - `in[16]`: Datos a escribir en la memoria.
  - `load`: Señal de control para escribir en la memoria.
  - `address[15]`: Dirección de memoria de 15 bits.

- **Salidas**:
  - `out[16]`: Datos leídos de la memoria.

## Ejecución

1. Cuando se da una dirección de memoria, el chip determina si se debe leer o escribir en la **RAM**, el **mapa de la pantalla**, o el **teclado**.
2. Si la operación es de escritura (`load = 1`), el valor en `in` se almacena en la dirección especificada.
3. Los datos almacenados se pueden recuperar a través de la salida `out` en el siguiente ciclo de tiempo.

## Conclusión

Este componente de memoria es esencial para la arquitectura de la computadora Hack, proporcionando acceso a la memoria principal (RAM), controlando la salida visual (Pantalla) y permitiendo la interacción del usuario a través del teclado. La implementación sigue las especificaciones del sistema Hack y gestiona eficientemente los recursos de memoria de la computadora.


# Proyecto: Computadora Hack
El propósito es construir una implementación de la **Computadora Hack**, una arquitectura simple basada en el diseño de von Neumann.

## Descripción

La **Computadora Hack** está compuesta por tres componentes principales:
- **CPU**: Procesa instrucciones y realiza operaciones aritméticas/lógicas.
- **ROM**: Memoria de solo lectura que contiene el programa a ejecutar (tamaño: 32K palabras).
- **RAM**: Memoria de acceso aleatorio para almacenar datos temporales durante la ejecución del programa.

El sistema permite cargar un programa en la ROM, ejecutar el programa en la CPU, y manipular datos en la RAM.

### Componentes

1. **CPU.hdl**: La unidad central de procesamiento que ejecuta instrucciones.
2. **Memory.hdl**: La memoria del sistema, incluyendo la RAM y la ROM.
3. **Computer.hdl**: El archivo principal que integra todos los componentes, conectando la CPU, la RAM y la ROM.

### Entradas y Salidas

- **Entrada `reset`**: Se utiliza para reiniciar la ejecución del programa.
  - `reset = 1`: Reinicia la ejecución del programa desde la primera instrucción.
  - `reset = 0`: Continúa la ejecución desde la última instrucción.

- **Salida `outM`**: Contiene el valor que la CPU está enviando a la RAM.
- **Salida `writeM`**: Señal de control para escribir en la RAM.
- **Entrada/Salida `addressM`**: Dirección de memoria para leer o escribir datos en la RAM.

## Instrucciones para la Ejecución

1. Carga el archivo `Computer.hdl` en el simulador de hardware.
2. Carga un archivo de prueba que contenga las instrucciones a ejecutar en la ROM.
3. Inicia la simulación y observa cómo la CPU ejecuta el programa y manipula la memoria.

## Ejecución de un Programa

El programa a ejecutar se almacena en la **ROM32K**, que es una memoria de solo lectura de 32K palabras. Cuando `reset` es 0, el programa comienza a ejecutarse desde la dirección indicada por el contador de programa (`pc`). La CPU leerá las instrucciones desde la ROM y ejecutará las operaciones correspondientes.

### Reinicio del Programa

Si `reset` es 1, la ejecución del programa se reinicia desde la primera instrucción de la ROM.



