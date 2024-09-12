# Implementación de la ALU

Se implementó una ALU (Unidad Aritmética Lógica) de 16 bits que realiza varias operaciones sobre dos entradas de 16 bits `x` y `y`, basadas en seis bits de control, y proporciona dos salidas de estado.

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


# FullAdder


Un **Full Adder** es un circuito que suma tres bits de entrada: dos bits (`a`, `b`) y un bit de acarreo de una suma previa (`c`). El circuito genera dos salidas:
- **sum**: La suma de los tres bits de entrada sin el acarreo.
- **carry**: El acarreo resultante cuando la suma de los tres bits es 2 o más.

### Entradas
- `a`: Bit de entrada de 1 bit.
- `b`: Bit de entrada de 1 bit.
- `c`: Bit de acarreo de la suma previa.

### Salidas
- `sum`: Resultado de la suma de `a`, `b`, y `c` sin acarreo.
- `carry`: Acarreo generado cuando la suma es mayor o igual a 2.

### Comportamiento
1. Un primer **Half Adder** suma `a` y `b`, generando una suma parcial (`sum1`) y un acarreo parcial (`carry1`).
2. Un segundo **Half Adder** suma el bit de acarreo `c` con la suma parcial (`sum1`), generando la suma final (`sum`) y un acarreo parcial adicional (`carry2`).
3. Se utiliza una puerta **OR** para combinar los acarreos parciales (`carry1` y `carry2`) y obtener el acarreo final (`carry`).

## Uso

### Instrucciones para simular el chip

1. Abre el simulador de hardware de Hack del proyecto **nand2tetris**.
2. Carga el archivo `FullAdder.hdl`.
3. Ejecuta el script de prueba para verificar el funcionamiento del circuito.
4. Ingresa valores de 1 bit para `a`, `b`, y `c`, y observa el resultado de `sum` y `carry`.

### Ejemplos de uso

#### Caso 1: `a = 0`, `b = 0`, `c = 0`
- `sum = 0`
- `carry = 0`

#### Caso 2: `a = 1`, `b = 1`, `c = 0`
- `sum = 0`
- `carry = 1` (ya que `1 + 1 + 0 = 10` en binario)

#### Caso 3: `a = 1`, `b = 1`, `c = 1`
- `sum = 1`
- `carry = 1` (ya que `1 + 1 + 1 = 11` en binario)

### Pruebas

Puedes utilizar los archivos de prueba proporcionados en el directorio `projects/02` de **nand2tetris** para validar el comportamiento del **FullAdder**. Los scripts de prueba `.tst` y los archivos de comparación `.cmp` automatizan el proceso de validación.

## Estructura del Circuito

El **Full Adder** está construido utilizando dos **Half Adders** y una puerta **OR**. Los **Half Adders** suman dos bits a la vez y generan un acarreo, mientras que la puerta **OR** se encarga de combinar los acarreos.

- **Half Adder 1**: Suma `a` y `b` (genera `sum1` y `carry1`).
- **Half Adder 2**: Suma `sum1` y `c` (genera `sum` y `carry2`).
- **OR**: Combina `carry1` y `carry2` para producir el acarreo final (`carry`).



# HalfAdder


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

# Incrementador de 16 bits (Inc16)

Se implementó un incrementador de 16 bits que realiza la operación de suma aritmética, añadiendo 1 a la entrada de 16 bits.

## Funcionalidad

El incrementador **Inc16** toma una entrada de 16 bits (`in`) y produce una salida de 16 bits (`out`), donde `out` es el resultado de sumar 1 a la entrada `in`.

### Comportamiento
- **Entrada (`in[16]`)**: Un valor de 16 bits que se incrementará.
- **Salida (`out[16]`)**: El resultado de sumar 1 al valor de la entrada.

## Operación del Circuito

El funcionamiento del incrementador se basa en el uso de la compuerta **Add16**, que realiza la suma de dos entradas de 16 bits. En este caso:

- **a = in**: La entrada `in` es una de las entradas de la compuerta de suma.
- **b = 1**: La segunda entrada es el valor binario 1. Esto se consigue fijando el bit menos significativo de `b` a `1` (`b[0] = true`) y los otros bits a `0` (`b[1..15] = false`).

Al sumar estas dos entradas, la compuerta **Add16** produce en la salida `out` el valor de `in + 1`.

## Partes Utilizadas

- **Add16**: Realiza la operación de suma aritmética de dos valores de 16 bits.


