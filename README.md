# 🥋 QA Challenge Karate - Pruebas Automatizadas de API

Este proyecto contiene pruebas automatizadas desarrolladas con el **framework Karate**, para validar los endpoints públicos del servicio [Swagger Petstore](https://petstore.swagger.io).

---

## 1️⃣ Prerrequisitos

Para ejecutar este proyecto se necesita lo siguiente:

- 💻 **Sistema operativo:** macOS / Windows 10 / Linux  
- 🧩 **IDE recomendado:** IntelliJ IDEA Community Edition (versión 2023.1 o superior)  
- ☕ **JDK:** versión 17 (configurada en la variable de entorno `JAVA_HOME`)  
- 🧱 **Maven:** versión 3.8.6 o superior (configurada en la variable de entorno `MAVEN_HOME`)  
- 🧪 **Karate Framework:** versión 1.5.0 (descargada automáticamente desde Maven)  

3️⃣ Instrucciones para ejecutar los test

Abrir el proyecto en IntelliJ IDEA.

Tener configurado el SDK de Java 17.

Ejecutar las pruebas desde cualquiera de las siguientes opciones:

▶️ Opción A — Desde el IDE

Abrir el archivo SimpleRunner.java

Clic derecho → Run 'SimpleRunner'

▶️ Opción B — Desde la terminal

Ejecutar:

mvn test


Esto ejecutará todos los archivos .feature ubicados en:

src/test/java/apiTest/pets/

📊 Reporte de ejecución

Una vez finalizada la ejecución, Karate genera automáticamente un reporte HTML.
El reporte está disponible en:

👉 [Ver reporte de ejecución](reports/apiTest.pets.pets.html)



