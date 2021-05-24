FROM islasgeci/base:13fe
RUN pip install \
    black \
    mutmut \
    pytest \ 
    pytest-mpl
RUN pip install git+https://github.com/IslasGECI/pythontex_tools.git@v0.1.0 \
                git+https://github.com/IslasGECI/analytictools.git@bf4af5a568534e120fe1228277584226c97e017e
 