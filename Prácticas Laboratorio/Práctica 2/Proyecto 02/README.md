# Implementación de la ALU

Se Implementó una ALU (Unidad Aritmética Lógica) de 16 bits que realiza varias operaciones sobre dos entradas de 16 bits `x` y `y`, basadas en seis bits de control, y proporciona dos salidas de estado.

## Funcionalidad

La ALU puede realizar las siguientes funciones según los bits de control:

- **zx (poner x en cero)**: Si es `1`, establece `x = 0`.
- **nx (negar x)**: Si es `1`, niega la entrada `x`.
- **zy (poner y en cero)**: Si es `1`, establece `y = 0`.
- **ny (negar y)**: Si es `1`, niega la entrada `y`.
- **f (selección de función)**: Si es `1`, calcula `out = x + y`. Si es `0`, calcula `out = x & y`.
- **no (negar salida)**: Si es `1`, niega el valor de salida `out`.

### Salidas de Estado
- **out[16]**: El resultado de 16 bits de la operación en las entradas `x` y `y`.
- **zr**: `1` si `out == 0`, de lo contrario `0`.
- **ng**: `1` si `out < 0`, de lo contrario `0`.

## Operaciones de la ALU

La ALU realiza los siguientes pasos:

1. Poner en cero o negar `x` y `y` dependiendo de los bits de control `zx`, `nx`, `zy`, `ny`.
2. Aplicar la función seleccionada (`x + y` o `x & y`), determinada por el bit `f`.
3. Negar la salida si `no == 1`.
4. Establecer las banderas `zr` y `ng` para indicar si el resultado es cero o negativo.



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

``bash
out = 0000000000001000  # (8 en decimal)


# HalfAdder

Este proyecto implementa un **Half Adder** (Sumador Parcial) en el lenguaje de descripción de hardware (HDL) como parte del curso **nand2tetris** y el libro **The Elements of Computing Systems** de Nisan y Schocken.

## Descripción

Un **Half Adder** es un circuito que suma dos bits de entrada y produce dos salidas:
- **sum**: Representa la suma de los dos bits sin tener en cuenta el acarreo.
- **carry**: Representa el acarreo que ocurre cuando ambos bits de entrada son `1`.

### Entradas
- `a`: Bit de entrada de 1 bit.
- `b`: Bit de entrada de 1 bit.

### Salidas
- `sum`: Resultado de la suma de `a` y `b` sin acarreo.
- `carry`: Acarreo resultante de la suma cuando `a` y `b` son ambos `1`.

### Comportamiento
- El **sum** se calcula utilizando una operación **XOR** entre `a` y `b`.
- El **carry** se calcula utilizando una operación **AND** entre `a` y `b`.

## Uso

### Instrucciones para simular el chip

1. Abre el simulador de hardware de Hack del proyecto **nand2tetris**.
2. Carga el archivo `HalfAdder.hdl`.
3. Prueba el funcionamiento del circuito manualmente o utilizando un script de prueba.
4. Ingresa valores de 1 bit para `a` y `b` y observa el resultado de `sum` y `carry`.

### Ejemplo de uso

#### Caso 1: `a = 0`, `b = 0`
- `sum = 0`
- `carry = 0`

#### Caso 2: `a = 0`, `b = 1`
- `sum = 1`
- `carry = 0`

#### Caso 3: `a = 1`, `b = 1`
- `sum = 0`
- `carry = 1` (ya que 1 + 1 = 10 en binario, y el acarreo es 1)

### Pruebas

Puedes utilizar los archivos de prueba disponibles en el directorio `projects/02` del curso **nand2tetris** para validar el comportamiento del **HalfAdder**. Los scripts `.tst` y `.cmp` permiten automatizar las pruebas y verificar que el circuito funciona correctamente.

## Estructura del Circuito

El **HalfAdder** está compuesto por dos operaciones básicas:
- **AND**: Para calcular el acarreo.
- **XOR**: Para calcular la suma sin acarreo.



