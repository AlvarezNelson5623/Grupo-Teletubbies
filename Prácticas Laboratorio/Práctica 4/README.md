# Proyecto 6 - Ensamblador de Hack

Este proyecto forma parte del curso *From Nand to Tetris* (nand2Tetris) y tiene como objetivo implementar un ensamblador que traduzca el código ensamblador de la arquitectura Hack (*.asm*) a instrucciones binarias (*.hack*). La computadora Hack es un modelo de hardware simple, y este ensamblador permite ejecutar programas en esta máquina.

## Objetivos

1. Implementar un ensamblador que convierta instrucciones en lenguaje ensamblador de Hack a lenguaje máquina binario.
2. Comprender el proceso de traducción de código de alto nivel a código máquina y el papel de los ensambladores en esta tarea.
3. Familiarizarse con los conceptos de arquitectura de hardware básica, específicamente la computadora Hack.

--------
# Limitaciones del Ensamblador

## Limitaciones Principales

1. **Falta de optimización de código**
   - El ensamblador traduce las instrucciones de forma lineal, una por una, sin realizar optimizaciones de código. Esto significa que el código resultante puede consumir más recursos (memoria y tiempo de ejecución) en comparación con el código optimizado que generan ensambladores más avanzados.
   - No se aplican técnicas de optimización como la minimización del número de instrucciones o la reutilización eficiente de registros.

2. **Escaso manejo de errores**
   - La capacidad de detección y manejo de errores es limitada. Los mensajes de error no son detallados, lo que dificulta identificar y corregir problemas en el código ensamblador.
   - Los errores de sintaxis o las instrucciones inválidas pueden hacer que el ensamblador falle sin información clara, complicando la depuración de programas complejos.

3. **Ausencia de macros y pseudoinstrucciones**
   - El ensamblador no permite la creación de macros ni el uso de pseudoinstrucciones, que son características comunes en ensambladores avanzados. Las macros y pseudoinstrucciones ayudan a simplificar y reducir el código, facilitando la escritura y legibilidad de programas más extensos.
   - Sin estas funciones, el programador debe escribir todas las instrucciones explícitamente, lo que resulta en código más largo y menos legible.

4. **Capacidad de abstracción limitada**
   - El ensamblador no maneja estructuras de datos complejas ni permite abstracciones como funciones o módulos, características útiles para gestionar proyectos grandes.
   - La falta de abstracciones de alto nivel hace que el código ensamblador crezca en complejidad a medida que el programa se expande, y esto puede hacer que el mantenimiento y la depuración sean más difíciles.

5. **No integra herramientas avanzadas**
   - Este ensamblador no está diseñado para integrarse con depuradores o compiladores de alto nivel, limitando su uso en proyectos que requieren herramientas de desarrollo más sofisticadas.
   - Tampoco incluye soporte para perfiles de rendimiento o análisis de código, que son comunes en ensambladores comerciales.


## Referencias

- [nand2Tetris](https://www.nand2tetris.org/) - Página oficial del curso, con más detalles sobre el ensamblador y la arquitectura Hack.
- [Proyecto 6 - nand2Tetris](https://www.nand2tetris.org/project06) - Guía específica para el ensamblador en el contexto del curso.


