---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [http, cookies, sesiones, jwt, stateless]
related: [redes-y-protocolos-tcp-ip, apis-rest]
---

# Protocolo HTTP

## Definition
**HTTP** (HyperText Transfer Protocol) es el protocolo de comunicación que define el "idioma" entre cliente y servidor sobre una conexión TCP: un ciclo de Solicitud (Request) y Respuesta (Response) compuesto por método, cabeceras y cuerpo, con **HTTPS** como su variante cifrada. Es **stateless** por diseño — no recuerda interacciones pasadas — lo que exige mecanismos adicionales (Cookies, Sesiones, JWT) para mantener contexto entre peticiones.

## Key Ideas
- **Métodos HTTP mapean a CRUD:** `GET` (Leer), `POST` (Crear), `PUT`/`PATCH` (Actualizar — reemplazo total vs. parcial), `DELETE` (Eliminar).
- **Anatomía de una petición:** línea de inicio (método + URL), cabeceras (metadatos, autorización), cuerpo (payload opcional).
- **Anatomía de una respuesta:** línea de estado (código), cabeceras, cuerpo (datos solicitados).
- **Códigos de estado agrupados:** 2xx (éxito: 200 OK, 201 Created), 3xx (redirección), 4xx (error del cliente: 404 Not Found, 401 Unauthorized), 5xx (error del servidor: 500 Internal Server Error).
- **Stateless ("amnésico"):** cada petición es independiente por defecto — no hay memoria de peticiones anteriores.
- **Cookies:** fragmento de datos que el servidor pide almacenar al navegador (`Set-Cookie`), reenviado automáticamente en peticiones subsecuentes — inseguro para datos sensibles.
- **Sesiones:** el servidor crea una sesión con un ID único tras el login, envía ese ID en una cookie, y usa el ID (no los datos) para recuperar el estado real de forma segura.
- **JWT (JSON Web Token):** token firmado criptográficamente y autónomo (self-contained) que permite verificar identidad sin consultar una base de datos centralizada — clave para escalar microservicios con millones de usuarios simultáneos.

## Applications
- Diseñar APIs coherentes usando los métodos HTTP según su semántica CRUD, en vez de sobrecargar `POST` para todo.
- Elegir el mecanismo de estado correcto: cookies+sesiones para aplicaciones monolíticas tradicionales; JWT para arquitecturas distribuidas/microservicios.
- Interpretar códigos de estado para depurar integraciones (distinguir un 401 de un 404, o un fallo de cliente de uno de servidor).

## Examples
```text
POST /api/libros HTTP/1.1
Host: biblioteca.com
Content-Type: application/json

{"titulo": "El Quijote"}
```
```text
HTTP/1.1 201 Created
Content-Type: application/json

{"id": 1, "mensaje": "Libro creado exitosamente"}
```

## Comparison
| Mecanismo de Estado | Dónde vive el dato | Escalabilidad | Caso de uso |
|---------|---------------|-------------|-------------|
| **Cookie simple** | Navegador del cliente | Baja (datos sensibles expuestos) | Preferencias no sensibles (idioma, tema) |
| **Sesión** | Servidor (memoria/BD) + ID en cookie | Media (requiere almacenamiento centralizado) | Aplicaciones monolíticas tradicionales |
| **JWT** | Autónomo, viaja en cada petición | Alta (sin consulta centralizada) | Microservicios, APIs distribuidas |

## Sources
- [[wiki/sources/2026-08-03-redes]] — métodos HTTP, anatomía de petición/respuesta, códigos de estado, cookies, sesiones y JWT.
- [[wiki/sources/2026-08-03-apis-comunicacion]] — REST como disciplina de diseño construida sobre estos mismos métodos y códigos de estado.
- [[wiki/sources/2026-08-03-conclusiones-fundamentos-sistemas-redes]] — HTTP/HTTPS como reglas de etiqueta digital, síntesis final del Módulo 4.

## Related Concepts
[[redes-y-protocolos-tcp-ip]], [[apis-rest]]

## Open Questions
- ¿Cómo se gestiona la revocación de un JWT antes de su expiración natural, dado que es autónomo y no se consulta centralmente?

---

**Última actualización:** 2026-08-03
**Aparece en:** 3 fuentes
