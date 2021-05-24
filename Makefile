# I Definición del _phony_ *all* que enlista todos los objetivos principales
# ==========================================================================
all: reports/aed_serpientes_isla_isabel.pdf \
	 reports/herramientas.pdf

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

pngDiagramasDeCajasSerpientesIsabel = \
	reports/figures/diagrama_cajas_Longitud_cloaca_cola_serpientes_isabel.png \
	reports/figures/diagrama_cajas_Longitud_hocico_cola_serpientes_isabel.png \
	reports/figures/diagrama_cajas_Longitud_total_serpientes_isabel.png \
	reports/figures/diagrama_cajas_Masa_del_individuo_serpientes_isabel.png

# 2.III Reglas para construir los objetivos principales
# ====================================================
# Generar PDFs de reportes

reports/herramientas.pdf: reports/herramientas.tex 
	cd $(<D) && pdflatex $(<F) 
	cd $(<D) && bibtex herramientas
	cd $(<D) && pdflatex $(<F)
	cd $(<D) && pdflatex $(<F)

reports/aed_serpientes_isla_isabel.pdf: reports/aed_serpientes_isla_isabel.tex $(csvResumenCincoNumerosSerpientes) $(pngDiagramasDeCajasSerpientesIsabel)
	cd $(<D) && pdflatex $(<F)
	cd $(<D) && pythontex $(<F)
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

$(pngDiagramasDeCajasSerpientesIsabel): $(csvMonitoreoSerpientesIslaIsabel) src/generate_box_plots.py
	$(checkDirectories)
	python -m src.generate_box_plots

# V Reglas del resto de los phonys
# =================================
# Borrar datos y PDFs
.PHONY: all clean format mutants tests

clean:
	cd reports && ls | egrep --invert-match "*.tex|*.md|*.bib" | xargs --delimiter="\n" rm --recursive --force
	rm --recursive --force data
	rm --recursive --force tests/__pycache__
	rm --recursive --force mi_modulo/__pycache__
	rm --recursive --force src/__pycache__
	rm --recursive --force reports/pythontex-files-aed_serpientes_isla_isabel
	
format:
	black --line-length 100 mi_modulo
	black --line-length 100 tests
	black --line-length 100 src/*

mutants:
	mutmut run --paths-to-mutate mi_modulo

tests:
	pytest --mpl --verbose

set_tests:
	mkdir --parents tests/baseline
	pytest --mpl-generate-path tests/baseline/
