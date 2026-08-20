import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ==========================================
# PASO 1: Datos
# ==========================================

vendedores = list(range(1, 16))

gastos = [
    45, 52, 38, 60, 48,
    55, 42, 50, 58, 47,
    5, 53, 310, 44, 49
]

# ==========================================
# PASO 2: Crear DataFrame
# ==========================================

df = pd.DataFrame({
    "Vendedor": vendedores,
    "Gasto": gastos
})

# ==========================================
# PASO 3: Calcular cuartiles
# ==========================================

Q1 = df["Gasto"].quantile(0.25)
Q3 = df["Gasto"].quantile(0.75)

# Calcular rango intercuartílico
IQR = Q3 - Q1

# ==========================================
# PASO 4: Calcular límites para detectar
# valores atípicos
# ==========================================

limite_inferior = Q1 - 1.5 * IQR
limite_superior = Q3 + 1.5 * IQR

# ==========================================
# PASO 5: Identificar valores atípicos
# ==========================================

atipicos = df[
    (df["Gasto"] < limite_inferior) |
    (df["Gasto"] > limite_superior)
]

# Mostrar resultados
print("Q1:", Q1)
print("Q3:", Q3)
print("IQR:", IQR)
print("Límite inferior:", limite_inferior)
print("Límite superior:", limite_superior)

print("\nValores atípicos:")
print(atipicos)

# ==========================================
# PASO 6: Crear gráfico
# ==========================================

plt.style.use('dark_background')

fig, ax = plt.subplots(figsize=(10, 6))

fig.patch.set_facecolor('#1e1e2e')
ax.set_facecolor('#2a2a3c')

# ==========================================
# PASO 7: Crear barras
# ==========================================

barras = ax.bar(
    df["Vendedor"],
    df["Gasto"],
    width=0.65,
    color='#4dabf7',
    edgecolor='#dcdcdc',
    linewidth=1
)

# ==========================================
# PASO 8: Resaltar valores atípicos
# ==========================================

for i, fila in df.iterrows():

    if fila["Vendedor"] in atipicos["Vendedor"].values:
        barras[i].set_color('#ff6b6b')

# ==========================================
# PASO 9: Línea del límite superior
# ==========================================

ax.axhline(
    limite_superior,
    color='#ffd43b',
    linestyle='--',
    linewidth=2,
    label=f'Límite superior = {limite_superior:.2f}'
)

# ==========================================
# PASO 10: Línea del límite inferior
# ==========================================

ax.axhline(
    limite_inferior,
    color='#51cf66',
    linestyle='--',
    linewidth=2,
    label=f'Límite inferior = {limite_inferior:.2f}'
)

# ==========================================
# PASO 11: Mostrar valores sobre las barras
# ==========================================

for barra, valor in zip(barras, df["Gasto"]):

    ax.text(
        barra.get_x() + barra.get_width() / 2,
        barra.get_height() + 5,
        f'{valor}',
        ha='center',
        va='bottom',
        fontsize=9,
        color='white'
    )

# ==========================================
# PASO 12: Título
# ==========================================

ax.set_title(
    'Gasto por vendedor y detección de valores atípicos',
    fontsize=14,
    fontweight='bold',
    color='white',
    pad=15
)

# ==========================================
# PASO 13: Etiquetas de los ejes
# ==========================================

ax.set_xlabel(
    'Vendedor',
    fontsize=11,
    color='white'
)

ax.set_ylabel(
    'Gasto (miles ₡)',
    fontsize=11,
    color='white'
)

# ==========================================
# PASO 14: Eje X
# ==========================================

ax.set_xticks(vendedores)

ax.tick_params(colors='white')

# ==========================================
# PASO 15: Cuadrícula
# ==========================================

ax.grid(
    axis='y',
    linestyle='--',
    alpha=0.3,
    color='gray'
)

# ==========================================
# PASO 16: Bordes
# ==========================================

for spine in ax.spines.values():
    spine.set_color('#555566')

# ==========================================
# PASO 17: Leyenda
# ==========================================

ax.legend()

# ==========================================
# PASO 18: Ajustar gráfico
# ==========================================

plt.tight_layout()

# ==========================================
# PASO 19: Guardar gráfico
# ==========================================

plt.savefig(
    'grafico_barras_gasto.png',
    dpi=150,
    facecolor=fig.get_facecolor()
)

# ==========================================
# PASO 20: Mostrar gráfico
# ==========================================

plt.show()