# Guardar el contenido del README en un archivo readme.md

contenido_readme = """
# Proyecto 4: Llenado de Pantalla (Fill.asm)

## Descripción del Proyecto

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

## Instrucciones para ejecutar:

1. Carga el archivo `Fill.asm` en el ensamblador de Nand2Tetris.
2. Ensambla el código para generar el archivo `.hack`.
3. Carga el archivo `.hack` en la máquina virtual o simulador Hack.
4. Ejecuta el programa:
   - Si presionas cualquier tecla, la pantalla se llenará de negro.
   - Si no presionas ninguna tecla, la pantalla se vaciará y quedará en blanco.

## Notas Técnicas:

- La dirección de inicio de la pantalla está mapeada en la constante `SCREEN`, y cada píxel de la pantalla corresponde a una dirección de memoria consecutiva.
- El teclado está mapeado en la constante `KBD`. Si el valor en esta dirección es diferente de `0`, significa que se ha presionado una tecla.
- El valor `0` en la pantalla representa un píxel blanco, mientras que `-1` representa un píxel negro.
"""

# Crear el archivo readme.md
ruta_archivo = "/mnt/data/readme.md"
with open(ruta_archivo, "w") as archivo:
    archivo.write(contenido_readme)

ruta_archivo
