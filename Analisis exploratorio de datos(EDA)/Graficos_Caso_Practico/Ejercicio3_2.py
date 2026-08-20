import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ==========================================================
# EJERCICIO 3.2 - MONTO PROMEDIO POR CANAL
# ==========================================================

datos = pd.DataFrame({
    "Canal": ["Tienda física", "Tienda en línea"],
    "Media": [32500, 38900]
})

x = np.arange(len(datos))

# ==========================================================
# CONFIGURACION
# ==========================================================

plt.style.use("dark_background")

fig, ax = plt.subplots(figsize=(9, 5.5))

fig.patch.set_facecolor("#111827")
ax.set_facecolor("#111827")

# ==========================================================
# BARRAS
# ==========================================================

barras = ax.bar(
    x,
    datos["Media"],
    width=0.55,
    linewidth=0
)

# ==========================================================
# VALORES
# ==========================================================

for barra, valor in zip(barras, datos["Media"]):
    ax.text(
        barra.get_x() + barra.get_width() / 2,
        valor + 700,
        f"₡{valor:,.0f}",
        ha="center",
        va="bottom",
        fontsize=12,
        fontweight="bold"
    )

# ==========================================================
# TITULO Y EJES
# ==========================================================

ax.set_title(
    "Monto promedio de compra por canal",
    fontsize=17,
    fontweight="bold",
    pad=18
)

ax.set_xlabel("Canal de venta", fontsize=11)
ax.set_ylabel("Monto promedio (₡)", fontsize=11)

ax.set_xticks(x)
ax.set_xticklabels(
    datos["Canal"],
    fontsize=11
)

# ==========================================================
# EJE Y
# ==========================================================

ax.set_ylim(0, 45000)

valores_y = np.arange(0, 45001, 5000)

ax.set_yticks(valores_y)

ax.set_yticklabels(
    [f"₡{v:,.0f}" for v in valores_y]
)

# ==========================================================
# CUADRICULA
# ==========================================================

ax.grid(
    axis="y",
    linestyle="--",
    alpha=0.18
)

# Quitar bordes superiores y derechos
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

plt.tight_layout()
plt.show()