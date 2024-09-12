# Adder16

Este proyecto es parte del curso de **nand2tetris** y el libro **The Elements of Computing Systems** de Nisan y Schocken. El objetivo es implementar un sumador de 16 bits que realiza la suma de dos números binarios de 16 bits.

## Descripción

El **Adder16** toma dos números binarios de 16 bits como entrada y calcula la suma bit a bit, utilizando tanto **HalfAdder** como **FullAdder**. La salida es la suma de los dos números de entrada, y el acarreo más significativo se ignora.

### Entradas
- `a[16]`: Primer número de 16 bits a sumar.
- `b[16]`: Segundo número de 16 bits a sumar.

### Salidas
- `out[16]`: Resultado de la suma de `a` y `b`.

### Comportamiento
- El bit menos significativo (bit 0) se suma utilizando un **HalfAdder**.
- Los bits restantes (bits 1 a 15) se suman utilizando **FullAdder**, incorporando el acarreo del bit anterior.
- El acarreo del bit más significativo (bit 15) se ignora.

## Uso

### Instrucciones para simular el chip

1. Abre el simulador del hardware Hack en el proyecto **nand2tetris**.
2. Carga el archivo `Adder16.hdl`.
3. Carga un script de prueba o realiza pruebas manuales ingresando valores de 16 bits para `a` y `b`.
4. Ejecuta la simulación para verificar los resultados de la suma.

### Ejemplo de uso

Para sumar los números binarios `a = 0000000000000011` (3 en decimal) y `b = 0000000000000101` (5 en decimal), la salida será:

```bash
out = 0000000000001000  # (8 en decimal)

