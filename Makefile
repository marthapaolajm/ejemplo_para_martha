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
	cd $(<D) && bibtex herramientas
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
	rm --force reports/*.aux
	rm --force reports/*.bbl
	rm --force reports/*.blg
	rm --force reports/*.dvi
	rm --force reports/*.fdb_latexmk
	rm --force reports/*.fls
	rm --force reports/*.log
	rm --force reports/*.out
	rm --force reports/*.pdf
	rm --force reports/*.pytxcode
	
