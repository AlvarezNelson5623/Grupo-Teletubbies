# Registro de 1 bit (Bit)

Se implementó un registro de 1 bit que puede almacenar un valor dependiendo de una señal de carga (`load`). 

## Funcionalidad

El **Bit** es un registro de 1 bit que toma dos entradas:

- **in**: El valor de entrada que puede ser almacenado en el registro.
- **load**: Señal de control que determina si el valor de `in` se carga o si el registro mantiene su valor anterior.

### Comportamiento

- Si **load = 1**: El valor de la entrada `in` se carga en el registro y se refleja en la salida `out` en el siguiente ciclo de reloj.
- Si **load = 0**: El valor en la salida `out` permanece sin cambios, manteniendo el valor previamente almacenado en el registro.

### Entradas y Salidas

- **Entrada (`in`)**: El valor que puede ser almacenado en el registro.
- **Entrada (`load`)**: Control de carga. Si es `1`, el valor de `in` se almacena en el registro; si es `0`, no hay cambios en el valor del registro.
- **Salida (`out`)**: El valor actual almacenado en el registro, que se actualiza según la señal `load`.

## Operación del Circuito

El circuito se basa en dos partes principales:

1. **Mux**: Se utiliza para seleccionar entre el valor actual almacenado (`dout`) y el valor de entrada (`in`), dependiendo de la señal de control `load`. Si `load = 1`, el valor de `in` se selecciona y pasa al siguiente componente; si `load = 0`, el valor actual del registro se mantiene.
  
2. **DFF (Flip-Flop)**: El Flip-Flop de tipo D es un elemento de almacenamiento que retiene el valor en su entrada hasta el próximo ciclo de reloj. La salida de `Mux` se alimenta a este Flip-Flop, que almacena el valor seleccionado en cada ciclo de reloj y lo asigna a la salida `out`.

## Partes Utilizadas

- **Mux**: Selecciona si el registro debe actualizarse con el nuevo valor de `in` o conservar el valor anterior.
- **DFF**: Almacena el valor seleccionado por el `Mux` y lo mantiene hasta el próximo ciclo de reloj.

Este diseño simple permite que el registro almacene o retenga un valor de 1 bit basado en la señal de control `load`.

# Contador de 16 bits con control de carga y reinicio (PC)

Se implementó un contador de 16 bits que puede ser cargado, incrementado, o reiniciado, basado en señales de control.

## Funcionalidad

El **PC** (Program Counter) es un contador de 16 bits que toma las siguientes señales de control:

- **in[16]**: Valor de 16 bits que se puede cargar en el contador.
- **load**: Señal de control para cargar el valor de `in` en el contador.
- **inc**: Señal de control para incrementar el valor actual del contador en 1.
- **reset**: Señal de control para reiniciar el contador a 0.

### Comportamiento

- **reset**: Si `reset = 1`, el contador se reinicia a 0.
- **load**: Si `load = 1` y `reset = 0`, el valor de `in` se carga en el contador.
- **inc**: Si `inc = 1`, y ni `reset` ni `load` están activos, el contador se incrementa en 1.
- **Sin señal activa**: Si ninguna de las señales `reset`, `load` o `inc` está activa, el contador mantiene su valor actual.

### Entradas y Salidas

- **Entrada (`in[16]`)**: Valor de 16 bits a ser cargado en el contador si `load` está activo.
- **Entrada (`load`)**: Controla si el contador debe cargar el valor de `in`.
- **Entrada (`inc`)**: Controla si el contador debe ser incrementado en 1.
- **Entrada (`reset`)**: Controla si el contador debe ser reiniciado a 0.
- **Salida (`out[16]`)**: Valor actual del contador.

## Operación del Circuito

El circuito realiza las siguientes operaciones en secuencia:

1. **Incremento**: Si `inc = 1`, se incrementa el valor actual del contador en 1. Esto se realiza mediante la compuerta **Inc16**, que toma la salida actual del contador (`out5`) y le suma 1. El resultado es almacenado en `out1`.

2. **Selección de Incremento o Valor Actual**: Si `inc = 0`, la salida de la etapa de incremento (`out1`) es mantenida como `out2`. Esto se realiza mediante la compuerta **Mux16**.

3. **Selección de Carga o Incremento**: Si `load = 1`, el valor de `in` se selecciona sobre el valor incrementado (o mantenido). Esto se realiza mediante otra compuerta **Mux16**.

4. **Selección de Carga o Mantenimiento**: Si `reset = 1`, el valor de salida es forzado a `0`. Si `reset = 0`, el valor seleccionado en la etapa anterior (carga o incremento) se mantiene. Esto se realiza con otra compuerta **Mux16**.

5. **Registro**: Finalmente, el valor seleccionado (ya sea `0`, el valor incrementado, o el valor cargado) se almacena en un registro **Register**, que mantiene el valor hasta el próximo ciclo de reloj.

## Partes Utilizadas

- **Inc16**: Incrementa el valor de entrada en 1.
- **Mux16**: Multiplexor que selecciona entre dos valores basados en una señal de control.
- **Register**: Almacena el valor de entrada y lo mantiene hasta el próximo ciclo de reloj.

Este diseño permite que el contador se gestione de manera flexible y eficiente, con control completo sobre su carga, incremento y reinicio.

# RAM16K - Implementación de Memoria


El chip **RAM16K** es una memoria de 16K x 16 bits, lo que significa que puede almacenar hasta 16,384 palabras, cada una de 16 bits de ancho. El chip proporciona una interfaz para leer y escribir datos en ubicaciones específicas de la memoria, utilizando una dirección de 14 bits.

## Especificaciones

- **Entradas**:
  - `in[16]`: Datos de 16 bits que se escribirán en la memoria.
  - `load`: Bit de control. Si está en `1`, los datos de entrada se cargan en la ubicación de memoria especificada por `address`.
  - `address[14]`: La dirección de 14 bits de la ubicación de memoria para leer o escribir.

- **Salida**:
  - `out[16]`: Los datos de 16 bits almacenados en la ubicación de memoria especificada por `address`.

## Componentes Utilizados

El chip **RAM16K** se construye utilizando componentes más pequeños, principalmente 4 instancias de **RAM4K**, cada una capaz de almacenar 4K palabras, junto con multiplexores y demultiplexores:

- **DMux4Way**: Distribuye la señal `load` al chip **RAM4K** correcto, según `address[12..13]`.
- **RAM4K**: Se utilizan cuatro instancias de esta memoria para construir la memoria de 16K.
- **Mux4Way16**: Selecciona la salida correcta de una de las cuatro instancias de **RAM4K** según `address[12..13]`.

## Flujo Lógico

1. **Dirección**:
   - La dirección de 14 bits se divide en dos partes:
     - `address[12..13]` selecciona cuál de los cuatro chips **RAM4K** se utiliza.
     - `address[0..11]` proporciona la dirección específica dentro de cada bloque **RAM4K**.

2. **Escritura en Memoria**:
   - Si `load = 1`, los datos de entrada (`in[16]`) se almacenan en la ubicación de memoria especificada por `address[0..11]` dentro del chip **RAM4K** seleccionado.

3. **Lectura de Memoria**:
   - El **Mux4Way16** selecciona la salida de datos apropiada de uno de los cuatro chips **RAM4K** según `address[12..13]`.

## Ejemplo de Uso

Para almacenar el valor `1010101010101010` en la dirección `00000000000001`:

- Configura `load = 1` para escribir el valor.
- Después de un ciclo de reloj, configura `load = 0` para leer el valor almacenado en la memoria.

## Pruebas

El diseño de hardware proporcionado puede probarse usando el simulador de hardware:

1. Carga el archivo **RAM16K.hdl** en el **Simulador de Hardware**.
2. Ejecuta el archivo de prueba correspondiente **RAM16K.tst**.
3. Verifica que la salida coincida con los resultados esperados especificados en **RAM16K.cmp**.

## Archivos en este Proyecto

- `RAM16K.hdl`: Implementación en HDL del chip RAM16K.
- `RAM16K.tst`: Script de prueba para verificar la funcionalidad del chip.
- `RAM16K.cmp`: Archivo de comparación esperado para las pruebas.
- `RAM16K.hack`: Archivo binario que se puede cargar en el Simulador de Hardware para pruebas.

## Conclusión

El chip **RAM16K** es un componente crucial en la construcción de arquitecturas informáticas más complejas, proporcionando la capacidad de almacenar y recuperar datos de manera eficiente utilizando componentes de memoria jerárquicos.

# Memoria de 4K registros (RAM4K)

Una memoria de 4K registros, donde cada registro es de 16 bits. La memoria permite leer y escribir valores en la ubicación especificada por la dirección de 12 bits.

## Funcionalidad

El **RAM4K** es una memoria que almacena 4,096 registros de 16 bits. La memoria se organiza en 8 bloques de 512 registros, y cada bloque puede ser accedido o modificado en función de la señal de carga (`load`) y la dirección proporcionada.

### Entradas y Salidas

- **Entrada (`in[16]`)**: El valor de 16 bits que se cargará en la memoria si la señal `load` está activa.
- **Entrada (`load`)**: Señal de control que determina si el valor de `in` debe ser cargado en la ubicación de memoria especificada.
- **Entrada (`address[12]`)**: Dirección de 12 bits que especifica la ubicación de memoria a la que se accede. La dirección se divide en dos partes: los 3 bits superiores seleccionan el bloque de memoria y los 9 bits inferiores seleccionan la ubicación dentro del bloque.
- **Salida (`out[16]`)**: El valor almacenado en la ubicación de memoria especificada por `address`.

## Operación del Circuito

El circuito realiza las siguientes operaciones para gestionar la memoria:

1. **Selección del Bloque de Memoria**: La señal `load` se distribuye a uno de los 8 bloques de memoria `RAM512` mediante un **DMux8Way**. Los 3 bits superiores de la dirección (`address[9..11]`) determinan a cuál de los 8 bloques se envía la señal de carga (`load0` a `load7`).

2. **Acceso a los Bloques de Memoria**: Cada uno de los 8 bloques de memoria `RAM512` maneja 512 registros de 16 bits. Cada bloque recibe la señal de carga correspondiente y la dirección de 9 bits (`address[0..8]`), y emite su salida (`out0` a `out7`).

3. **Selección del Valor de Salida**: La salida de los 8 bloques de memoria se combina usando un **Mux8Way16**, que selecciona la salida del bloque correspondiente según los 3 bits superiores de la dirección (`address[9..11]`). La salida seleccionada se emite como la salida del módulo `RAM4K`.

## Partes Utilizadas

- **DMux8Way**: Demultiplexor que dirige la señal de carga a uno de los 8 bloques de memoria basándose en los 3 bits superiores de la dirección.
- **RAM512**: Memoria de 512 registros de 16 bits, que se utiliza para construir la memoria de 4K.
- **Mux8Way16**: Multiplexor que selecciona entre las salidas de los 8 bloques de memoria según los 3 bits superiores de la dirección.

Este diseño permite gestionar eficientemente una memoria de 4K registros, con capacidad de lectura y escritura en cualquier ubicación especificada por la dirección de 12 bits.



