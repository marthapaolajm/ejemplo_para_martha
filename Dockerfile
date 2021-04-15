FROM islasgeci/base:13fe
RUN pip install pytest
RUN pip install mutmut
RUN pip install black