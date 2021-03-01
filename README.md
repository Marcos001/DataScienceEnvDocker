# Data Science Docker Image  

Docker image for data science projects in R (3.6.3) and Python (3.8.1)

- Image starts with jupyterlab

- without GPU support

## Configure Data:

 - Insert the paths in: [.env.folder](.env.folder)
   	- PROJECT_FOLDER: application folder
   	- PROJECT_DATA: data folder

### [Build, run, stop and remove](Makefile) with make:

- `make build` to build image;
- `make up` to starting container;
- `make up-lab` to starting container with jupyter lab;
- `make stop` to stop container;
- `make clean` to stop and remove all containers;
- `make rm` to remove image **ds-cpu**.

## References

- [Environment Management with Docker](https://environments.rstudio.com/docker)
- [R Installations](https://environments.rstudio.com/r-installation.html)

## Autor

- [Marcos Vinícius](https://marcos001.github.io/)

