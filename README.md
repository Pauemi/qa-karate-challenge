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

## 2️⃣ Instrucciones para ejecutar los test

Abrir el proyecto en IntelliJ IDEA.

Tener configurado el SDK de Java 17.

Ejecutar las pruebas desde cualquiera de las siguientes opciones:

### ▶️ Opción A — Desde el IDE

🧩 Ejecución de Features con Runner y Etiquetas

Para facilitar la ejecución de las pruebas, se configuró un runner personalizado que permite ejecutar los escenarios de forma flexible:

**Ejecución completa:**
Desde la clase PetsTest se pueden ejecutar todos los escenarios de prueba de manera global, abarcando los flujos create, update, get y findByStatus.

**Ejecución independiente:**
Si se requiere ejecutar únicamente un conjunto de pruebas o un escenario específico, se pueden usar las etiquetas definidas dentro de cada feature (por ejemplo, @create, @update, @complete, etc.).

Ejemplo de ejecución filtrada en el runner:

@Karate.Test
Karate testSelected() {
    return Karate.run().tags("@complete").relativeTo(getClass());
}

👉 Solo es necesario reemplazar el nombre de la etiqueta (@complete, @create, @update, etc.) según el escenario que se desee ejecutar.
### ▶️ Opción B — Desde la terminal

Ejecutar:

mvn test


Esto ejecutará todos los archivos .feature ubicados en:

src/test/java/apiTest/pets/

## 📊 Reporte de ejecución

Una vez finalizada la ejecución, Karate genera automáticamente un reporte HTML.
El reporte está disponible en:

👉 [Ver reporte de ejecución](reports/apiTest.pets.pets.html)



