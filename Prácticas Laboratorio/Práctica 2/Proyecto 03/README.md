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

