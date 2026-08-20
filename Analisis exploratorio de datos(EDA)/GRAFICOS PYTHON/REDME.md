# 📊 Análisis Trimestral con Python 

**Autor:** FREDDY SANCHEZ Z

## 1. Descripción

Este proyecto utiliza Python para analizar datos correspondientes a cuatro trimestres de tres años.

El programa permite:

* Crear y organizar los datos mediante un `DataFrame`.
* Calcular la media de cada año.
* Calcular el crecimiento porcentual entre Q1 y Q4.
* Mostrar los resultados en consola.
* Crear un gráfico de dispersión.
* Representar las medias mediante líneas horizontales.
* Mostrar los valores de cada trimestre.
* Guardar el gráfico generado como una imagen PNG.

---

# 2. Librerías utilizadas

El proyecto utiliza tres librerías principales:

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
```

## NumPy

```python
import numpy as np
```

`NumPy` es una biblioteca utilizada para operaciones numéricas y manejo de datos matemáticos.

En este proyecto se importa como apoyo para trabajar con operaciones numéricas.

---

## Pandas

```python
import pandas as pd
```

`Pandas` se utiliza principalmente para organizar y analizar los datos.

En el proyecto se utiliza para crear el `DataFrame`:

```python
df = pd.DataFrame({
    "Trimestre": trimestres,
    "Trimestre_numero": range(1, 5),
    "Año 1": año1,
    "Año 2": año2,
    "Año 3": año3
})
```

El `DataFrame` permite trabajar con los datos en forma de tabla.

---

## Matplotlib

```python
import matplotlib.pyplot as plt
```

`Matplotlib` se utiliza para crear la visualización de los datos.

En este proyecto permite:

* Crear el gráfico.
* Agregar puntos.
* Agregar líneas.
* Mostrar las medias.
* Agregar títulos.
* Agregar etiquetas.
* Mostrar una cuadrícula.
* Crear una leyenda.
* Guardar el gráfico.

---

# 3. Datos utilizados

Los datos utilizados son:

```python
trimestres = ["Q1", "Q2", "Q3", "Q4"]

año1 = [2.1, 2.4, 2.6, 3.2]

año2 = [2.3, 2.6, 2.8, 3.5]

año3 = [2.6, 2.9, 3.1, 3.9]
```

Cada posición de las listas corresponde al mismo trimestre.

Por ejemplo:

```text
Q1 → Año 1 = 2.1
Q1 → Año 2 = 2.3
Q1 → Año 3 = 2.6
```

---

# 4. Creación del DataFrame

El código:

```python
df = pd.DataFrame({
    "Trimestre": trimestres,
    "Trimestre_numero": range(1, 5),
    "Año 1": año1,
    "Año 2": año2,
    "Año 3": año3
})
```

crea una tabla con las siguientes columnas:

| Columna            | Descripción                           |
| ------------------ | ------------------------------------- |
| `Trimestre`        | Nombre del trimestre                  |
| `Trimestre_numero` | Número utilizado para el eje X        |
| `Año 1`            | Datos correspondientes al primer año  |
| `Año 2`            | Datos correspondientes al segundo año |
| `Año 3`            | Datos correspondientes al tercer año  |

---

# 5. Fórmula de la media

La media aritmética se calcula mediante:

[
\bar{x} = \frac{\sum x_i}{n}
]

Donde:

* `xᵢ` = cada uno de los valores.
* `n` = cantidad de datos.
* `x̄` = media.

En Python se utiliza:

```python
media_año1 = df["Año 1"].mean()
media_año2 = df["Año 2"].mean()
media_año3 = df["Año 3"].mean()
```

El método:

```python
.mean()
```

calcula automáticamente la media de los valores de una columna.

### Resultados

```text
Año 1 = 2.575
Año 2 = 2.800
Año 3 = 3.125
```

---

# 6. Fórmula del crecimiento porcentual

Para calcular el crecimiento entre Q1 y Q4 se utiliza:

[
Crecimiento(%) =
\frac{Q4-Q1}{Q1}\times100
]

Esta fórmula permite determinar cuánto aumentó el valor inicial con respecto al valor final.

---

## Año 1

[
\frac{3.2-2.1}{2.1}\times100
============================

52.38%
]

En Python:

```python
crecimiento_año1 = (
    (df["Año 1"].iloc[-1] - df["Año 1"].iloc[0])
    / df["Año 1"].iloc[0]
) * 100
```

---

## Año 2

[
\frac{3.5-2.3}{2.3}\times100
============================

52.17%
]

En Python:

```python
crecimiento_año2 = (
    (df["Año 2"].iloc[-1] - df["Año 2"].iloc[0])
    / df["Año 2"].iloc[0]
) * 100
```

---

## Año 3

[
\frac{3.9-2.6}{2.6}\times100
============================

50.00%
]

En Python:

```python
crecimiento_año3 = (
    (df["Año 3"].iloc[-1] - df["Año 3"].iloc[0])
    / df["Año 3"].iloc[0]
) * 100
```

---

# 7. Uso de `iloc`

En el cálculo del crecimiento aparecen:

```python
.iloc[0]
```

y:

```python
.iloc[-1]
```

Su función es obtener posiciones específicas de una columna.

```text
.iloc[0]   → primer valor
.iloc[-1]  → último valor
```

Por ejemplo:

```python
df["Año 1"].iloc[0]
```

obtiene:

```text
2.1
```

Mientras que:

```python
df["Año 1"].iloc[-1]
```

obtiene:

```text
3.2
```

Esto permite calcular automáticamente el crecimiento entre Q1 y Q4.

---

# 8. Creación del gráfico

El gráfico se crea utilizando:

```python
fig, ax = plt.subplots(figsize=(12, 7))
```

`fig` representa la figura completa y `ax` representa el área donde se dibuja el gráfico.

---

# 9. Gráfico de dispersión

Los puntos del Año 1 se crean mediante:

```python
ax.scatter(
    df["Trimestre_numero"],
    df["Año 1"],
    s=100,
    color="#4dabf7",
    label="Año 1"
)
```

La función:

```python
scatter()
```

crea un gráfico de dispersión.

En este caso:

```text
Eje X → Trimestre
Eje Y → Resultado
```

El mismo procedimiento se utiliza para Año 2 y Año 3.

---

# 10. Líneas de tendencia visual

Para conectar los puntos se utiliza:

```python
ax.plot(
    df["Trimestre_numero"],
    df["Año 1"],
    color="#4dabf7",
    alpha=0.5
)
```

La función:

```python
plot()
```

permite visualizar la evolución de los datos entre los diferentes trimestres.

Se realiza para los tres años.

---

# 11. Representación de las medias

Las medias se representan mediante líneas horizontales:

```python
ax.axhline(
    media_año1,
    linestyle="--",
    linewidth=2,
    color="#4dabf7",
    label=f"Media Año 1 = {media_año1:.3f}"
)
```

La función:

```python
axhline()
```

crea una línea horizontal.

Esto permite comparar visualmente cada resultado trimestral con el promedio anual.

Se crean tres líneas:

```text
Media Año 1 = 2.575
Media Año 2 = 2.800
Media Año 3 = 3.125
```

---

# 12. Mostrar valores sobre los puntos

Para mostrar los valores directamente sobre el gráfico se utiliza:

```python
for i in range(len(df)):
```

Este ciclo recorre cada fila del `DataFrame`.

Después se utiliza:

```python
ax.text()
```

para colocar el valor sobre cada punto.

Ejemplo:

```python
ax.text(
    df["Trimestre_numero"][i],
    df["Año 1"][i] + 0.07,
    f"{df['Año 1'][i]:.1f}",
    ha="center",
    fontsize=9
)
```

La expresión:

```python
:.1f
```

indica que el número debe mostrarse con **un decimal**.

Por ejemplo:

```text
2.1
2.4
2.6
3.2
```

---

# 13. Título del gráfico

El título se establece mediante:

```python
ax.set_title(
    "Análisis de cambios trimestrales: Año 1, Año 2 y Año 3\n"
    "FREDDY SANCHEZ Z",
    fontsize=16,
    fontweight="bold",
    pad=20
)
```

El carácter:

```python
\n
```

permite realizar un salto de línea.

Por esta razón, el gráfico muestra el nombre:

```text
FREDDY SANCHEZ Z
```

como parte del título.

---

# 14. Etiquetas de los ejes

Eje X:

```python
ax.set_xlabel(
    "Trimestre",
    fontsize=11
)
```

Eje Y:

```python
ax.set_ylabel(
    "Resultados",
    fontsize=11
)
```

Esto permite identificar qué representa cada eje.

---

# 15. Configuración de los trimestres

Para mostrar `Q1`, `Q2`, `Q3` y `Q4`:

```python
ax.set_xticks(df["Trimestre_numero"])

ax.set_xticklabels(
    df["Trimestre"]
)
```

El eje X utiliza los números:

```text
1, 2, 3, 4
```

pero visualmente muestra:

```text
Q1, Q2, Q3, Q4
```

---

# 16. Cuadrícula

La cuadrícula se agrega mediante:

```python
ax.grid(
    linestyle="--",
    alpha=0.3
)
```

Esto facilita la lectura y comparación de los valores del gráfico.

---

# 17. Leyenda

La leyenda se muestra utilizando:

```python
ax.legend()
```

Permite identificar las diferentes series:

```text
Año 1
Año 2
Año 3
Media Año 1
Media Año 2
Media Año 3
```

---

# 18. Guardar el gráfico

El gráfico se guarda mediante:

```python
plt.savefig(
    "grafico_dispersion_FREDDY_SANCHEZ_Z.png",
    dpi=150,
    facecolor=fig.get_facecolor()
)
```

El archivo generado será:

```text
grafico_dispersion_FREDDY_SANCHEZ_Z.png
```

El parámetro:

```python
dpi=150
```

define la resolución de la imagen.

---

# 19. Mostrar el gráfico

Finalmente:

```python
plt.show()
```

permite visualizar el gráfico en pantalla.

---

# 20. Fórmulas utilizadas

## Media aritmética

[
\boxed{
\bar{x} = \frac{\sum x_i}{n}
}
]

## Crecimiento porcentual

[
\boxed{
Crecimiento(%) =
\frac{Q4-Q1}{Q1}\times100
}
]

---

# 21. Resultados obtenidos

| Indicador   |  Año 1 |  Año 2 |  Año 3 |
| ----------- | -----: | -----: | -----: |
| Media       |  2.575 |  2.800 |  3.125 |
| Q1          |    2.1 |    2.3 |    2.6 |
| Q4          |    3.2 |    3.5 |    3.9 |
| Crecimiento | 52.38% | 52.17% | 50.00% |

---

# 22. Conclusión técnica

El código permite automatizar el procesamiento de los datos y evitar realizar manualmente los cálculos estadísticos.

Mediante **Pandas** se estructuran y procesan los datos, mientras que **Matplotlib** permite representar visualmente la evolución trimestral.

Los cálculos realizados muestran que la media aumenta de:

```text
2.575 → 2.800 → 3.125
```

Por lo tanto, el **Año 3 presenta el mayor promedio** de los tres períodos analizados.

El gráfico permite identificar visualmente esta evolución y comparar cada valor trimestral con su respectiva media.

---

# 23. Ejecución

Instalar las dependencias:

```bash
pip install numpy pandas matplotlib
```

Ejecutar el programa:

```bash
python analisis_trimestral.py
```

El programa calculará los indicadores, mostrará los resultados en consola y generará el gráfico:

```text
grafico_dispersion_FREDDY_SANCHEZ_Z.png
```

---

## 👨‍💻 Autor

**FREDDY SANCHEZ Z**

Proyecto académico de análisis y visualización de datos con Python.
