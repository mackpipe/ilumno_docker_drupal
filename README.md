# Proyecto de Docker para Drupal 8

## Pasos a Seguir
- Clone este repositorio https://github.com/mackpipe/ilumno_docker_drupal.git en su equipo
- Ubiquese en la carpeta del repositorio
  `cd ilumno_docker_drupal`
- Ejecute el archivo ilumno.sh 
  `./ilumno.sh`  
    Este archivo genera los siguientes procesos
  - Genera una imagen utilizando el archivo Dockerfile
  - Levanta dos contenedoras, una para Mysql y otra para Drupal, usando la imagen creada con Dockerfile

Existe un archivo llamado **ilumno.env** en el cual se almacenan las variables de ambiente usadas en todo el proceso, cambielas a su desición si es el caso. por defecto se dejaron las apropiadas para que el contenedor de la aplicación drupal cargue correctamente.

Al finalizar el proceso ejecutado por el archivo **ilumno.sh**  se evidnecia un estado final en la siguiente imagen
![image](https://user-images.githubusercontent.com/1072188/118704080-5ca5f400-b7dc-11eb-8da3-12d01bb0ad8e.png)

## Probar la aplicación.
- Para ingresar a la aplicación desplegada de drupal usar esta url **http://localhost:81/app/web/**
  ![image](https://user-images.githubusercontent.com/1072188/118704380-aabaf780-b7dc-11eb-8339-e1e408a2a919.png)
- Las credenciales de acceso son:
  -  Usuario : admin
  -  Clave   : $Admin$.
- Para validar la funcionalidad del formulario de programas dirijase a la url **http://localhost:81/app/web/ilumno-module/form**
  ![image](https://user-images.githubusercontent.com/1072188/118704777-18ffba00-b7dd-11eb-9c6e-e1ac3a95b74f.png)


## Notas
- El drupal que se instala esta instalado como un proyecto composer, no es el oficial que trae la imagen de dockerhub **drupal:8-apache**
- Al cargar la contenedor de Mysql se corre un backup de drupal, ya listo para trabajar con los modulos necesarios
- Los modulos de ilumno_programs y ilumno_programs_rest se descargan una vez se haya cargado la contenedora de Drupal, se hace a través del archivo entrypoint.sh y se obtienen de repositorios de GitHub, estan disponibles en git como proyectos independientes en las siguientes direcciones por si se desea validar su contenido
  - https://github.com/mackpipe/ilumno_programs.git
  - https://github.com/mackpipe/ilumno_programs_rest.git
 
 
 ## Prueba Tecnica
 ### Teoria
 - Qué comando se requiere para crear un repositorio en Git?
   - `git init`
 - Cuál es el comando utilizado para listar los cambios (commits) que han producido en el 
repositorio de Git?
   - `git log -n 10` Muestr los ultimos 10 commits 
 - ¿Qué comando permite listar todas las ramas (branches) disponibles localmente en Git?
   -  `git branch`  
 - ¿Cuál de los siguientes comandos crea una nueva rama local llamada develop en Git?  
   - `git checkout -b develop` 
 - ¿Qué comando permite saltar el área de preparación en Git?  
   - `git add <file>`  `git rm -cached <file>` Adiciona los archivos nuevos o modificacos al area de preparación (Staging) , y git rm elimina el archivo
 - ¿Con qué comando se crea un tag en git con el número de versión y descripción?
   - `git tag -a v1.4 -m "my version 1.4" `
 - ¿Para qué sirve el comando “git status -s”?
   - Muestra los cambios ocurridos en el proyecto, pero en formato corto, por defecto git status esta en formato largo
 - ¿Qué hace el comando “git show”?
   - Muestra información detallada del repositorio, 
 - ¿Qué es un commit con la clasificación “fix”? 
   - Son los commit que estan destinados a corregir errores en la base de del codigo fuente 
 - ¿Qué hace el comando git stash?
   -  Almacena los cambios en un directorio de trabajo momentaneo. para luego ser retomados y regresarlos al directorio oficial de trabajo
 - ¿Qué comando de Docker sirve para conectar un contenedor a una red  
    - `docker run --network=<network-name>`
 - ¿Qué comando de Docker se usa para eliminar una o más imágenes? 
    - `docker rmi Image Image`
 - ¿Qué comando Dockerfile modifica las variables de entorno dentro de los contenedores 
creados a partir de las imágenes? 
 -  ¿Qué comando Dockerfile define qué puertos de contenedor exponer?   
 -  ¿Qué comando de Dockerfile especifica comandos para realizar cambios en su imagen y 
posteriormente en los contenedores que se muestran desde esta imagen?
 - ¿Qué lenguaje utiliza docker-compose para configurar los servicios de la aplicación
   - YAML

### Practica
- Se debe crear un proyecto en Drupal 8 el cual debe tener configurado los archivos 
necesarios para ser disponibilizado por medio de Docker. La configuración del 
ambiente debe incluir la DB, php, nginx/apache y todo lo requerido para el correcto 
funcionamiento.
  - **OK, En este repositorio se sencuentran todos los archivos necesaros y suficientes para instalar un ambiente drupal listo para validar los modulos solicitados**
- Se debe desarrollar un módulo personalizado, el módulo debe cumplir con los siguientes requisitos:
  - **OK, el modulo se encuentra en https://github.com/mackpipe/ilumno_programs**
- Se deben declarar tres rutas en el sistema /ilumno-module/form, /ilumno-module/data y /ilumno-module/register
  - **OK, declaradas en el archivo ilumno_programs.routing.yml**
- En la ruta /ilumno-module/form se debe mostrar un formulario que tenga los siguientes campos y características:
  - Nombre Programa: Campo de texto. Este campo es requerido y solo acepta caracteres alfanuméricos
  - Identificador: Campo de texto. Este campo es requerido y solo acepta caracteres alfanuméricos
  - Código: Campo de texto. Este campo es requerido y solo acepta números.
  - Fecha: Campo de fecha. Puede usar el formato que mejor considere, pero debe dar un texto de ayuda al usuario.
  - Tipo: Campo de selección, las opciones son Pregrado, Posgrado, Curso Corto.
    - **OK, se puede visualizar en la ruta http://localhost:81/app/web/ilumno-module/form** 
- Al momento de la instalación el módulo se deben crear dos tablas que se llamen “programs” y “user_register” para la tabla “programs" debe tener los campos que se mencionaron en el punto anterior más un campo llamado “State”. Para la tabla “user_register” es necesario tener los campos:
  - Nombre
  - Programa
  - Comentario
  - Fecha
    - **OK, se crean las dos tablas al momento de instalar los modulos** 
- Validar obligatoriedad, formatos de los campos utilizando las funciones apropiadas 
  - **OK, se valida cada campo por individual a traves de Ajax, y al final se validan al enviar el formulario completo** 
- Al realizar el envío del formulario, llenar los datos en la tabla mencionada en el paso anterior. Colocar el campo “State” en 1 si el tipo es “Pregrado” o 2 para el resto de los valores. Adicionalmente mostrar un mensaje en pantalla al finalizar el envío del formulario.
  - **OK, se almacena en la tabla indicada y se muestra el mensaje solicitado**
- Crear un segundo modulo que exponga un CRUD de servicios Resful que permita alterar la información de la tabla generada, el path debe ser /ilumno-module/data.
  - **OK, el modulo se encuentra en https://github.com/mackpipe/ilumno_programs_rest**
- En la ruta /ilumno-module/register, se debe disponibilizar un servicio que reciba los valores de la tabla “user_register” y los inserte en dicha tabla
  - **OK, se almacenan los datos en la tabla indicada**

 
