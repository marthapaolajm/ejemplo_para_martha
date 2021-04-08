# I Definición del _phony_ *all* que enlista todos los objetivos principales
# ==========================================================================
all: reports/aed_serpientes_isla_sabel.pdf

define checkDirectories
    mkdir --parents $(@D)
endef

# 2.II Declaración de las variables
# ================================
csvMonitoreoSerpientesIslaIsabel = \
	data/raw/monitoreo_serpiente_falsa_coralillo_isla_isabel_2008-2014.csv \
	data/raw/datapackage.json 

csvResumenCincoNumerosSerpientes = \
	reports/tables/resumen_cinco_numero_serpientes.csv

# 2.III Reglas para construir los objetivos principales
# ====================================================
# Generar PDFs de reportes

reports/aed_serpientes_isla_sabel.pdf: reports/aed_serpientes_isla_sabel.tex $(csvResumenCincoNumerosSerpientes)
	cd $(<D) && pdflatex $(<F)
	cd $(<D) && bibtex herramientas
	cd $(<D) && pdflatex $(<F)
	cd $(<D) && pdflatex $(<F)

# 2.IV Reglas para construir las dependencias de los objetivos principales
# =======================================================================
# Aquí se copian todas los archivos de datos y figuras que se utilizan como ingredientes.

$(csvMonitoreoSerpientesIslaIsabel):
	$(checkDirectories) 
	descarga_datos $(@F) $(@D)
	
$(csvResumenCincoNumerosSerpientes): $(csvMonitoreoSerpientesIslaIsabel) src/calculate_eda_snakes
	$(checkDirectories)
	src/calculate_eda_snakes

# V Reglas del resto de los phonys
# =================================
# Borrar datos y PDFs
.PHONY: all clean

clean:
	cd reports && ls | egrep --invert-match "*.tex|*.md|*.bib" | xargs --delimiter="\n" rm --recursive --force
	rm --recursive --force data
	rm --recursive --force tests/__pycache__
	rm --recursive --force mi_modulo/__pycache__
	
format:
	black --line-length 100 mi_modulo
	black --line-length 100 tests

mutants:
	mutmut run --paths-to-mutate mi_modulo

tests: install
	pytest --verbose
