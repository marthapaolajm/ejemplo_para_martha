# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
all: reports/herramientas.pdf

define checkDirectories
    mkdir --parents $(@D)
endef

# II. Declaración de las variables
# ================================

# III. Reglas para construir los objetivos principales
# ====================================================
# Generar PDFs de reportes

reports/herramientas.pdf: reports/herramientas.tex
	cd $(<D) && pdflatex $(<F)
	cd $(<D) && pdflatex $(<F)

# IV. Reglas para construir las dependencias de los objetivos principales
# =======================================================================
# Aquí se copian todas los archivos de datos y figuras que se utilizan como ingredientes.

# V Reglas del resto de los phonys
# =================================

# Borrar datos y PDFs
.PHONY: all clean
clean: