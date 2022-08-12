# Custom Jupyterlab

A Jupyterlab base image to be used on kubernetes with KFP:

This image aims to be used by data scientists and data engineers who deploy their environment on kuberentes.

Because it is root-based, it may be used to mount hostpath folders, following [this tutorial](http://andreclaudino.ml/kubernetes/creating-a-jupyter-lab-backed-up-on-s3) you can mount object storage folders like S3, Minio, Google Cloud Storage or any other compatible.

## Versions

Actualy there is a single version, 1.0.0, but in two flavours, a python 3.10 and a python 3.8.

They are:

```
andreclaudino/jupyterlab-py3.10
andreclaudino/jupyterlab-py3.8
```

The installed packages are describe in the table below.

| Package    |   Version |
|------------|-----------|
|jupyterlab|3.4.3|
|voila|0.3.6|
|jupyterlab_latex|3.1.0|
|jupyterlab-git|0.37.1|
|dask-kubernetes|2022.5.2|
|elyra[all]|3.10.1|
|smart-open|6.0.0|
|boto3|1.24.37|
|dask|2022.7.1|
|pandas|1.4.3|
|geopandas|0.11.1|
|bokeh|2.4.3|
|seaborn|0.11.2|
|scikit-learn|1.1.1|
|SQLAlchemy|1.4.39|
|PyHive[trino]|0.6.5|
|ipython-sql|0.4.1|
