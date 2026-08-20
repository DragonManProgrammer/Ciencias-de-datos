import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ==========================================
# PASO 1: Datos
# ==========================================

meses = [
    "Enero", "Febrero", "Marzo", "Abril",
    "Mayo", "Junio", "Julio", "Agosto",
    "Septiembre", "Octubre", "Noviembre", "Diciembre"
]

año1 = [
    800, 850, 900, 950,
    1000, 1050, 1100, 1150,
    1200, 1300, 1600, 2000
]

año2 = [
    1000, 1050, 1100, 1150,
    1200, 1250, 1300, 1350,
    1400, 1550, 2000, 2600
]

# ==========================================
# PASO 2: Crear DataFrame
# ==========================================

df = pd.DataFrame({
    "Mes": meses,
    "Mes_numero": range(1, 13),
    "Año 1": año1,
    "Año 2": año2
})

# ==========================================
# PASO 3: Calcular medias
# ==========================================

media_año1 = df["Año 1"].mean()
media_año2 = df["Año 2"].mean()

# ==========================================
# PASO 4: Calcular mínimos y máximos
# ==========================================

min_año1 = df["Año 1"].min()
max_año1 = df["Año 1"].max()

min_año2 = df["Año 2"].min()
max_año2 = df["Año 2"].max()

# ==========================================
# PASO 5: Calcular aumentos
# ==========================================

aumento_año1 = max_año1 - min_año1
aumento_año2 = max_año2 - min_año2

porcentaje_año1 = (aumento_año1 / min_año1) * 100
porcentaje_año2 = (aumento_año2 / min_año2) * 100

# ==========================================
# PASO 6: Mostrar resultados
# ==========================================

print("===== RESULTADOS =====")

print("\nAÑO 1")
print("Media:", round(media_año1, 2))
print("Mínimo:", min_año1)
print("Máximo:", max_año1)
print("Aumento:", aumento_año1)
print("Aumento porcentual:", round(porcentaje_año1, 2), "%")

print("\nAÑO 2")
print("Media:", round(media_año2, 2))
print("Mínimo:", min_año2)
print("Máximo:", max_año2)
print("Aumento:", aumento_año2)
print("Aumento porcentual:", round(porcentaje_año2, 2), "%")

# ==========================================
# PASO 7: Crear gráfico de dispersión
# ==========================================

plt.style.use("dark_background")

fig, ax = plt.subplots(figsize=(12, 6))

fig.patch.set_facecolor("#1e1e2e")
ax.set_facecolor("#2a2a3c")

# ==========================================
# PASO 8: Crear puntos del Año 1
# ==========================================

ax.scatter(
    df["Mes_numero"],
    df["Año 1"],
    s=80,
    color="#4dabf7",
    label="Año 1"
)

# ==========================================
# PASO 9: Crear puntos del Año 2
# ==========================================

ax.scatter(
    df["Mes_numero"],
    df["Año 2"],
    s=80,
    color="#ff6b6b",
    label="Año 2"
)

# ==========================================
# PASO 10: Líneas para observar la tendencia
# ==========================================

ax.plot(
    df["Mes_numero"],
    df["Año 1"],
    color="#4dabf7",
    alpha=0.5
)

ax.plot(
    df["Mes_numero"],
    df["Año 2"],
    color="#ff6b6b",
    alpha=0.5
)

# ==========================================
# PASO 11: Línea de la media Año 1
# ==========================================

ax.axhline(
    media_año1,
    linestyle="--",
    linewidth=2,
    color="#4dabf7",
    label=f"Media Año 1 = {media_año1:.2f}"
)

# ==========================================
# PASO 12: Línea de la media Año 2
# ==========================================

ax.axhline(
    media_año2,
    linestyle="--",
    linewidth=2,
    color="#ff6b6b",
    label=f"Media Año 2 = {media_año2:.2f}"
)

# ==========================================
# PASO 13: Mostrar valores
# ==========================================

for i in range(len(df)):

    ax.text(
        df["Mes_numero"][i],
        df["Año 1"][i] + 40,
        str(df["Año 1"][i]),
        ha="center",
        fontsize=8
    )

    ax.text(
        df["Mes_numero"][i],
        df["Año 2"][i] + 40,
        str(df["Año 2"][i]),
        ha="center",
        fontsize=8
    )

# ==========================================
# PASO 14: Título
# ==========================================

ax.set_title(
    "Evolución de las ventas: Año 1 vs Año 2",
    fontsize=15,
    fontweight="bold",
    pad=15
)

# ==========================================
# PASO 15: Etiquetas
# ==========================================

ax.set_xlabel(
    "Mes",
    fontsize=11
)

ax.set_ylabel(
    "Ventas",
    fontsize=11
)

# ==========================================
# PASO 16: Nombres de los meses
# ==========================================

ax.set_xticks(df["Mes_numero"])
ax.set_xticklabels(df["Mes"], rotation=45)

# ==========================================
# PASO 17: Cuadrícula
# ==========================================

ax.grid(
    linestyle="--",
    alpha=0.3
)

# ==========================================
# PASO 18: Leyenda
# ==========================================

ax.legend()

# ==========================================
# PASO 19: Ajustar gráfico
# ==========================================

plt.tight_layout()

# ==========================================
# PASO 20: Guardar gráfico
# ==========================================

plt.savefig(
    "grafico_dispersion_ventas.png",
    dpi=150,
    facecolor=fig.get_facecolor()
)

# ==========================================
# PASO 21: Mostrar gráfico
# ==========================================

plt.show()