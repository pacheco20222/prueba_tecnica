PRUEBA TÉCNICA FLUTTER
Sistema de Gestión de Solicitudes 

1. Objetivo
Desarrollar una aplicación móvil en Flutter (Android / iOS) que consuma una API REST para gestionar solicitudes ciudadanas (o pedidos, elegir cualquier tema). El proyecto debe demostrar experiencia real en:


Flutter 


Consumo de APIs 


Formularios 


Arquitectura 


Publicación de apps 

2. Contexto de Negocio
El sistema permitirá a los usuarios realizar las siguientes acciones:

Iniciar sesión 

Ver solicitudes registradas 

Crear nuevas solicitudes 

Consultar detalles 

Cambiar estatus 

3. Aplicación Flutter
A.
Login 

UI: Campos para Email, Password y botón "Iniciar sesión".


Validaciones: Email válido y Password de mínimo 6 caracteres.


Endpoint: POST /api/login.


Consideraciones: Guardar el token en shared preferences para evitar loguearse nuevamente.

Request Ejemplo:

{
  "email": "usuario@demo.com",
  "password": "123456"
}
``` [cite: 35, 37, 38]

**Response (200):**
```json
{
  "token": "Bearer eyJhbGci0i...",
  "user": {
    "id": 1,
    "name": "Mario Ciau",
    "email": "usuario@demo.com"
  }
}
``` [cite: 39, 41, 42, 43, 44, 45]

#### **B. Dashboard - Listado de Solicitudes** [cite: 49]
* **UI:** Lista tipo Card que muestre Título, Fecha y Estatus[cite: 50, 51, 53, 54, 55].
* **Endpoint:** `GET /api/requests` (Requiere Authorization: Bearer token)[cite: 56, 57, 58].
* **Consideraciones:** Mostrar un Loader durante la carga y manejar errores (401, 500)[cite: 75, 76].

#### **C. Detalle de Solicitud** [cite: 77]
* **UI:** Información completa y botón para cambiar estatus[cite: 78, 79, 80].
* **Endpoint:** `GET /api/requests/{id}`[cite: 81, 82].

#### **D. Crear Nueva Solicitud** [cite: 92]
* **UI:** Formulario con Título y Descripción[cite: 93, 94, 95, 96].
* **Endpoint:** `POST /api/requests`[cite: 97, 98].
* **Consideraciones:** Validar campos y, al terminar, regresar al dashboard para refrescar la lista[cite: 110, 111].

#### **E. Cambiar Estatus** [cite: 112]
* **UI:** Botón "Marcar como Atendido"[cite: 113, 114].
* **Endpoint:** `PUT /api/requests/{id}/status`[cite: 115, 116].
* **Request:** `{"status": "Atendido"}`[cite: 118, 119].

---

### 4. Backend (API REST)
Puede elegir el Framework de su preferencia (Laravel, Yii, Codeigniter)[cite: 125].

* **Modelos:**
    * **User** [cite: 127]
    * **Request (Solicitud):** Campos `id`, `title`, `description`, `status`, `created_at`, `updated_at`[cite: 128, 130, 131, 132, 133, 134, 135].
* **Autenticación:** Por token[cite: 149].
* **Formato:** JSON[cite: 147].

---

### 5. Requerimientos Técnicos Flutter
* **Compatibilidad:** Flutter estable con soporte de 16 KB[cite: 152].
* **Networking:** Uso de `http` o `dio`[cite: 153].
* **Modelos:** Deben incluir métodos `fromJson` / `toJson`[cite: 154].
* **Arquitectura por Capas:** [cite: 155]
    * `lib/models/` [cite: 159]
    * `lib/services/` [cite: 160]
    * `lib/views/` [cite: 161]
    * `lib/widgets/` [cite: 162]
    * `lib/utils/` [cite: 163]
* **Manejo de Estado:** `setState`, `GetX` o `Provider`[cite: 164, 165].
* **UI/UX:** Material Design, Responsive, buen uso de padding y feedback visual (SnackBar/Alert)[cite: 166, 167, 168, 169].

---

### 6. Puntos Extra (Opcional)
* Pull to refresh [cite: 171]
* Logout [cite: 172]
* Manejo de sesión expirada [cite: 173]
* Loader global y control de errores HTTP [cite: 174, 175]
* Modo oscuro [cite: 176]

---

### 7. Entregables
1.  Repositorio Git[cite: 178].
2.  Archivo **README** con:
    * Pasos para correr el proyecto[cite: 180].
    * Explicación de la arquitectura y decisiones técnicas[cite: 181, 182].
    * Credenciales para verificar la aplicación[cite: 183].

---
Would you like me to help you draft the **README.md** file for this project, including a suggested architecture explanation?