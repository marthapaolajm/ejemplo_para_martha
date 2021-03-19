from mi_modulo import *


def test_nothing():
    pass


def test_error():
    assert 2 == 2


def test_add_two():
    expected_value = 3
    obtained_value = add_two(1)
    assert expected_value == obtained_value
