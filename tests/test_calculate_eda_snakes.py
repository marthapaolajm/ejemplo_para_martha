from mi_modulo import *
import numpy as np
import pandas as pd
import pytest

def test_nothing():
    pass


def test_error():
    assert 2 == 2


def test_add_two():
    expected_value = 3
    obtained_value = add_two(1)
    assert expected_value == obtained_value


def test_add_three():
    expected_value = 4
    obtained_value = add_three(1)
    assert expected_value == obtained_value

def test_set_axis_labels():
    fig, expected_ax_one = geci_plot()
    fig, expected_ax_two = geci_plot()
    fig, obteined_ax_one = geci_plot()
    fig, obteined_ax_two = geci_plot()
    variable_uno = "Masa_del_individuo"
    variable_dos = "Longitud_Total"
    expected_ax_one.set_ylabel("Masa del individuo (gr)", fontsize=25, labelpad=10)
    expected_value_gr = expected_ax_one.get_ylabel()
    set_axis_labels(obteined_ax_one,variable_uno)
    obtained_value_gr = obteined_ax_one.get_ylabel()
    expected_ax_two.set_ylabel("Longitud Total (cm)", fontsize=25, labelpad=10)
    expected_value_cm = expected_ax_two.get_ylabel()
    set_axis_labels(obteined_ax_two,variable_dos)
    obtained_value_cm = obteined_ax_two.get_ylabel()
    assert expected_value_gr == obtained_value_gr
    assert expected_value_cm == obtained_value_cm

def test_create_box_plot_data():
    df_test = pd.DataFrame({"Temporada": [2000,2001,2002,2001], "Longitud": [10,20,30,40]})
    obtained_box_plot_data, obtained_seasons = create_box_plot_data(df_test,"Longitud")
    expected_box_plot_data = [pd.Series(10,index=[0], name="Longitud"),pd.Series([20,40],index=[1,3], name="Longitud"),pd.Series(30,index=[2], name="Longitud")]
    expected_seasons = [2000,2001,2002]
    np.testing.assert_array_equal(obtained_seasons,expected_seasons) 
    for i in range(3):
        pd.testing.assert_series_equal(obtained_box_plot_data[i], expected_box_plot_data[i])

@pytest.mark.mpl_image_compare(tolerance=0, savefig_kwargs={'dpi':300})
def test_set_box_plot_style():
    diccionario = {"A": [10,22,30,44,10.1,20.2,30.3,40.4], "Temporada":[2013,2013,2013,2013,2015,2015,2015,2015]}
    data_feature = pd.DataFrame(diccionario)
    feature = "A"
    boxsplotdata, seasons = create_box_plot_data(data_feature, feature)
    Graficador = Plotter(boxsplotdata)  #graf + grande y se remueva barras
    fig, ax = Graficador.set_box_plot_style(data_feature[feature],seasons)
    set_axis_labels(ax, "Masa_del_individuo")
    return fig

# @pytest.mark.mpl_image_compare(tolerance=0)
# def test_set_ticks():
# diccionario = {"A": [10,22,30,44,10.1,20.2,30.3,40.4], "Temporada":[2013,2013,2013,2013,2015,2015,2015,2015]}
# data_feature = pd.DataFrame(diccionario)
# feature = "A"
# boxsplotdata, seasons = create_box_plot_data(data_feature, feature)
# Graficador = Plotter(boxsplotdata)  #graf + grande y se remueva barras
# fig, ax = Graficador.set_ticks()
# set_ticks()
# return fig
