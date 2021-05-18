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
 
