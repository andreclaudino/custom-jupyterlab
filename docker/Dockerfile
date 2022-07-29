ARG BASE_IMAGE=python:3.10.5-slim-buster
FROM ${BASE_IMAGE}

ENV NOTEBOOK_HOME=/home/jupyter
ENV RUNNING_USER="developer"
ENV BASE_DIR=/root

RUN apt-get update && \
    apt-get install -y git ssh && \
    apt-get clean

RUN chmod 777 -R /usr/local/etc/

RUN useradd --create-home jupyter
RUN chown jupyter -R $NOTEBOOK_HOME/
ENV PATH=$PATH:/root/.local/bin:/home/jupyter/.local/bin

ADD entrypoint.sh /usr/bin/entrypoint.sh
ADD jupyter_server_config.py $BASE_DIR/.jupyter/jupyter_server_config.py
RUN chmod +x /usr/bin/entrypoint.sh && \
    usermod -aG root jupyter

RUN pip3 install --user --upgrade pip
RUN pip3 install --user jupyterlab==3.4.3
RUN pip3 install --user voila==0.3.6
RUN pip3 install --user jupyterlab_latex==3.1.0
RUN pip3 install --user jupyterlab-git==0.37.1
RUN pip3 install --user dask-kubernetes==2022.5.2
RUN pip3 install --user elyra[all]==3.10.1
RUN pip3 install --user smart-open==6.0.0
RUN pip3 install --user boto3==1.24.37
RUN pip3 install --user dask==2022.7.1
RUN pip3 install --user pandas==1.4.3
RUN pip3 install --user geopandas==0.11.1
RUN pip3 install --user bokeh==2.4.3
RUN pip3 install --user seaborn==0.11.2
RUN pip3 install --user scikit-learn==1.1.1
RUN pip3 install --user SQLAlchemy==1.4.39
RUN pip3 install --user PyHive[trino]==0.6.5
RUN pip3 install --user ipython-sql==0.4.1

RUN jupyter server extension enable elyra

ADD gitignore /home/jupyter/.gitignore
ENTRYPOINT bash -c "entrypoint.sh"