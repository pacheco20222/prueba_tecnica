# Sistema de Gestion de Solicitudes

## Backend - Opcion Docker

Esta es la forma recomendada de ejecutar el proyecto para evitar instalar dependencias locales.

### Pasos

1. Abrir una terminal y navegar a la carpeta del backend:
   ```bash
   cd backend
   ```

2. Copiar el archivo de entorno (si no existe):
   ```bash
   cp .env.example .env
   ```

3. Levantar los contenedores:
   ```bash
   docker compose up -d
   ```

4. Instalar dependencias de PHP (solo la primera vez):
   ```bash
   docker compose exec laravel.test composer install
   ```

5. Generar la llave de la aplicacion:
   ```bash
   docker compose exec laravel.test php artisan key:generate
   ```

6. Solucionar errores de permisos (Importante si fallan los logs):
   ```bash
   docker compose exec laravel.test chmod -R 777 storage bootstrap/cache
   ```

7. Ejecutar migraciones de base de datos:
   ```bash
   docker compose exec laravel.test php artisan migrate
   ```

8. Crear usuario de prueba (opcional, si no existe):
   Ejecutar el entorno interactivo:
   ```bash
   docker compose exec laravel.test php artisan tinker
   ```
   Dentro de tinker, ejecutar el siguiente comando:
   ```php
   User::create(['name' => 'Demo User', 'email' => 'usuario@demo.com', 'password' => bcrypt('123456')]);
   ```
   Escribir `exit` para salir.

## Backend - Opcion Sin Docker

Utilizar esta opcion si ya tiene PHP y Composer instalados localmente.

### Requisitos
- PHP 8.2 o superior
- Composer
- PostgreSQL (o usar la base de datos remota configurada en .env)

### Pasos

1. Navegar a la carpeta backend:
   ```bash
   cd backend
   ```

2. Instalar dependencias:
   ```bash
   composer install
   ```

3. Configurar entorno:
   Copiar `.env.example` a `.env` y configurar las credenciales de base de datos si es necesario.

4. Generar llave:
   ```bash
   php artisan key:generate
   ```

5. Migrar base de datos:
   ```bash
   php artisan migrate
   ```

6. Iniciar el servidor local:
   ```bash
   php artisan serve
   ```
   El API estara disponible en `http://localhost:8000`.

## Frontend (Flutter)

### Pasos

1. Abrir la carpeta `frontend` en Visual Studio Code.
2. Asegurarse de tener un emulador Android/iOS abierto.
3. Presionar **F5** para iniciar la depuracion.

Nota: La aplicacion esta configurada para conectarse a `http://10.0.2.2` (Android Emulator) o localhost.

Recursos:
https://www.youtube.com/watch?v=kGI7Kj3n9o4
https://www.youtube.com/watch?v=zon3WgmcqQw
https://code.tutsplus.com/how-to-create-lists-in-your-app-with-flutter--cms-36937t
https://docs.flutter.dev
https://medium.com/@rohan.surve5/building-a-simple-login-screen-in-flutter-my-comeback-to-ui-development-60ebf1cd4bdc
https://sakibmahmood.medium.com/developing-a-professional-flutter-task-management-application-a-comprehensive-guide-96006be0b4eb
