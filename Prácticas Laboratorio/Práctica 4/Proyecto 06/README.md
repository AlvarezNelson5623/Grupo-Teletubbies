
Este archivo `README.md` explica la funcionalidad del programa `Max.asm`, su entrada y salida, y describe cada sección del código paso a paso.

# Max.asm

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

## Código

```asm
   @0
   D=M              // D = primer número (M[0])
   @1
   D=D-M            // D = primer número - segundo número (M[0] - M[1])
   @OUTPUT_FIRST
   D;JGT            // Si D > 0 (primer número es mayor), ir a OUTPUT_FIRST
   @1
   D=M              // Si no, D = segundo número (M[1])
   @OUTPUT_D
   0;JMP            // Ir a OUTPUT_D
(OUTPUT_FIRST)
   @0             
   D=M              // D = primer número (M[0])
(OUTPUT_D)
   @2
   M=D              // Guardar el número mayor en M[2]
(INFINITE_LOOP)
   @INFINITE_LOOP
   0;JMP            // Bucle infinito para detener la ejecución
