Nombre de archivo sugerido: paper/raw/2026-08-03-depuracion-debugging-y-logging.md

# Depuración (Debugging y Logging)

Autor(es): BIG School — Máster Desarrollo con IA
Fecha: 2026-08-03 (fecha de conversión; no se indica fecha de publicación en el original)
Tipo: Documento Técnico (Módulo 0: Fundamentos del Desarrollo de Software) + Diapositivas de apoyo + Snippet de código
Lenguaje: Python
Fuente Original: PDF — "0.6.2 Depuración (debugging y logging).pdf" (artículo) + "0.6.2 Depuración (debugging y logging)1.pdf" (slides) + archivo de código "depuracion.py"

## Introducción

La eficiencia de un desarrollador no se mide exclusivamente por su capacidad para escribir líneas de código, sino por su destreza técnica para desmantelar problemas cuando los sistemas fallan. En el desarrollo de software, la aparición de errores o **bugs** es una certeza estadística, no una posibilidad remota; por ello, la diferencia entre la frustración operativa y el control estratégico reside en la **depuración de forma sistemática**. Adoptar una mentalidad de ingeniería implica abandonar el enfoque de ensayo y error —donde se modifican parámetros al azar con la esperanza de una resolución fortuita— para transformarse en un detective capaz de **investigar mediante hipótesis** y evidencias técnicas. Este tránsito hacia la madurez profesional requiere el dominio de un ecosistema de herramientas que abarca desde la inspección puntual hasta el monitoreo de sistemas en entornos de producción, garantizando la **productividad y calidad** del producto final en cada etapa de su ciclo de vida.

## La Anatomía de la Investigación: Estrategias de Debugging

El proceso de depuración o debugging debe entenderse como un método científico aplicado al software. Cuando un programa no se comporta según los requisitos establecidos, el profesional no debe reaccionar de forma impulsiva. Por el contrario, la labor consiste en localizar la 'escena del crimen', identificar los puntos de fallo y analizar los valores de las variables en tiempo real. Este enfoque metódico permite no solo corregir el síntoma visible del error, sino comprender la causa raíz, evitando que el problema se replique en otros módulos del sistema.

## Inspección Elemental: El Uso de Sentencias Print

La técnica de depuración mediante la función print representa la forma más básica y universal de visualizar el estado interno de una aplicación. Funciona como una lupa que se coloca en puntos estratégicos del código para rastrear la evolución de los datos. Esta metodología es útil para inspecciones rápidas y localizadas, permitiendo descubrir, por ejemplo, errores en fórmulas aritméticas donde los valores finales no guardan coherencia con los datos de entrada. No obstante, su uso excesivo compromete la limpieza del código y resulta ineficiente en arquitecturas complejas, ya que requiere la inserción y eliminación manual de cada sentencia, lo que consume tiempo valioso y puede introducir nuevos errores involuntarios.

A continuación, el caso de estudio de referencia: una función de cálculo de precio con descuento que contiene un error lógico. El bug consiste en que la función **suma** el descuento en lugar de **restarlo**, produciendo un precio final mayor al original en vez de menor.

```python
def calcular_precio_con_descuento(precio_base, descuento_porc):
    factor_descuento = descuento_porc / 100

    precio_final = precio_base * (1 + factor_descuento)
    return precio_final

precio_producto = 100
descuento = 20
print(f"El precio final es: {calcular_precio_con_descuento(precio_producto, descuento)}")
# Salida incorrecta: El precio final es: 120.0
```

## Ejemplos Relacionados

**1. Depuración con `print()` — instrumentando la función para rastrear el estado interno.** En lugar de ensayo y error, se insertan sentencias `print` en cada paso relevante para observar cómo evolucionan las variables hasta encontrar el punto exacto donde la lógica falla:

```python
def calcular_precio_con_descuento(precio_base, descuento_porc):
    print(f"--- Dentro de la función ---")
    print(f"Valor de precio_base: {precio_base}")
    print(f"Valor de descuento_porc: {descuento_porc}")

    factor_descuento = descuento_porc / 100
    print(f"Valor de factor_descuento: {factor_descuento}")  # ¡Pista!

    precio_final = precio_base * (1 + factor_descuento)
    print(f"Valor de precio_final calculado: {precio_final}")  # ¡Pista!

    print(f"--- Saliendo de la función ---")
    return precio_final
```

**2. La misma corrección aplicando el principio de logging en vez de `print` (ver sección de Logging más abajo) para un entorno productivo:**

```python
import logging

logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')

def calcular_precio_con_descuento(precio_base, descuento_porc):
    factor_descuento = descuento_porc / 100
    logging.debug(f"factor_descuento calculado: {factor_descuento}")

    # Corrección del bug: se resta el descuento en lugar de sumarlo
    precio_final = precio_base * (1 - factor_descuento)
    logging.debug(f"precio_final calculado: {precio_final}")
    return precio_final
```

## Depuración Interactiva: Control Total de la Ejecución

Para un entorno profesional, la herramienta predilecta es el depurador interactivo. A diferencia de las inspecciones estáticas, este entorno permite pausar el flujo del programa y examinar el estado de las variables en un instante preciso. Un depurador interactivo nos permite pausar la ejecución del programa en un punto concreto e "interrogar" su estado.

Los conceptos fundamentales de esta práctica son:

- **Breakpoint (Punto de Ruptura):** Una marca visual en una línea específica que ordena al programa detenerse al llegar a ese punto.
- **Step Over (Pasar por Encima):** Permite avanzar a la siguiente línea sin entrar en las interioridades de las funciones llamadas, ideal para mantener una visión de alto nivel.
- **Step Into (Entrar en):** Comando crítico para profundizar en la lógica interna de una función y detectar fallos en la modularidad.
- **Inspect (Inspeccionar):** La capacidad de ver y, en ocasiones, modificar valores en memoria mientras la aplicación está en pausa.

**Herramientas en Python:** `pdb` (Python Debugger) y los depuradores integrados de IDEs (por ejemplo, Visual Studio Code), que transforman la resolución de problemas en un proceso transparente y visual, eliminando la necesidad de "adivinar" qué está ocurriendo internamente.

**Demostración conceptual con el mismo bug:**

- Ponemos un breakpoint en la línea `precio_final = ...`.
- Ejecutamos el programa en modo depuración.
- El programa se detiene en esa línea, justo antes de ejecutarla.
- Inspeccionamos las variables: vemos que `precio_base` es 100 y `factor_descuento` es 0.2.
- Hacemos Step Over. La línea se ejecuta.
- Inspeccionamos `precio_final` y vemos que su nuevo valor es 120.0.
- El error está exactamente en esa línea.

## Gestión de Errores en Producción mediante Logging

Una vez que la aplicación se despliega en el mundo real, la depuración interactiva deja de ser viable, ya que no se puede pausar el servicio para un usuario final. Aquí es donde el **logging** se vuelve indispensable. Se trata de un registro cronológico y categorizado de eventos que permite realizar diagnósticos post-mortem. A diferencia del print, el logging permite jerarquizar el impacto de los sucesos mediante niveles:

1. **Debug:** Información granular para el desarrollo.
2. **Info:** Confirmaciones operativas estándar.
3. **Warning:** Alertas sobre anomalías que no detienen el servicio.
4. **Error:** Fallos en funcionalidades específicas que requieren atención.
5. **Critical:** Errores de infraestructura que pueden colapsar el sistema completo.

Implementar un sistema de logs robusto, que incluya la fecha, la hora y la traza del error (stack trace), es lo que permite a las organizaciones mantener la estabilidad de sus servicios sin necesidad de recrear manualmente cada incidencia reportada por el usuario.

**Ejemplo con el módulo `logging` de Python:**

```python
import logging

# Configuración básica para guardar los logs en un archivo
logging.basicConfig(filename='app.log', level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def mi_funcion_importante(data):
    logging.info(f"Función iniciada con los datos: {data}")
    try:  # lógica de la aplicación
        resultado = data / 2
        logging.info(f"Cálculo exitoso. Resultado: {resultado}")
        return resultado
    except TypeError:  # En lugar de un print, registramos el error
        logging.error("¡Error! Los datos de entrada no eran un número.", exc_info=True)
        return None

mi_funcion_importante("texto")
```

## Observaciones Clave

- La depuración sistemática es una disciplina que separa a los desarrolladores experimentales de los ingenieros de software sólidos.
- El uso de sentencias print es una solución rápida para depurar en local, pero es considerada una mala práctica si se mantiene en el código final debido a la contaminación del flujo de trabajo.
- Dominar el breakpoint y el avance línea a línea (step over/into) es esencial para comprender lógicas de negocio complejas sin ejecutar el programa repetidamente.
- El logging no es opcional en entornos corporativos; es el único historial confiable para entender fallos en sistemas que los desarrolladores no pueden manipular directamente en vivo.
- La jerarquía de niveles en el sistema de logs permite filtrar ruidos de información y priorizar la atención sobre incidentes críticos que afecten el ROI o la operatividad.

## Conclusión

La integración de técnicas avanzadas de depuración y registro de eventos es un pilar fundamental para cualquier estrategia de **madurez tecnológica**. No se trata simplemente de corregir errores, sino de establecer un marco de trabajo que potencie la confiabilidad de los sistemas y la agilidad de los equipos de IT. Al dominar estas herramientas, los profesionales adquieren la confianza necesaria para escalar sus soluciones y delegar procesos de creación asistidos por IA, sabiendo que poseen el criterio técnico para validar y asegurar cada resultado. La depuración, entendida como un proceso analítico, es el seguro de vida de cualquier proyecto de software escalable.
