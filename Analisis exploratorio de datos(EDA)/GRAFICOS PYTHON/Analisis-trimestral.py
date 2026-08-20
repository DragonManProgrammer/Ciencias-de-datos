import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ==========================================
# PASO 1: Datos
# ==========================================

trimestres = ["Q1", "Q2", "Q3", "Q4"]

año1 = [
    2.1, 2.4, 2.6, 3.2
]

año2 = [
    2.3, 2.6, 2.8, 3.5
]

año3 = [
    2.6, 2.9, 3.1, 3.9
]

# ==========================================
# PASO 2: Crear DataFrame
# ==========================================

df = pd.DataFrame({
    "Trimestre": trimestres,
    "Trimestre_numero": range(1, 5),
    "Año 1": año1,
    "Año 2": año2,
    "Año 3": año3
})

# ==========================================
# PASO 3: Calcular medias
# ==========================================

media_año1 = df["Año 1"].mean()
media_año2 = df["Año 2"].mean()
media_año3 = df["Año 3"].mean()

# ==========================================
# PASO 4: Calcular crecimiento porcentual
# ==========================================

crecimiento_año1 = (
    (df["Año 1"].iloc[-1] - df["Año 1"].iloc[0])
    / df["Año 1"].iloc[0]
) * 100

crecimiento_año2 = (
    (df["Año 2"].iloc[-1] - df["Año 2"].iloc[0])
    / df["Año 2"].iloc[0]
) * 100

crecimiento_año3 = (
    (df["Año 3"].iloc[-1] - df["Año 3"].iloc[0])
    / df["Año 3"].iloc[0]
) * 100

# ==========================================
# PASO 5: Mostrar resultados
# ==========================================

print("==========================================")
print("        RESULTADOS DEL ANÁLISIS")
print("==========================================")

print("\nAÑO 1")
print("Media:", round(media_año1, 3))
print("Crecimiento Q1 a Q4:",
      round(crecimiento_año1, 2), "%")

print("\nAÑO 2")
print("Media:", round(media_año2, 3))
print("Crecimiento Q1 a Q4:",
      round(crecimiento_año2, 2), "%")

print("\nAÑO 3")
print("Media:", round(media_año3, 3))
print("Crecimiento Q1 a Q4:",
      round(crecimiento_año3, 2), "%")

# ==========================================
# PASO 6: Crear gráfico de dispersión
# ==========================================

plt.style.use("dark_background")

fig, ax = plt.subplots(figsize=(12, 7))

fig.patch.set_facecolor("#1e1e2e")
ax.set_facecolor("#2a2a3c")

# ==========================================
# PASO 7: Puntos Año 1
# ==========================================

ax.scatter(
    df["Trimestre_numero"],
    df["Año 1"],
    s=100,
    color="#4dabf7",
    label="Año 1"
)

# ==========================================
# PASO 8: Puntos Año 2
# ==========================================

ax.scatter(
    df["Trimestre_numero"],
    df["Año 2"],
    s=100,
    color="#ff6b6b",
    label="Año 2"
)

# ==========================================
# PASO 9: Puntos Año 3
# ==========================================

ax.scatter(
    df["Trimestre_numero"],
    df["Año 3"],
    s=100,
    color="#51cf66",
    label="Año 3"
)

# ==========================================
# PASO 10: Líneas de tendencia visual
# ==========================================

ax.plot(
    df["Trimestre_numero"],
    df["Año 1"],
    color="#4dabf7",
    alpha=0.5
)

ax.plot(
    df["Trimestre_numero"],
    df["Año 2"],
    color="#ff6b6b",
    alpha=0.5
)

ax.plot(
    df["Trimestre_numero"],
    df["Año 3"],
    color="#51cf66",
    alpha=0.5
)

# ==========================================
# PASO 11: Línea de media Año 1
# ==========================================

ax.axhline(
    media_año1,
    linestyle="--",
    linewidth=2,
    color="#4dabf7",
    label=f"Media Año 1 = {media_año1:.3f}"
)

# ==========================================
# PASO 12: Línea de media Año 2
# ==========================================

ax.axhline(
    media_año2,
    linestyle="--",
    linewidth=2,
    color="#ff6b6b",
    label=f"Media Año 2 = {media_año2:.3f}"
)

# ==========================================
# PASO 13: Línea de media Año 3
# ==========================================

ax.axhline(
    media_año3,
    linestyle="--",
    linewidth=2,
    color="#51cf66",
    label=f"Media Año 3 = {media_año3:.3f}"
)

# ==========================================
# PASO 14: Mostrar valores sobre los puntos
# ==========================================

for i in range(len(df)):

    ax.text(
        df["Trimestre_numero"][i],
        df["Año 1"][i] + 0.07,
        f"{df['Año 1'][i]:.1f}",
        ha="center",
        fontsize=9
    )

    ax.text(
        df["Trimestre_numero"][i],
        df["Año 2"][i] + 0.07,
        f"{df['Año 2'][i]:.1f}",
        ha="center",
        fontsize=9
    )

    ax.text(
        df["Trimestre_numero"][i],
        df["Año 3"][i] + 0.07,
        f"{df['Año 3'][i]:.1f}",
        ha="center",
        fontsize=9
    )

# ==========================================
# PASO 15: Título
# ==========================================

ax.set_title(
    "Análisis de cambios trimestrales: Año 1, Año 2 y Año 3\n"
    "FREDDY SANCHEZ Z",
    fontsize=16,
    fontweight="bold",
    pad=20
)

# ==========================================
# PASO 16: Etiquetas
# ==========================================

ax.set_xlabel(
    "Trimestre",
    fontsize=11
)

ax.set_ylabel(
    "Resultados",
    fontsize=11
)

# ==========================================
# PASO 17: Nombres de los trimestres
# ==========================================

ax.set_xticks(df["Trimestre_numero"])

ax.set_xticklabels(
    df["Trimestre"]
)

# ==========================================
# PASO 18: Cuadrícula
# ==========================================

ax.grid(
    linestyle="--",
    alpha=0.3
)

# ==========================================
# PASO 19: Leyenda
# ==========================================

ax.legend()

# ==========================================
# PASO 20: Ajustar gráfico
# ==========================================

plt.tight_layout()

# ==========================================
# PASO 21: Guardar gráfico
# ==========================================

plt.savefig(
    "grafico_dispersion_FREDDY_SANCHEZ_Z.png",
    dpi=150,
    facecolor=fig.get_facecolor()
)

# ==========================================
# PASO 22: Mostrar gráfico
# ==========================================

plt.show()