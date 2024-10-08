# Proyecto 4: Llenado de Pantalla (Fill.asm)

## 1. Codigo en formato .asm

Este proyecto consiste en escribir un programa en lenguaje ensamblador Hack que interactúa con el teclado y la pantalla. El programa monitorea el estado del teclado y cambia el color de la pantalla dependiendo de si se está presionando una tecla o no.

### Funcionalidad:
- **Cuando se presiona cualquier tecla**, el programa "pinta" toda la pantalla de negro (escribe `-1` en cada pixel).
- **Cuando no se presiona ninguna tecla**, la pantalla se borra, es decir, se llena de blanco (escribe `0` en cada pixel).

### Resumen del Algoritmo:
1. **Inicialización:**
   - Se almacena la dirección de inicio de la pantalla (`SCREEN`) en un registro para poder manipularla fácilmente durante el ciclo del programa.

2. **Monitoreo del teclado:**
   - El programa entra en un ciclo infinito en el que lee el estado del teclado a través de la memoria mapeada al hardware del teclado (`KBD`).
   - Si una tecla está presionada (cualquier valor diferente de cero en `KBD`), el programa configura el color de la pantalla en negro (`-1`).
   - Si no hay teclas presionadas (`KBD == 0`), la pantalla se configura en blanco (`0`).

3. **Escritura en la pantalla:**
   - Dependiendo del estado del teclado, el programa escribe el color seleccionado (blanco o negro) en todas las posiciones de la pantalla, una dirección de memoria a la vez.
   - La pantalla completa se representa desde la dirección de memoria `SCREEN` hasta `SCREEN + 24575`, cubriendo un total de 24576 posiciones (equivalente a 512 filas x 256 columnas de píxeles).

4. **Reinicio del ciclo:**
   - Después de llenar toda la pantalla, el programa reinicia la verificación del teclado y repite el proceso, manteniendo la pantalla actualizada continuamente.

## Estructura del Código:

- **Ciclo del teclado:** 
  Lee continuamente el estado del teclado (`KBD`) y almacena un valor en la variable `color` (negro o blanco).
  
- **Escritura en la pantalla:** 
  Recorrer cada dirección de la pantalla y escribir el valor de `color`.

- **Control de límites:** 
  Verifica que se haya recorrido toda la pantalla antes de reiniciar el ciclo.


## 2. Código en Formato .hack

**Archivo: `Fill.hack`**

### Descripción

Este archivo contiene el mismo programa que `Fill.asm`, pero en formato binario (.hack). Es el formato utilizado por el simulador de Nand2Tetris para ejecutar el programa.

### Funcionamiento

- Cada línea de 16 bits representa una instrucción o dato.
- El programa es ejecutado por el simulador, que interpreta estas instrucciones en el contexto del sistema de Nand2Tetris.
- El flujo del programa es el mismo que en el archivo ensamblador, realizando las mismas operaciones de lectura del teclado y actualización de la pantalla.

## 3. Archivo de Prueba (.tst)

**Archivo: `Fill.tst`**

### Descripción

Este archivo es un conjunto de pruebas diseñado para verificar el funcionamiento del programa en el simulador.

### Funcionamiento

- **Carga del Programa**:
  - Se carga el archivo `Fill.hack` en el simulador.

- **Instrucciones de Prueba**:
  - Se le indica al usuario que asegure que la opción "Sin Animación" esté seleccionada.
  - El usuario debe presionar y mantener presionada cualquier tecla para observar el efecto en la pantalla, que debe volverse negra.

- **Simulación del Tiempo**:
  - Un bucle `repeat` se utiliza para simular el paso del tiempo y permitir que el usuario vea cómo cambia la pantalla.

## Conclusiones

Cada parte del proyecto contribuye al funcionamiento global del programa. El código en ensamblador implementa la lógica, el archivo en formato binario permite la ejecución en el simulador, y el archivo de prueba verifica que el comportamiento sea el esperado.
