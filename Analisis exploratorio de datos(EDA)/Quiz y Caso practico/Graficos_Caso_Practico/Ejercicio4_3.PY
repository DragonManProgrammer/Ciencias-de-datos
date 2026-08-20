import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ==========================================================
# EJERCICIO 4.3 - CASO INTEGRADOR
# ==========================================================

datos = pd.DataFrame({
    "Equipo": ["Soporte A", "Soporte B"],
    "Media": [4.2, 3.1]
})

x = np.arange(len(datos))

# Colores diferentes para cada equipo
colores = ["#3B82F6", "#10B981"]

# ==========================================================
# GRAFICA
# ==========================================================

plt.style.use("dark_background")

fig, ax = plt.subplots(figsize=(9, 5.5))

fig.patch.set_facecolor("#111827")
ax.set_facecolor("#111827")

barras = ax.bar(
    x,
    datos["Media"],
    width=0.55,
    color=colores,
    linewidth=0
)

# ==========================================================
# VALORES
# ==========================================================

for barra, valor in zip(barras, datos["Media"]):
    ax.text(
        barra.get_x() + barra.get_width() / 2,
        valor + 0.12,
        f"{valor:.1f} días",
        ha="center",
        va="bottom",
        fontsize=12,
        fontweight="bold"
    )

# Diferencia entre equipos
diferencia = datos.loc[0, "Media"] - datos.loc[1, "Media"]

ax.text(
    0.5,
    4.65,
    f"Diferencia promedio: {diferencia:.1f} días",
    ha="center",
    fontsize=12,
    fontweight="bold"
)

# ==========================================================
# TITULO Y EJES
# ==========================================================

ax.set_title(
    "Tiempo promedio de resolución de quejas",
    fontsize=17,
    fontweight="bold",
    pad=18
)

ax.set_xlabel(
    "Equipo de soporte",
    fontsize=11
)

ax.set_ylabel(
    "Tiempo promedio (días)",
    fontsize=11
)

ax.set_xticks(x)
ax.set_xticklabels(
    datos["Equipo"],
    fontsize=11
)

# ==========================================================
# EJE Y
# ==========================================================

ax.set_ylim(0, 5)

valores_y = np.arange(0, 5.1, 0.5)

ax.set_yticks(valores_y)
ax.set_yticklabels(
    [f"{v:.1f}" for v in valores_y]
)

# ==========================================================
# CUADRICULA
# ==========================================================

ax.grid(
    axis="y",
    linestyle="--",
    alpha=0.18
)

ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

plt.tight_layout()
plt.show()