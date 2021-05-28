import numpy as np
import pandas as pd
import matplotlib.pyplot as plt  # graficador
from geci_plots import *  

def add_two(number):
    return number + 2


def add_three(number):
    return number + 3

def set_axis_labels(ax,variable):
    ax.set_xlabel("Temporadas", fontsize=25, labelpad=10)
    if variable == "Masa_del_individuo":     
        ax.set_ylabel(f'{variable.replace("_"," ")} (gr)', fontsize=25, labelpad=10)
    else:
        ax.set_ylabel(f'{variable.replace("_"," ")} (cm)', fontsize=25, labelpad=10)

def create_box_plot(boxplotdata):
    fig, ax = geci_plot()  #graf + grande y se remueva barras
    ax.boxplot(boxplotdata)
    return fig, ax

def set_box_plot_style(ax,df,seasons,fig):
    ticks_positions = ticks_positions_array(seasons)
    upper_limit = roundup(np.max(df), 10) 
    plt.ylim(0,upper_limit)  
    rounded_ticks = rounded_ticks_array(upper_limit, 0)  
    plt.yticks(rounded_ticks, size=20)
    ax.tick_params(axis="y", labelsize=20, labelrotation=90)
    ax.tick_params(axis="x", labelsize=20)
    plt.xticks(ticks_positions, seasons, size = 20, color = 'k') 
    return fig
    
def create_box_plot_data(data_feature,column_name):
    boxsplotdata = []
    seasons = data_feature["Temporada"].unique() 
    for i in seasons:
        mask = data_feature["Temporada"]==i 
        data_feature_per_season = data_feature[mask][column_name] 
        boxsplotdata.append(data_feature_per_season) 
    return boxsplotdata, seasons

class graficador():
    def __init__():
        pass