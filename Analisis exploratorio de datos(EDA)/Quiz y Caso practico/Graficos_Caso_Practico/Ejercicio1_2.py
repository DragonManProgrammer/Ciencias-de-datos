import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ============================================================
# LMB | EJERCICIO 1.2 — BOXplot
# ============================================================

# Valores del ejercicio
minimo, q1, mediana = 1, 2, 3
q3, maximo, atipico = 4, 6, 14

# Cálculos
ric = q3 - q1
porcentaje = 75

# DataFrame
datos = pd.DataFrame({
    "Medida": ["Mínimo", "Q1", "Mediana", "Q3", "Máximo", "Atípico"],
    "Valor": [minimo, q1, mediana, q3, maximo, atipico]
})

# ============================================================
# GRÁFICA
# ============================================================

plt.style.use("dark_background")

fig, ax = plt.subplots(figsize=(8, 4.8))
fig.patch.set_facecolor("#111827")
ax.set_facecolor("#111827")

# Boxplot
ax.bxp([{
    "med": mediana,
    "q1": q1,
    "q3": q3,
    "whislo": minimo,
    "whishi": maximo,
    "fliers": [atipico]
}],
vert=False,
patch_artist=True,
boxprops=dict(
    facecolor="#2563eb",
    edgecolor="#60a5fa",
    linewidth=2
),
medianprops=dict(
    color="white",
    linewidth=3
),
whiskerprops=dict(
    color="#d1d5db",
    linewidth=2
),
capprops=dict(
    color="#d1d5db",
    linewidth=2
),
flierprops=dict(
    marker="o",
    markerfacecolor="#f59e0b",
    markeredgecolor="white",
    markersize=9
))

# ============================================================
# VALORES SOBRE EL BOXPLOT
# ============================================================

for x, texto in [
    (1, "1"),
    (2, "2"),
    (3, "3"),
    (4, "4"),
    (6, "6"),
    (14, "14")
]:
    ax.text(
        x, 1.18,
        texto,
        ha="center",
        fontsize=10,
        fontweight="bold",
        color="white"
    )

# ============================================================
# TÍTULO
# ============================================================

ax.set_title(
    "LMB | Tiempo de entrega",
    fontsize=16,
    fontweight="bold",
    pad=20
)

ax.text(
    0.5, 1.01,
    "Ejercicio 1.2 • Lectura de Boxplot",
    transform=ax.transAxes,
    ha="center",
    fontsize=9,
    color="#9ca3af"
)

# ============================================================
# EJE X
# ============================================================

ax.set_xlabel(
    "Días",
    fontsize=10,
    color="#d1d5db"
)

ax.set_xlim(0, 15)
ax.set_xticks(np.arange(0, 16, 2))

# ============================================================
# INFORMACIÓN SUPERIOR
# ============================================================

ax.text(
    0.02, 0.88,
    "Q1 = 2   |   Mediana = 3   |   Q3 = 4",
    transform=ax.transAxes,
    fontsize=9,
    color="#cbd5e1"
)

ax.text(
    0.98, 0.88,
    "Atípico = 14",
    transform=ax.transAxes,
    ha="right",
    fontsize=9,
    color="#fbbf24"
)

# ============================================================
# ESTILO
# ============================================================

ax.set_yticks([])

ax.grid(
    axis="x",
    linestyle="--",
    alpha=0.15
)

ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)
ax.spines["left"].set_visible(False)

plt.tight_layout()
plt.show()

# ============================================================
# RESULTADOS
# ============================================================

print("\nLMB — EJERCICIO 1.2")
print("-" * 35)
print(datos.to_string(index=False))
print(f"\nRIC = {ric} días")
print(f"Pedidos en 4 días o menos = {porcentaje}%")
print("Valor atípico = 14 días")