# CPU de la Máquina Hack

## Descripción

El CPU es responsable de ejecutar instrucciones en el lenguaje máquina Hack. Utiliza una ALU (Unidad Aritmético-Lógica) y dos registros, `A` y `D`, junto con un contador de programa (`PC`) para gestionar el flujo de instrucciones. Además, el CPU puede interactuar con la memoria externa para leer o escribir valores en ubicaciones específicas.

### Entradas del CPU

- **inM[16]**: Valor de la memoria externa, es decir, el contenido en `RAM[A]`.
- **instruction[16]**: Instrucción actual a ejecutar.
- **reset**: Si es 1, el CPU reinicia la ejecución desde la dirección 0.

### Salidas del CPU

- **outM[16]**: Valor a escribir en la memoria (si la instrucción lo requiere).
- **writeM**: Bandera que indica si se debe escribir en la memoria (`1` para escribir, `0` para no escribir).
- **addressM[15]**: Dirección de memoria donde se realizará la lectura/escritura.
- **pc[15]**: Dirección de la siguiente instrucción a ejecutar (contador de programa).

## Instrucciones

El CPU puede ejecutar dos tipos de instrucciones:
1. **Instrucción tipo A** (bit 15 = 0): Carga un valor directo en el registro `A`.
2. **Instrucción tipo C** (bit 15 = 1): Realiza una operación aritmética o lógica usando la ALU, y puede almacenar los resultados en los registros `A`, `D` o la memoria `M`. También puede realizar saltos condicionales basados en el resultado de la ALU.

## Comportamiento

1. **Registro A**: Almacena direcciones o valores numéricos. Se actualiza si la instrucción lo requiere.
2. **Registro D**: Almacena valores para realizar cálculos. Se actualiza con el resultado de la ALU.
3. **PC (Program Counter)**: Controla la dirección de la siguiente instrucción. Se incrementa automáticamente, a menos que se realice un salto condicional o se reinicie con el `reset`.
4. **ALU**: Realiza operaciones aritméticas y lógicas entre el registro `D` y el registro `A` o la entrada de memoria `inM`.

### Saltos condicionales

El CPU puede realizar saltos condicionales basados en el resultado de la ALU:
- Si el resultado es **cero**, negativo o positivo, dependiendo de los bits `j1`, `j2` y `j3` de la instrucción, se puede modificar el `PC` para cambiar el flujo de ejecución.

## Uso del Proyecto

1. **Simulación**: Puedes cargar el archivo `CPU.hdl` en el simulador del hardware Hack para verificar su funcionamiento. El simulador debe mostrar las operaciones que realiza el CPU según las instrucciones de entrada.
   
2. **Pruebas**: Se incluyen scripts de prueba (`CPU.tst`) y archivos de salida esperados (`CPU.cmp`). Para probar el CPU:
   - Carga el archivo `CPU.tst` en el simulador.
   - Ejecuta las pruebas y verifica los resultados comparando la salida con el archivo `CPU.cmp`.

3. **Reseteo**: Si la entrada `reset` está activa (1), el CPU restablecerá el contador de programa a 0, comenzando nuevamente la ejecución del programa desde el inicio.

## Estructura del Proyecto

- `CPU.hdl`: Archivo que describe la arquitectura del CPU.
- `CPU.tst`: Script de prueba para verificar el funcionamiento del CPU que es proporcionado por el software.
- `CPU.cmp`: Archivo con los resultados esperados de la prueba que de igual manera es proporcionado por el software.
