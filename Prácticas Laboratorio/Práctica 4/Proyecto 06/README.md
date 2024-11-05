
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

