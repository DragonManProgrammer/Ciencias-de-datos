import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ============================================================
# EJERCICIO 1.3 — Asimetría y Coeficiente de Variación
# ============================================================

# Datos
datos = {
    "Producto": ["Producto A", "Producto B"],
    "Media": [45000, 18000],
    "Desviación estándar": [6750, 5400]
}

df = pd.DataFrame(datos)

# Cálculo del coeficiente de variación
df["CV (%)"] = (df["Desviación estándar"] / df["Media"]) * 100

# ============================================================
# Configuración visual
# ============================================================

plt.style.use("dark_background")

fig, ax = plt.subplots(figsize=(9, 5.5))

fig.patch.set_facecolor("#111827")
ax.set_facecolor("#111827")

# Barras
barras = ax.bar(
    df["Producto"],
    df["CV (%)"],
    width=0.55,
    color=["#38bdf8", "#f97316"],
    edgecolor="white",
    linewidth=1.2
)

# ============================================================
# Valores sobre las barras
# ============================================================

for barra, valor in zip(barras, df["CV (%)"]):
    ax.text(
        barra.get_x() + barra.get_width() / 2,
        valor + 1,
        f"{valor:.0f}%",
        ha="center",
        va="bottom",
        fontsize=13,
        fontweight="bold",
        color="white"
    )

# ============================================================
# Línea de referencia
# ============================================================

ax.axhline(
    0,
    linewidth=1,
    color="white",
    alpha=0.4
)

# ============================================================
# Títulos y etiquetas
# ============================================================

ax.set_title(
    "Coeficiente de Variación de las Ventas",
    fontsize=17,
    fontweight="bold",
    pad=18
)

ax.set_ylabel(
    "Coeficiente de variación (%)",
    fontsize=11
)

ax.set_xlabel(
    "Producto",
    fontsize=11,
    labelpad=10
)

# Escala Y
ax.set_ylim(0, 38)
ax.set_yticks(np.arange(0, 41, 5))

# Cuadrícula discreta
ax.grid(
    axis="y",
    linestyle="--",
    alpha=0.20
)

# Eliminar bordes innecesarios
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

# ============================================================
# Información adicional
# ============================================================

ax.text(
    0.02,
    0.94,
    "A = 15%  |  B = 30%",
    transform=ax.transAxes,
    fontsize=10,
    color="#d1d5db"
)

plt.tight_layout()
plt.show()