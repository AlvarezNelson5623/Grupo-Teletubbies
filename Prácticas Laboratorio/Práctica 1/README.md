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

Lo anterior aplica para [Puerta And16](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/And16.hdl) solo que con 16 puertas.

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

Lo anterior también aplica para [DMux4Way](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/DMux4Way.hdl) y [DMux8Way](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/DMux8Way.hdl), solo que cambia el número de entradas y salidas. 


# [Mux](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Mux.hdl)

**Cómo Funciona:** El circuito descrito en el código implementa un multiplexor (`Mux`). Este circuito toma dos entradas (`a` y `b`), un bit de selección (`sel`), y produce una salida (`out`). Dependiendo del valor de `sel`, la salida será igual a una de las dos entradas.

**Descripción del Circuito**

1. **Puerta NOT**
- Toma la entrada `sel`.
- La salida de la puerta NOT es `notSel`, que es el complemento de `sel` (es decir, si `sel` es 0, `notSel` será 1; si `sel` es 1, `notSel` será 0).

2. **Puerta AND (Primera Salida)**
- Toma las entradas `a` y `notSel`.
- La salida será 1 solo si ambas entradas (`a` y `notSel`) son 1. Esto ocurre cuando `sel` es 0, por lo que la salida de esta puerta será igual a `a`.

3. **Puerta AND (Segunda Salida)**
- Toma las entradas `b` y `sel`.
- La salida será 1 solo si ambas entradas (`b` y `sel`) son 1. Esto ocurre cuando `sel` es 1, por lo que la salida de esta puerta será igual a `b`.

4. **Puerta OR**
- Toma las salidas de las dos puertas AND anteriores (`and1Out` y `and2Out`).
- La salida final (`out`) será 1 si al menos una de las entradas (`and1Out` o `and2Out`) es 1. Esta salida será igual a `a` si `sel` es 0, o igual a `b` si `sel` es 1.

5. **Salida Final (`out`)**
Dependiendo del valor del bit `sel`:

- Si `sel = 0`: La salida `out` es igual a `a`.
- Si `sel = 1`: La salida `out` es igual a `b`.

Lo anterior tambien aplica para [Mux16](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Mux16.hdl) , [Mux4Way16](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Mux4Way16.hdl) y [Mux8Way16](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Mux8Way16.hdl), solo que cambia el número de entradas y salidas. 



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

