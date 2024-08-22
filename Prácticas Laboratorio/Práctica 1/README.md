# **_Practica 1: Introducción al Curso_**
Explicación del Desarrollo de la práctica ![Badge Finalizado](https://img.shields.io/badge/STATUS-FINALIZADO-green)
# Compuertas: Implementación

Las compuertas logicas son los bloques fundamentales que permiten construir cualquier cosa, similar a los axiomas en matemáticas. Estas puertas vienen listas para usarse, permitiendo que crees otras puertas y chips sin preocuparte por su funcionamiento interno. En el diseño de la computadora que estamos iniciando, hemos decidido basar todo en una sola puerta primitiva: la puerta NAND. Aquí comenzaremos a explicar la primera fase de este proyecto, construyendo el hardware puerta por puerta.


## [Puerta And](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Pr%C3%A1cticas%20Laboratorio/Pr%C3%A1ctica%201/And.hdl)
 **Cómo Funciona:** El circuito descrito en el código implementa una puerta AND utilizando puertas NAND y NOT.
**Descripción del Circuito**
1. **Puerta NAND:**
   - Toma las entradas `a` y `b`.
   - La salida de la puerta NAND será 1 si al menos una de las entradas es 0. Solo será 0 si ambas entradas son 1.
2. **Puerta NOT:**
   - La salida de la puerta NAND (`out1`) se pasa a una puerta NOT.
   - La puerta NOT invierte esta salida.
3. **Salida Final:**
   - La salida final del circuito será 1 solo si ambas entradas originales (`a` y `b`) son 1.

## [Puerta And16](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/And16.hdl)
**Cómo Funciona:** El circuito descrito en el código implementa una puerta AND de 16 bits, utilizando 16 puertas AND simples.

**Descripción del Circuito**

1. **Puerta AND**
   - Para cada par de bits (`a[i]` y `b[i]`):
   - Toma las entradas `a[i]` y `b[i]`.
   - La salida de la puerta AND será 1 si ambas entradas son 1. Será 0 si al menos una de las entradas es 0.

2. **Salida Final (`out[16]`)**
   - La salida final del circuito (`out[i]`) será 1 solo si ambos bits originales (`a[i]` y `b[i]`) son 1.
   - La salida es un vector de 16 bits donde cada bit es el resultado de la operación AND de los bits correspondientes de las entradas.

## [DMux](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/DMux.hdl)

**Cómo Funciona:** El circuito descrito en el código implementa un demultiplexor (DMux), que toma una entrada (`in`) y un bit de selección (`sel`). Dependiendo del valor de `sel`, el demultiplexor direcciona la señal de entrada hacia una de las dos salidas (`a` o `b`).

**Descripción del Circuito**

1. **Puerta NOT**
- Toma la entrada `sel`.
- La salida de la puerta NOT es `notsel`, que es el complemento de `sel` (es decir, si `sel` es 0, `notsel` será 1, y si `sel` es 1, `notsel` será 0).

2. **Puerta AND (Salida `a`)**
- Toma las entradas `notsel` y `in`.
- La salida será 1 solo si ambas entradas (`notsel` y `in`) son 1. Dado que `notsel` es el complemento de `sel`, esta salida será 1 si `sel` es 0 y `in` es 1.

3. **Puerta AND (Salida `b`)**
- Toma las entradas `sel` y `in`.
- La salida será 1 solo si ambas entradas (`sel` y `in`) son 1. Esto significa que `b` será 1 si `sel` es 1 y `in` es 1.

4. **Salida Final (`a` y `b`)**
- Si `sel` es 0:
  - `a` recibe el valor de `in`, y `b` es 0.
- Si `sel` es 1:
  - `b` recibe el valor de `in`, y `a` es 0.

## [DMux4Way](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/DMux4Way.hdl)

**Cómo Funciona:** El circuito descrito en el código implementa un demultiplexor de 4 vías (`DMux4Way`). Este circuito toma una única entrada (`in`) y un selector de 2 bits (`sel`), y direcciona la señal de entrada a una de las cuatro salidas (`a`, `b`, `c`, `d`). Dependiendo del valor de `sel`, la entrada `in` se envía a una de las salidas, mientras que las demás salidas reciben un valor de 0.

**Descripción del Circuito**

1. **Demultiplexor `DMux` (Primera Etapa)**
- La primera etapa del circuito utiliza un demultiplexor (`DMux`) para dividir la señal `in` en dos señales (`ab` y `cd`) basadas en el valor del bit más significativo de `sel` (`sel[1]`).
- Si `sel[1]` es 0, la señal `in` se direcciona hacia `ab` (y `cd` es 0).
- Si `sel[1]` es 1, la señal `in` se direcciona hacia `cd` (y `ab` es 0).

2. **Demultiplexores `DMux` (Segunda Etapa)**
- La segunda etapa consta de dos demultiplexores adicionales que toman las salidas `ab` y `cd` de la primera etapa y las dividen en las salidas finales (`a`, `b`, `c`, `d`), según el valor del bit menos significativo de `sel` (`sel[0]`).
- El primer `DMux` divide `ab` en las salidas `a` y `b`:
  - Si `sel[0]` es 0, `ab` se direcciona hacia `a` (y `b` es 0).
  - Si `sel[0]` es 1, `ab` se direcciona hacia `b` (y `a` es 0).
- El segundo `DMux` divide `cd` en las salidas `c` y `d`:
  - Si `sel[0]` es 0, `cd` se direcciona hacia `c` (y `d` es 0).
  - Si `sel[0]` es 1, `cd` se direcciona hacia `d` (y `c` es 0).

3. **Salida Final (`a`, `b`, `c`, `d`)**
Dependiendo del valor de los bits de `sel`:

- Si `sel = 00`: `in` se direcciona a `a`, y `b`, `c`, `d` son 0.
- Si `sel = 01`: `in` se direcciona a `b`, y `a`, `c`, `d` son 0.
- Si `sel = 10`: `in` se direcciona a `c`, y `a`, `b`, `d` son 0.
- Si `sel = 11`: `in` se direcciona a `d`, y `a`, `b`, `c` son 0.

## [DMux8Way](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/DMux8Way.hdl)

**Cómo Funciona:** El circuito descrito en el código implementa un demultiplexor de 8 vías (`DMux8Way`). Este circuito toma una única entrada (`in`) y un selector de 3 bits (`sel`), y direcciona la señal de entrada a una de las ocho salidas (`a`, `b`, `c`, `d`, `e`, `f`, `g`, `h`). Dependiendo del valor de `sel`, la entrada `in` se envía a una de las salidas, mientras que las demás salidas reciben un valor de 0.

**Descripción del Circuito**

1. **Demultiplexor `DMux` (Primera Etapa)**

- La primera etapa del circuito utiliza un demultiplexor (`DMux`) para dividir la señal `in` en dos señales (`abcd` y `efgh`) basadas en el valor del bit más significativo de `sel` (`sel[2]`).
  - Si `sel[2]` es 0, la señal `in` se direcciona hacia `abcd` (y `efgh` es 0).
  - Si `sel[2]` es 1, la señal `in` se direcciona hacia `efgh` (y `abcd` es 0).

2. **Demultiplexores `DMux4Way` (Segunda Etapa)**

- La segunda etapa consta de dos demultiplexores de 4 vías (`DMux4Way`), que toman las salidas `abcd` y `efgh` de la primera etapa y las dividen en las salidas finales (`a`, `b`, `c`, `d`, `e`, `f`, `g`, `h`), según los dos bits menos significativos de `sel` (`sel[0..1]`).
  - El primer `DMux4Way` divide `abcd` en las salidas `a`, `b`, `c`, `d`:
    - Si `sel[0..1]` es 00, `abcd` se direcciona hacia `a` (y `b`, `c`, `d` son 0).
    - Si `sel[0..1]` es 01, `abcd` se direcciona hacia `b` (y `a`, `c`, `d` son 0).
    - Si `sel[0..1]` es 10, `abcd` se direcciona hacia `c` (y `a`, `b`, `d` son 0).
    - Si `sel[0..1]` es 11, `abcd` se direcciona hacia `d` (y `a`, `b`, `c` son 0).
  - El segundo `DMux4Way` divide `efgh` en las salidas `e`, `f`, `g`, `h`:
    - Si `sel[0..1]` es 00, `efgh` se direcciona hacia `e` (y `f`, `g`, `h` son 0).
    - Si `sel[0..1]` es 01, `efgh` se direcciona hacia `f` (y `e`, `g`, `h` son 0).
    - Si `sel[0..1]` es 10, `efgh` se direcciona hacia `g` (y `e`, `f`, `h` son 0).
    - Si `sel[0..1]` es 11, `efgh` se direcciona hacia `h` (y `e`, `f`, `g` son 0).

3. **Salida Final (`a`, `b`, `c`, `d`, `e`, `f`, `g`, `h`)**

   Dependiendo del valor de los bits de `sel`:
   
   - Si `sel = 000`: `in` se direcciona a `a`, y `b`, `c`, `d`, `e`, `f`, `g`, `h` son 0.
   - Si `sel = 001`: `in` se direcciona a `b`, y `a`, `c`, `d`, `e`, `f`, `g`, `h` son 0.
   - Si `sel = 010`: `in` se direcciona a `c`, y `a`, `b`, `d`, `e`, `f`, `g`, `h` son 0.
   - Si `sel = 011`: `in` se direcciona a `d`, y `a`, `b`, `c`, `e`, `f`, `g`, `h` son 0.
   - Si `sel = 100`: `in` se direcciona a `e`, y `a`, `b`, `c`, `d`, `f`, `g`, `h` son 0.
   - Si `sel = 101`: `in` se direcciona a `f`, y `a`, `b`, `c`, `d`, `e`, `g`, `h` son 0.
   - Si `sel = 110`: `in` se direcciona a `g`, y `a`, `b`, `c`, `d`, `e`, `f`, `h` son 0.
   - Si `sel = 111`: `in` se direcciona a `h`, y `a`, `b`, `c`, `d`, `e`, `f`, `g` son 0.

# Preguntas Adicionales


### 1. ¿Que consideraciones importantes debe tener en cuenta para trabajar con Nand2Tetris?                                                                                                                                             
<p align="justify"> Los usuarios que deseen trabajar con Nand2Tetris deben de contar con una base solida en logica digital esto incluye el funcionamiento de puertas logicas tales como AND, OR, NOT, NAND, etc asi mismo debe de tener conocimientos en algebra booleana y la construccion de circuitos combinacionales y secuenciales. Ademas es importante estar familiarizado con conceptos basicos de arquitectura de computadores, como la organizacion de una CPU, memoria, bases de datos, etc.
</p> 
   
### 3. ¿Qué otras herramientas similares a Nand2Tetris existen?                                                                                                                                             
![logisim-icon-512 (1)](https://github.com/user-attachments/assets/38d477ea-81ad-4431-9a47-b5368e67ab32) 
**_Logisim_** : <p align="justify">Es una herramientra grafica de codigo abierto que permite diseñar circuitos y simular sus comportamientos para facilitar su entendimiento.
</p>        
<br>

![images (1)](https://github.com/user-attachments/assets/35699bde-53a2-494d-903d-748f73343f80)
 <p align="justify">Es una herramienta de codigo abierto en la cual se pueden cargar y crear funciones para diferentes tipos de circuitos mediante el uso de funciones booleanas y logicas.
</p> 

# Referencias:
[Documentacion Arduino](https://www.arduino.cc/)

[Documentacion Logisim](https://es.wikipedia.org/wiki/Logisim)

[Documentacion Tetris](https://medium.com/@misbah.anwar/from-nand-to-tetris-nand2tetris-project-1-logic-gates-8de7044de4b4)

[Documentacion Implementacion](https://www.nand2tetris.org/_files/ugd/44046b_f2c9e41f0b204a34ab78be0ae4953128.pdf)

