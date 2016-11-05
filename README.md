# SyllabusWeb

## Deploy
Clonar el proyecto en tu workspace.

Desde STS, si no aparece en el workspace (a mi me paso asi :'v)
- Seleccionar Importar
- En General, Proyecto en el workspace(Existing projects into Workspace)
- Seleccionar la carpeta donde esta el proyecto.

Click derecho al Proyecto, *"Run as"* **Maven install**

Click derecho al Proyecto, *"Run as"* **Run on Server**

- Si ya tienen Tomcat 7 como un servidor creado seleccionenlo, sino escojan definir un nuevo servidor manualmente. **Apache Tomcat 7.0**, luego Download and Install.
- En JRE, asegurense de usar el jdk 1.7 de lo contrario, descarguenlo e instalenlo.
- Luego en Installed JREs, agregar el jdk 1.7 seleccionando la carpeta raiz del jdk 1.7 que esta dentro de la carpeta de Java.

Una vez corra en el servidor, detienen el servidor y vuelven a correr el servidor.

Les deberia mandar a su navegador, por default el de eclipse, en el index que sale Hello World. Intenta ingresar a la ruta de abajo

http://localhost:8080/SyllabusWeb/asignatura_aperturada/index

## DB

En com.junior.conexion.AccesoDB poner las credenciales de la base de datos (esto se cambiara)
