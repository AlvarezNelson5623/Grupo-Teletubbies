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

