# Suministros de Vacunación en Pediatría

Este proyecto tiene como objetivo brindar una plataforma dedicada a la creación, gestión y resolución de cuestionarios relacionados con el suministro de vacunas en el ámbito de la pediatría. Los cuestionarios ofrecen una herramienta interactiva y educativa que facilita el aprendizaje sobre la inmunización infantil. Están diseñados con el propósito de evaluar y hacer seguimiento al proceso de aprendizaje.

## Características

-   Plataforma de cuestionarios de suministros de vacunación en pediatría.
-   Cuestionarios interactivos que fomentan el aprendizaje sobre la inmunización infantil.
-   Herramienta de evaluación para medir el conocimiento adquirido.
-   Facilita el seguimiento del progreso y aprendizaje individual.
-   Accesible desde dispositivos móviles y de escritorio.

## Instalación

1. Clona este repositorio en tu máquina local:

    ```bash
    git clone https://github.com/santiagoroncancio/sofmedip
    ```

2. Navega al directorio del proyecto:

    ```bash
    cd sofmedip
    ```

3. Instala las dependencias utilizando Composer:

    ```bash
    composer install
    ```

4. Copia el archivo de configuración y configura las variables de entorno:

    ```bash
    cp .env.example .env
    php artisan key:generate
    php artisan storage:link
    # Configura las variables de entorno en el archivo .env
    ```

5. Importando en la base de datos "sofmedip" para crear las tablas de la base de datos:

    ```bash
    php artisan migrate
    ```

6. Inicia el servidor de desarrollo:

    ```bash
    php artisan serve
    ```

7. Accede a la aplicación en tu navegador en la dirección http://127.0.0.1:8000

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](https://opensource.org/license/mit/) para más detalles.

## Contacto

Si tienes preguntas o sugerencias relacionadas con este proyecto, puedes ponerte en contacto con nosotros a través de [brayan.roncancio@unillanos.com](mailto:brayan.roncancio@unillanos.edu.co).
