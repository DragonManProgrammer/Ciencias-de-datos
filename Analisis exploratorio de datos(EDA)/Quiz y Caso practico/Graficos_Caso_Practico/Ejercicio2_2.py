import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ============================================================
# EJERCICIO 2.2 - Nivel de significancia, valor p y decision
# ============================================================

datos = pd.DataFrame({
    "Caso": ["A", "B", "C"],
    "Valor p": [0.032, 0.184, 0.049],
    "Alpha": [0.050, 0.050, 0.010]
})

# Decision estadistica
datos["Decision"] = np.where(
    datos["Valor p"] <= datos["Alpha"],
    "Rechazar H0",
    "No rechazar H0"
)

# Mostrar resultados en consola
print("\nEJERCICIO 2.2 - RESULTADOS")
print("-" * 45)

for _, fila in datos.iterrows():
    print(
        f"Caso {fila['Caso']}: "
        f"p = {fila['Valor p']:.3f} | "
        f"alpha = {fila['Alpha']:.3f} | "
        f"{fila['Decision']}"
    )

# ============================================================
# GRAFICA
# ============================================================

plt.style.use("dark_background")

fig, ax = plt.subplots(figsize=(9, 5.5))

fig.patch.set_facecolor("#111827")
ax.set_facecolor("#111827")

x = np.arange(len(datos))
ancho = 0.34

# Barras
barras_p = ax.bar(
    x - ancho / 2,
    datos["Valor p"],
    ancho,
    label="Valor p",
    color="#38bdf8"
)

barras_alpha = ax.bar(
    x + ancho / 2,
    datos["Alpha"],
    ancho,
    label="Alpha",
    color="#f97316"
)

# ============================================================
# Valores sobre las barras
# ============================================================

for barra in barras_p:
    altura = barra.get_height()

    ax.text(
        barra.get_x() + barra.get_width() / 2,
        altura + 0.004,
        f"{altura:.3f}",
        ha="center",
        va="bottom",
        fontsize=11,
        fontweight="bold"
    )

for barra in barras_alpha:
    altura = barra.get_height()

    ax.text(
        barra.get_x() + barra.get_width() / 2,
        altura + 0.004,
        f"{altura:.3f}",
        ha="center",
        va="bottom",
        fontsize=11,
        fontweight="bold"
    )

# ============================================================
# Decision debajo de cada caso
# ============================================================

for i, decision in enumerate(datos["Decision"]):

    if decision == "Rechazar H0":
        color = "#22c55e"
    else:
        color = "#facc15"

    ax.text(
        i,
        0.205,
        decision,
        ha="center",
        va="center",
        fontsize=10,
        fontweight="bold",
        color=color
    )

# ============================================================
# Configuracion visual
# ============================================================

ax.set_title(
    "Valor p vs Nivel de Significancia",
    fontsize=16,
    fontweight="bold",
    pad=18
)

ax.set_xlabel(
    "Casos",
    fontsize=11,
    labelpad=10
)

ax.set_ylabel(
    "Valor",
    fontsize=11
)

ax.set_xticks(x)
ax.set_xticklabels(
    ["Caso A", "Caso B", "Caso C"]
)

ax.set_ylim(0, 0.22)

ax.set_yticks(
    np.arange(0, 0.21, 0.02)
)

ax.grid(
    axis="y",
    linestyle="--",
    alpha=0.20
)

ax.legend(
    frameon=False,
    loc="upper right"
)

ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

plt.tight_layout()
plt.show()