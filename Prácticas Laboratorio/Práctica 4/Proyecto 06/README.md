
# Max.asm
explica la funcionalidad del programa `Max.asm`, su entrada y salida, y describe cada sección del código paso a paso.

## Descripción

Este programa en ensamblador para la **Computadora Hack** compara dos números almacenados en las direcciones de memoria `M[0]` y `M[1]`, y almacena el valor mayor en `M[2]`.

## Entrada

- `M[0]`: Primer número.
- `M[1]`: Segundo número.

## Salida

- `M[2]`: El mayor de los dos números, almacenado en esta dirección de memoria.

## Explicación del Código

1. **Cargar primer número**: Se carga el valor de `M[0]` en el registro `D`.
2. **Comparación**: Se resta el valor en `M[1]` del valor en `D`.
   - Si el resultado es positivo (`D > 0`), significa que `M[0]` es mayor, por lo que el flujo se dirige a `OUTPUT_FIRST`.
   - Si el resultado es cero o negativo, significa que `M[1]` es mayor o igual a `M[0]`.
3. **Almacenar el valor mayor**:
   - Si `M[0]` es mayor, se carga en `D` y se guarda en `M[2]`.
   - Si `M[1]` es mayor o igual, se carga en `D` y se guarda en `M[2]`.
4. **Bucle infinito**: Al final, el programa entra en un bucle infinito para detener la ejecución.

## Resultados Esperados

- Si `M[0]` es mayor que `M[1]`, entonces `M[2]` contendrá el valor de `M[0]`.
- Si `M[1]` es mayor o igual a `M[0]`, entonces `M[2]` contendrá el valor de `M[1]`.
- El programa se detiene en un bucle infinito tras almacenar el valor mayor.

# Rect.asm

Este archivo proporciona toda la información necesaria, los resultados esperados en varios casos y la explicación detallada del funcionamiento.


## Descripción

Este programa en ensamblador para la **Computadora Hack** dibuja un rectángulo de 16 píxeles de ancho y una altura de `R0` píxeles en la esquina superior izquierda de la pantalla.

## Entrada

- `R0`: Representa la altura del rectángulo. El valor en `R0` define el número de líneas que compondrán la altura del rectángulo.

## Salida

- Un rectángulo de 16 píxeles de ancho y `R0` píxeles de alto se dibuja en la esquina superior izquierda de la pantalla.

## Explicación del Código

1. **Carga de la altura**: Se carga el valor de `R0` en el registro `D`. Si el valor en `R0` es menor o igual a 0, se salta al bucle infinito (`INFINITE_LOOP`) y el programa se detiene.
2. **Inicialización de contadores**:
   - `counter` se establece con el valor de `R0` para llevar la cuenta de las líneas dibujadas.
   - `address` se inicializa con la dirección de inicio de la pantalla (`SCREEN`), que corresponde al primer píxel en la esquina superior izquierda.
3. **Bucle de dibujo (`LOOP`)**:
   - Escribe un valor de `-1` en la dirección actual (`address`), lo que enciende los primeros 16 píxeles de la fila.
   - Calcula la dirección de la siguiente fila sumando 32 a la dirección actual (ya que la pantalla tiene 32 palabras por fila).
   - Actualiza `address` y decrementa `counter` en 1.
   - Si `counter` es mayor que 0, vuelve al inicio de `LOOP` para dibujar la siguiente fila.
4. **Bucle infinito**: Una vez que se completa el dibujo del rectángulo, el programa entra en un bucle infinito (`INFINITE_LOOP`) para detener la ejecución.

## Resultados Esperados
1 Caso R0 = 5:
Se dibujará un rectángulo de 16 píxeles de ancho y 5 filas de alto en la esquina superior izquierda de la pantalla.

2 Caso R0 = 0 o R0 < 0:
No se dibujará nada en la pantalla, ya que el programa se detendrá en el bucle infinito sin realizar ninguna operación de dibujo.

3 Caso R0 = 20:
Se dibujará un rectángulo de 16 píxeles de ancho y 20 filas de alto en la esquina superior izquierda de la pantalla.


# Pong.asm

Este archivo incluye todo el contenido solicitado, con la descripción del código, la explicación de su lógica y los resultados esperados para diferentes situaciones en el juego.


## Descripción

El programa `Pong.asm` está diseñado para ejecutar una versión básica del juego de Pong en la **Computadora Hack**. Este programa mueve un rectángulo en la pantalla en respuesta a la posición de una paleta controlada por el usuario y hace que el rectángulo rebote cuando alcanza los bordes de la pantalla.

## Entrada

- El usuario controla la paleta con las teclas de flecha en el teclado.
  - **Tecla de flecha hacia arriba**: Mueve la paleta hacia arriba.
  - **Tecla de flecha hacia abajo**: Mueve la paleta hacia abajo.

## Salida

- La pantalla muestra un rectángulo móvil (la "bola") que rebota en los bordes de la pantalla y una paleta controlada por el usuario.
- Si el rectángulo pasa la paleta sin ser bloqueado, el juego termina.

## Explicación del Código

1. **Inicialización**: El programa configura la posición inicial de la bola y la paleta, así como la velocidad y dirección inicial de la bola.
  
2. **Bucle Principal (`GAME_LOOP`)**:
   - En cada iteración del bucle, el programa actualiza la posición de la bola y revisa si ha llegado a los límites de la pantalla:
     - **Colisión con los bordes verticales**: Si la bola alcanza el borde superior o inferior de la pantalla, la dirección vertical se invierte.
     - **Colisión con los bordes horizontales**: Si la bola llega al borde izquierdo, se verifica si la paleta está alineada para bloquear la bola. Si no lo está, el juego termina.
  
3. **Control de la Paleta**:
   - El programa revisa las teclas presionadas por el usuario en cada iteración del bucle para mover la paleta hacia arriba o hacia abajo.

4. **Actualización de Pantalla**:
   - La pantalla se actualiza con la nueva posición de la bola y la paleta. Cada píxel encendido representa una posición de la bola o de la paleta.

5. **Bucle Infinito al Final del Juego (`END_GAME`)**:
   - Si el jugador pierde (es decir, si la bola pasa la paleta sin ser bloqueada), el programa entra en un bucle infinito, terminando efectivamente el juego.

## Resultados Esperados
Dependiendo de las acciones del usuario y la posición de la paleta, el juego arroja distintos resultados:

1. Caso: La bola es bloqueada por la paleta:
La bola rebota y continúa en dirección opuesta.

2. Caso: La bola pasa la paleta:
El juego termina y el programa entra en un bucle infinito (END_GAME).

3. Movimiento de la paleta:
La paleta sigue las teclas de flecha del teclado en tiempo real, permitiendo al usuario alinearse para bloquear la bola.

