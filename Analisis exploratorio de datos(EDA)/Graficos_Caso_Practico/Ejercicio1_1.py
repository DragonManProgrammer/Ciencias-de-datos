
# =============================================================================
# IMPORTACIÓN DE LIBRERÍAS
# =============================================================================

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


# =============================================================================
# 1. DATOS DEL EJERCICIO
# =============================================================================

datos = [
    18, 22, 25, 27, 29,
    30, 31, 33, 35, 36,
    38, 40, 42, 45, 98
]


# =============================================================================
# 2. CREACIÓN DEL DATAFRAME
# =============================================================================

df = pd.DataFrame({
    "Monto": datos
})


# =============================================================================
# 3. ORDENAR LOS DATOS
# =============================================================================

df = df.sort_values(
    by="Monto"
).reset_index(
    drop=True
)

valores = df["Monto"].tolist()


# =============================================================================
# 4. CÁLCULO DE LA MEDIANA
# =============================================================================

mediana = np.median(valores)


# =============================================================================
# 5. DIVISIÓN EN MITADES
# =============================================================================

# Como existen 15 datos, la mediana corresponde al octavo valor.
#
# La mediana no se incluye en ninguna de las dos mitades.

mitad_inferior = valores[:7]

mitad_superior = valores[8:]


# =============================================================================
# 6. CÁLCULO DE Q1 Y Q3
# =============================================================================

# Q1:
#
# 18, 22, 25, 27, 29, 30, 31
#
# Valor central = 27

q1 = np.median(mitad_inferior)


# Q3:
#
# 35, 36, 38, 40, 42, 45, 98
#
# Valor central = 40

q3 = np.median(mitad_superior)


# =============================================================================
# 7. CÁLCULO DEL RIC
# =============================================================================

ric = q3 - q1


# =============================================================================
# 8. CÁLCULO DE 1.5 × RIC
# =============================================================================

factor_ric = 1.5 * ric


# =============================================================================
# 9. CÁLCULO DE LOS LÍMITES
# =============================================================================

limite_inferior = q1 - factor_ric

limite_superior = q3 + factor_ric


# =============================================================================
# 10. IDENTIFICACIÓN DE VALORES ATÍPICOS
# =============================================================================

atipicos = df[
    (df["Monto"] < limite_inferior) |
    (df["Monto"] > limite_superior)
]["Monto"].values


# =============================================================================
# 11. RESULTADOS EN CONSOLA
# =============================================================================

print()
print("=" * 72)
print("LMB — ANÁLISIS ESTADÍSTICO DE PEDIDOS")
print("Ejercicio 1.1 — Cuartiles, RIC y valores atípicos")
print("=" * 72)

print("\nDATOS ORDENADOS")
print("-" * 72)

print(
    ", ".join(
        str(valor)
        for valor in valores
    )
)

print("\nRESULTADOS")
print("-" * 72)

print(f"Q1                  : {q1:.0f} mil colones")
print(f"Mediana             : {mediana:.0f} mil colones")
print(f"Q3                  : {q3:.0f} mil colones")
print(f"RIC                 : {ric:.0f} mil colones")
print(f"1.5 × RIC           : {factor_ric:.1f}")
print(f"Límite inferior     : {limite_inferior:.1f} mil colones")
print(f"Límite superior     : {limite_superior:.1f} mil colones")

if len(atipicos) > 0:

    print(
        f"Valor(es) atípico(s): "
        f"{', '.join(str(int(valor)) for valor in atipicos)} "
        f"mil colones"
    )

else:

    print("Valor(es) atípico(s): Ninguno")

print("=" * 72)


# =============================================================================
# 12. COLORES DEL DASHBOARD
# =============================================================================

FONDO = "#0F172A"

PANEL = "#162235"

TEXTO = "#F8FAFC"

SECUNDARIO = "#94A3B8"

AZUL = "#38BDF8"

VERDE = "#34D399"

MORADO = "#A78BFA"

NARANJA = "#FBBF24"

ROJO = "#FB7185"


# =============================================================================
# 13. CREACIÓN DE LA FIGURA
# =============================================================================

fig = plt.figure(
    figsize=(12, 7),
    facecolor=FONDO
)


# =============================================================================
# 14. TÍTULO PRINCIPAL
# =============================================================================

fig.text(
    0.07,
    0.955,
    "LMB  |  Análisis de pedidos semanales",
    color=TEXTO,
    fontsize=21,
    fontweight="bold",
    ha="left",
    va="top"
)


# =============================================================================
# 15. SUBTÍTULO
# =============================================================================

fig.text(
    0.07,
    0.915,
    "Cuartiles  •  Rango intercuartílico  •  Detección de valores atípicos",
    color=SECUNDARIO,
    fontsize=10.5,
    ha="left",
    va="top"
)


# =============================================================================
# 16. INDICADOR Q1
# =============================================================================

fig.text(
    0.18,
    0.855,
    "Q1",
    color=AZUL,
    fontsize=9,
    fontweight="bold",
    ha="center"
)

fig.text(
    0.18,
    0.815,
    f"{q1:.0f}",
    color=TEXTO,
    fontsize=18,
    fontweight="bold",
    ha="center"
)

fig.text(
    0.18,
    0.785,
    "mil ₡",
    color=SECUNDARIO,
    fontsize=8,
    ha="center"
)


# =============================================================================
# 17. INDICADOR MEDIANA
# =============================================================================

fig.text(
    0.39,
    0.855,
    "MEDIANA",
    color=VERDE,
    fontsize=9,
    fontweight="bold",
    ha="center"
)

fig.text(
    0.39,
    0.815,
    f"{mediana:.0f}",
    color=TEXTO,
    fontsize=18,
    fontweight="bold",
    ha="center"
)

fig.text(
    0.39,
    0.785,
    "mil ₡",
    color=SECUNDARIO,
    fontsize=8,
    ha="center"
)


# =============================================================================
# 18. INDICADOR Q3
# =============================================================================

fig.text(
    0.61,
    0.855,
    "Q3",
    color=MORADO,
    fontsize=9,
    fontweight="bold",
    ha="center"
)

fig.text(
    0.61,
    0.815,
    f"{q3:.0f}",
    color=TEXTO,
    fontsize=18,
    fontweight="bold",
    ha="center"
)

fig.text(
    0.61,
    0.785,
    "mil ₡",
    color=SECUNDARIO,
    fontsize=8,
    ha="center"
)


# =============================================================================
# 19. INDICADOR RIC
# =============================================================================

fig.text(
    0.82,
    0.855,
    "RIC",
    color=NARANJA,
    fontsize=9,
    fontweight="bold",
    ha="center"
)

fig.text(
    0.82,
    0.815,
    f"{ric:.0f}",
    color=TEXTO,
    fontsize=18,
    fontweight="bold",
    ha="center"
)

fig.text(
    0.82,
    0.785,
    "mil ₡",
    color=SECUNDARIO,
    fontsize=8,
    ha="center"
)


# =============================================================================
# 20. ÁREA PRINCIPAL DEL GRÁFICO
# =============================================================================

ax = fig.add_axes(
    [0.08, 0.25, 0.84, 0.45]
)

ax.set_facecolor(PANEL)


# =============================================================================
# 21. BOXPLOT
# =============================================================================

ax.boxplot(
    df["Monto"],

    vert=False,

    widths=0.30,

    patch_artist=True,

    showfliers=True,

    boxprops=dict(
        facecolor="#1E3A4F",
        edgecolor=AZUL,
        linewidth=2
    ),

    medianprops=dict(
        color=VERDE,
        linewidth=3
    ),

    whiskerprops=dict(
        color=SECUNDARIO,
        linewidth=2
    ),

    capprops=dict(
        color=SECUNDARIO,
        linewidth=2
    ),

    flierprops=dict(
        marker="o",
        markerfacecolor=ROJO,
        markeredgecolor="#FFFFFF",
        markersize=10,
        markeredgewidth=1.5
    )
)


# =============================================================================
# 22. LÍNEA DEL LÍMITE INFERIOR
# =============================================================================

# Se muestra explícitamente el límite inferior calculado:
#
# 27 - 19.5 = 7.5

ax.axvline(
    limite_inferior,
    color=NARANJA,
    linestyle=":",
    linewidth=1.8,
    alpha=0.80
)


# =============================================================================
# 23. LÍNEA Q1
# =============================================================================

ax.axvline(
    q1,
    color=AZUL,
    linestyle="--",
    linewidth=1.2,
    alpha=0.55
)


# =============================================================================
# 24. LÍNEA MEDIANA
# =============================================================================

ax.axvline(
    mediana,
    color=VERDE,
    linestyle="--",
    linewidth=1.3,
    alpha=0.60
)


# =============================================================================
# 25. LÍNEA Q3
# =============================================================================

ax.axvline(
    q3,
    color=MORADO,
    linestyle="--",
    linewidth=1.2,
    alpha=0.55
)


# =============================================================================
# 26. LÍNEA DEL LÍMITE SUPERIOR
# =============================================================================

ax.axvline(
    limite_superior,
    color=NARANJA,
    linestyle=":",
    linewidth=1.8,
    alpha=0.80
)


# =============================================================================
# 27. ETIQUETA DEL LÍMITE INFERIOR
# =============================================================================

ax.text(
    limite_inferior,
    0.82,
    f"LÍMITE INFERIOR\n{limite_inferior:.1f}",
    ha="center",
    va="top",
    color=NARANJA,
    fontsize=9,
    fontweight="bold",

    bbox=dict(
        boxstyle="round,pad=0.35",
        facecolor=PANEL,
        edgecolor="none"
    )
)


# =============================================================================
# 28. ETIQUETA Q1
# =============================================================================

ax.text(
    q1,
    1.16,
    f"Q1\n{q1:.0f} mil",
    ha="center",
    va="bottom",
    color=AZUL,
    fontsize=10,
    fontweight="bold",

    bbox=dict(
        boxstyle="round,pad=0.35",
        facecolor=PANEL,
        edgecolor="none"
    )
)


# =============================================================================
# 29. ETIQUETA MEDIANA
# =============================================================================

ax.text(
    mediana,
    0.82,
    f"MEDIANA\n{mediana:.0f} mil",
    ha="center",
    va="top",
    color=VERDE,
    fontsize=10,
    fontweight="bold",

    bbox=dict(
        boxstyle="round,pad=0.35",
        facecolor=PANEL,
        edgecolor="none"
    )
)


# =============================================================================
# 30. ETIQUETA Q3
# =============================================================================

ax.text(
    q3,
    1.16,
    f"Q3\n{q3:.0f} mil",
    ha="center",
    va="bottom",
    color=MORADO,
    fontsize=10,
    fontweight="bold",

    bbox=dict(
        boxstyle="round,pad=0.35",
        facecolor=PANEL,
        edgecolor="none"
    )
)


# =============================================================================
# 31. ETIQUETA DEL LÍMITE SUPERIOR
# =============================================================================

ax.text(
    limite_superior,
    0.82,
    f"LÍMITE SUPERIOR\n{limite_superior:.1f}",
    ha="center",
    va="top",
    color=NARANJA,
    fontsize=9,
    fontweight="bold",

    bbox=dict(
        boxstyle="round,pad=0.35",
        facecolor=PANEL,
        edgecolor="none"
    )
)


# =============================================================================
# 32. IDENTIFICACIÓN DEL VALOR ATÍPICO
# =============================================================================

for valor in atipicos:

    ax.annotate(
        f"VALOR ATÍPICO\n{valor:.0f} mil",

        xy=(valor, 1),

        xytext=(valor - 8, 1.35),

        ha="center",
        va="bottom",

        color=ROJO,

        fontsize=10,

        fontweight="bold",

        bbox=dict(
            boxstyle="round,pad=0.35",
            facecolor=PANEL,
            edgecolor="none"
        ),

        arrowprops=dict(
            arrowstyle="->",
            color=ROJO,
            linewidth=1.5
        )
    )


# =============================================================================
# 33. ETIQUETA DEL EJE X
# =============================================================================

ax.set_xlabel(
    "Monto del pedido — miles de colones",
    color=SECUNDARIO,
    fontsize=10,
    labelpad=12
)


# =============================================================================
# 34. ELIMINAR EJE Y
# =============================================================================

# Se elimina para evitar texto innecesario y problemas de espacio.

ax.set_yticks([])

ax.tick_params(
    axis="y",
    length=0
)


# =============================================================================
# 35. RANGO DEL EJE X
# =============================================================================

# Se inicia en 0 para que el límite inferior de 7.5 sea visible.

ax.set_xlim(
    0,
    108
)


# =============================================================================
# 36. CUADRÍCULA
# =============================================================================

ax.grid(
    axis="x",
    color="#FFFFFF",
    alpha=0.07,
    linestyle="-",
    linewidth=0.8
)


# =============================================================================
# 37. ESTILO DEL EJE X
# =============================================================================

ax.tick_params(
    axis="x",
    colors=SECUNDARIO,
    labelsize=9
)


# =============================================================================
# 38. ELIMINAR BORDES
# =============================================================================

for spine in ax.spines.values():
    spine.set_visible(False)


# =============================================================================
# 39. ALERTA DE VALOR ATÍPICO
# =============================================================================

if len(atipicos) > 0:

    fig.text(
        0.5,
        0.145,
        f"●  VALOR ATÍPICO DETECTADO: "
        f"{atipicos[0]:.0f} mil colones",
        ha="center",
        va="center",
        color=ROJO,
        fontsize=10.5,
        fontweight="bold"
    )


# =============================================================================
# 40. INFORMACIÓN DE LOS LÍMITES
# =============================================================================

fig.text(
    0.5,
    0.105,
    f"Límite inferior: {limite_inferior:.1f}   •   "
    f"Límite superior: {limite_superior:.1f}   •   "
    f"Regla: 1.5 × RIC",
    ha="center",
    va="center",
    color=SECUNDARIO,
    fontsize=8.5
)


# =============================================================================
# 41. PIE DEL DASHBOARD
# =============================================================================

fig.text(
    0.07,
    0.045,
    "LMB  |  Análisis estadístico",
    color=SECUNDARIO,
    fontsize=8,
    ha="left"
)

fig.text(
    0.93,
    0.045,
    "15 pedidos analizados",
    color=SECUNDARIO,
    fontsize=8,
    ha="right"
)


# =============================================================================
# 42. MOSTRAR DASHBOARD
# =============================================================================

plt.show()


# =============================================================================
# FIN DEL PROGRAMA
# =============================================================================