FROM islasgeci/base:13fe
RUN pip install \
    black \
    mutmut \
    pytest  
RUN pip install git+https://github.com/IslasGECI/pythontex_tools.git@v0.1.0
 