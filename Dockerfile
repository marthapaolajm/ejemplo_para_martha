FROM islasgeci/base:13fe
RUN pip install pytest
RUN pip install mumut
RUN pip install black