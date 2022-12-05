FROM jupyter/tensorflow-notebook:tensorflow-2.10.0

WORKDIR /home/jovyan/
RUN git clone https://github.com/tensorflow/models.git

WORKDIR /home/jovyan/models/research/
RUN protoc object_detection/protos/*.proto --python_out=.
RUN cp object_detection/packages/tf2/setup.py .
RUN python -m pip install .

COPY TSNotebook.ipynb /home/jovyan/models/research/TSNotebook.ipynb

RUN pip install -q kaggle