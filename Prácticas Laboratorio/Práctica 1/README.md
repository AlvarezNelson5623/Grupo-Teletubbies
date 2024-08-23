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

# [Puerta Not](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Not.hdl)


**Cómo Funciona:** El circuito descrito en el código implementa una puerta NOT utilizando una puerta NAND. La puerta NOT toma una única entrada (`in`) y produce una salida (`out`) que es el complemento de la entrada.

**Descripción del Circuito**

1. **Puerta NAND**
- La puerta NAND toma la entrada `in` y produce una salida que es el resultado de la operación NAND.
- La operación NAND se define como el complemento de la operación AND. Por lo tanto, la salida de la puerta NAND será 0 solo si todas las entradas son 1; en cualquier otro caso, la salida será 1.

2. **Puerta NOT**
- La puerta NOT en este caso está implementada utilizando una puerta NAND con una sola entrada (`in`).
- La salida de la puerta NAND será `out`, que es el complemento de la entrada `in`.

3. **Salida Final (`out`)**
- La salida `out` será 1 si la entrada `in` es 0.
- La salida `out` será 0 si la entrada `in` es 1.

Lo anterior tambien aplica para [Not16](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Not16.hdl), solo que con 16 puertas.

# [Puerta Or](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Or.hdl)

**Cómo Funciona:** El circuito descrito en el código implementa una puerta OR utilizando puertas NOT y NAND. La puerta OR toma dos entradas (`a` y `b`) y produce una salida (`out`). La salida será 1 si al menos una de las entradas es 1; de lo contrario, será 0.

**Descripción del Circuito**

1. **Puerta NOT (para `a` y `b`)**
- Toma las entradas `a` y `b` por separado.
- La salida de la puerta NOT para `a` es `notAOut`, que es el complemento de `a` (es decir, si `a` es 0, `notAOut` será 1; si `a` es 1, `notAOut` será 0).
- La salida de la puerta NOT para `b` es `notBOut`, que es el complemento de `b` (es decir, si `b` es 0, `notBOut` será 1; si `b` es 1, `notBOut` será 0).

2. **Puerta NAND**
- La puerta NAND toma las salidas `notAOut` y `notBOut` de las puertas NOT.
- La salida de la puerta NAND es `out`, que es el resultado de la operación NAND aplicada a `notAOut` y `notBOut`.

3. **Operación de la Puerta NAND**
- La operación NAND produce una salida que es el complemento de la operación AND. Por lo tanto, la salida de la puerta NAND será 0 solo si ambas entradas son 1; en cualquier otro caso, la salida será 1.
- Esto coincide con la lógica de una puerta OR: la salida será 1 si al menos una de las entradas es 1.

4. **Salida Final (`out`)**
- La salida `out` será 1 si al menos una de las entradas (`a` o `b`) es 1.
- La salida `out` será 0 solo si ambas entradas (`a` y `b`) son 0.

Lo anterior tambien aplica para [Or16](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Or16.hdl) y [Or8Way.](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Or8Way.hdl)

# [Puerta Xor](https://github.com/AlvarezNelson5623/Grupo-Teletubbies/blob/main/Prácticas%20Laboratorio/Práctica%201/Xor.hdl)

**Cómo Funciona:** El circuito descrito en el código implementa una puerta XOR (Exclusive OR). La puerta XOR toma dos entradas (`a` y `b`) y produce una salida (`out`). La salida será 1 si exactamente una de las entradas es 1; si ambas entradas son iguales (ambas 0 o ambas 1), la salida será 0.

**Descripción del Circuito**

1. **Puertas NOT**

- **Puerta NOT para `a`:**
  - Toma la entrada `a`.
  - La salida es `nota`, que es el complemento de `a` (es decir, si `a` es 0, `nota` será 1; si `a` es 1, `nota` será 0).

- **Puerta NOT para `b`:**
  - Toma la entrada `b`.
  - La salida es `notb`, que es el complemento de `b` (es decir, si `b` es 0, `notb` será 1; si `b` es 1, `notb` será 0).

2. **Puertas AND** 

- **Puerta AND para `w1`:**
  - Toma las entradas `a` y `notb`.
  - La salida es `w1`, que será 1 solo si `a` es 1 y `notb` (complemento de `b`) también es 1. Esto ocurre cuando `a` es 1 y `b` es 0.

- **Puerta AND para `w2`:**
  - Toma las entradas `nota` (complemento de `a`) y `b`.
  - La salida es `w2`, que será 1 solo si `nota` es 1 y `b` es 1. Esto ocurre cuando `a` es 0 y `b` es 1.

3. **Puerta OR**

- **Puerta OR:**
  - Toma las salidas `w1` y `w2`.
  - La salida es `out`, que será 1 si al menos una de las entradas (`w1` o `w2`) es 1. 

4. **Operación de la Puerta OR**

- La salida `out` será 1 si exactamente una de las entradas `a` o `b` es 1.
- La salida será 0 si ambas entradas son iguales (ambas 0 o ambas 1).

5. **Salida Final (`out`)**

- La salida `out` será 1 si solo una de las entradas (`a` o `b`) es 1.
- La salida `out` será 0 si ambas entradas son iguales (ambas 0 o ambas 1).


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

