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

### Puerta Not

- **Descripción**: Hacer una puerta Not usando una puerta NAND es sencillo.
- **Consejo**: Piensa en positivo.


### Puertas Or/Xor

- **Descripción**: Estas funciones se pueden construir utilizando las puertas anteriores y algunas operaciones simples.
- **Nota**: Con estas puertas básicas, puedes crear puertas más complejas.

### Multiplexor/Demultiplexor

- **Descripción**: Estas puertas se pueden construir usando las puertas ya creadas.

### Puertas Multi-Bit (Not/And/Or)

- **Descripción**: Como ya sabes cómo hacer las versiones básicas, crear versiones que manejen varios bits solo requiere construir varias puertas básicas, haciendo que cada una trabaje con un bit diferente.
- **Nota**: Aunque repetitivo, este paso será crucial para su uso en chips más complejos, que se detallarán más adelante.

### Multiplexor Multi-Bit

- **Descripción**: Implementar un multiplexor para varios bits solo implica usar el mismo bit de selección para cada puerta.

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

