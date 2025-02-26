# OpenChat GPT LLM Docker - Entorno Local

Este proyecto permite ejecutar el modelo OpenChat GPT LLM en un entorno local utilizando Docker, sin requerir aceleración GPU. Con esta configuración, es posible generar respuestas de lenguaje natural de manera eficiente y sencilla en tu máquina local, ideal para desarrollo o pruebas sin la necesidad de hardware especializado.

## Descripción

Este contenedor Docker proporciona un entorno para ejecutar el modelo de lenguaje OpenChat GPT, con la capacidad de generar respuestas sin depender de una GPU. El entorno se configura utilizando **Go 1.18**, además de las herramientas necesarias para la ejecución del modelo y la administración de scripts relacionados.

### Características principales:
- **Ejecución Local**: Se ejecuta completamente en la CPU, sin necesidad de aceleración por GPU.
- **Fácil Configuración**: Basado en Alpine Linux, se configuran las dependencias esenciales con un enfoque en simplicidad y tamaño reducido.
- **Modelo OpenChat GPT LLM**: El contenedor está diseñado para ejecutar modelos de lenguaje con la biblioteca Ollama, proporcionando respuestas naturales a partir de texto de entrada.
  
## Variables de Entorno

- `GO_VERSION`: La versión de Go que se instala (por defecto `1.18`).
- `GOPATH`: Define la ubicación del espacio de trabajo de Go (`/go`).
- `GOROOT`: Define el directorio donde se instala Go (`/usr/local/go`).
- `OLLAMA_MODELS`: Ruta donde se almacenan los modelos de Ollama (`/app/ollama/models/.ollama`).
- `OLLAMA_NUM_THREADS`: Número de hilos utilizados para la ejecución del modelo (por defecto `4`).
- `OLLAMA_DEBUG`: Modo de depuración activado (por defecto `1`).

## Dependencias

El contenedor incluye las siguientes dependencias esenciales:

- `bash`: Para la ejecución de scripts de shell.
- `git`: Para la gestión del código fuente.
- `curl`: Para descargar archivos y herramientas.
- `build-base`: Proporciona herramientas esenciales para compilar el código.

## Volúmenes

El contenedor mapea un volumen para datos persistentes:

- `/app/openchat`: El volumen donde se almacenan el modelo gguf openchat que sera cargado con ollama.

## Archivos Copiados

Se copian los siguientes directorios al contenedor:

- `webgollama/`: Contiene los archivos de la aplicación web que interactúa con el modelo GPT utilizando el cliente REST de gollama.
- `ollama/`: Contiene los scripts y recursos necesarios para cargar el modelo OpenChat GPT en formato gguf y exponerlo para su uso.

## Permisos

Los siguientes scripts se hacen ejecutables dentro del contenedor:

- `/app/ollama/start.sh`
- `/app/ollama/create.sh`

## Ejecución

El contenedor ejecuta el siguiente comando al iniciarse:

```bash
./start.sh & ./create.sh && go run main.go
```

## Construcción del Contenedor

docker build -t webgollama .

## Ejecución del Contenedor

docker run -d webgollama

## Licencia

Este proyecto está bajo la Licencia MIT.
