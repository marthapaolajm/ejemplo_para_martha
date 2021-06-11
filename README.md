# ejemplo_para_martha

## Descripción

Este repositorio fue creado con el fin de documentar mi proyecto de vinculación con valor en créditos (PVVC) durante la estancia en el Grupo de Ecología y Conservación de Islas (GECI).
En donde se encuentran dos reportes:

### Herramientas para Ciencia de Datos.
Se describen las herramientas utilizadas en el equipo de ciencias de datos, así también, se exponen algunos procedimientos que se llevan a cabo y se explica la utilización de varias cuentas que son utilizadas por el equipo.

### Análisis Exploratorio de Datos en Isla Isabel
Se exponen los datos capturados del monitorio de serpiente falsa coralillo de Isla Isabel en la temporada 2008 a 2014. Mediante los cuales se describirán estos datos, mediante un resumen de cinco números y un diagrama de cajas.

#### Instrucciones
```
git clone https://github.com/marthapaolajm/ejemplo_para_martha.git
cd ejemplo_para_martha
git checkout develop
docker build --tag ejemplo_para_martha .
docker run --volume ${PWD}:/workdir --env BITBUCKET_USERNAME="${BITBUCKET_USERNAME}" --env BITBUCKET_PASSWORD="${BITBUCKET_PASSWORD}" ejemplo_para_martha make
xdg-open reports/aed_serpientes_isla_isabel.pdf
```

## Tecnologías usadas

En este repositorio se agregaron cinco archivos, los cuales son: 

1. README.md
2. Makefile
3. Dockerfile
4. analyses.json 
5. actions.yml 
