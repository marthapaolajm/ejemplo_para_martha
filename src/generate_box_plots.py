#!/usr/bin/env python
# generate_box_plots Calcula diagrama de cajas de datos de serpientes Isla Isabel.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt  # graficador
from geci_plots import *  
from mi_modulo import *
    
data_pandas = pd.read_csv(
    "data/raw/monitoreo_serpiente_falsa_coralillo_isla_isabel_2008-2014.csv",
)

lista_de_variables = ['Longitud_total','Longitud_hocico_cola', 'Longitud_cloaca_cola', 'Masa_del_individuo'] 
for feature in lista_de_variables:  
    data_feature = data_pandas[["Temporada", feature]].dropna()  

    boxsplotdata, seasons = create_box_plot_data(data_feature, feature)
    Graficador = Plotter(boxsplotdata)  #graf + grande y se remueva barras
    fig, ax = Graficador.set_box_plot_style(data_feature[feature],seasons)
    set_axis_labels(ax,feature)
    
    plt.savefig(f"reports/figures/diagrama_cajas_{feature}_serpientes_isabel.png", transparent=True, dpi=300)  
