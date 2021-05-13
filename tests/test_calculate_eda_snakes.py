from mi_modulo import *
import numpy as np

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

def test_create_box_plot_data():
    df_test = pd.DataFrame({"Temporada": [2000,2001,2002,2001], "Longitud": [10,20,30,40]})
    obtained_box_plot_data, obtained_seasons = create_box_plot_data(df_test,"Longitud")
    expected_box_plot_data = [10,20,30]
    expected_seasons = [2000,2001,2002]
    np.testing.assert_array_equal(obtained_seasons,expected_seasons) 
    np.testing.assert_array_equal(obtained_box_plot_data,expected_box_plot_data) 

