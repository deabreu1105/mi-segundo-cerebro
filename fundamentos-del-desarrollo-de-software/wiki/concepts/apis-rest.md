---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [apis, rest, json, autenticacion, cors]
related: [protocolo-http, redes-y-protocolos-tcp-ip, python-como-lenguaje]
---

# APIs y Arquitectura REST

## Definition
Una **API** (Application Programming Interface) es un contrato formal entre dos piezas de software que permite a una aplicación consumir la funcionalidad de otra sin conocer su implementación interna. **REST** (Representational State Transfer) es el estilo arquitectónico dominante para diseñar APIs sobre HTTP: modela el dominio como **recursos** direccionables por URL (**Endpoints**), manipulados con verbos CRUD, bajo el principio de que cada petición debe ser autosuficiente (**stateless**).

## Key Ideas
- **Analogía del restaurante:** la API es el camarero — intermediario entre el cliente (quien pide) y la cocina (el sistema complejo); presenta el menú (documentación), gestiona la solicitud y entrega el resultado.
- **REST no es un protocolo, es un estilo arquitectónico** — un conjunto de principios de diseño sobre HTTP, no una tecnología específica.
- **Recursos y Endpoints:** cualquier entidad de negocio (clientes, pedidos, productos) es un recurso identificado por una URL.
- **Verbos HTTP = operaciones CRUD:** `GET` (Read), `POST` (Create), `PUT`/`PATCH` (Update total/parcial), `DELETE` (Delete).
- **Statelessness como principio arquitectónico:** cada petición REST debe contener toda la información necesaria — el servidor no retiene contexto entre peticiones, maximizando la capacidad de escala horizontal.
- **JSON** es el formato de intercambio estándar: objetos (`{}`) y arrays (`[]`) anidables, agnósticos al lenguaje de programación de cada extremo.
- **AuthN vs. AuthZ:** Autenticación (¿quién eres?) y Autorización (¿qué puedes hacer?) son conceptos distintos, gestionados con API Keys o Tokens (Bearer/OAuth).
- **CORS** es una política del *navegador*, no un fallo de la API: bloquea por defecto peticiones entre dominios distintos salvo autorización explícita del servidor.

## Applications
- Diseñar endpoints REST coherentes (`/productos`, `/productos/5`) en vez de rutas ad-hoc que mezclan verbos en la URL (`/getProducto`).
- Consumir APIs de terceros (pasarelas de pago, modelos de IA) desde Python con `requests`, verificando siempre `status_code` antes de asumir éxito.
- Diagnosticar errores de integración distinguiendo AuthN (401 Unauthorized) de AuthZ (403 Forbidden) y de problemas de CORS (bloqueo del navegador, no del servidor).

## Examples
```python
import requests

response = requests.get("https://api.ejemplo.com/productos/5")
if response.status_code == 200:
    producto = response.json()  # JSON -> dict de Python
    print(producto["nombre"])
```

## Comparison
| Verbo HTTP | Operación CRUD | Código de éxito típico |
|---------|---------------|-------------|
| `GET` | Read | 200 OK |
| `POST` | Create | 201 Created |
| `PUT` / `PATCH` | Update (total/parcial) | 200 OK |
| `DELETE` | Delete | 200 OK / 204 No Content |

## Sources
- [[wiki/sources/2026-08-03-apis-comunicacion]] — API como contrato, principios REST, JSON, AuthN/AuthZ, CORS, ejemplos con `requests`.
- [[wiki/sources/2026-08-03-conclusiones-fundamentos-sistemas-redes]] — las APIs como "camareros del entorno digital" que habilitan microservicios, síntesis final del Módulo 4.

## Related Concepts
[[protocolo-http]], [[redes-y-protocolos-tcp-ip]], [[python-como-lenguaje]], [[modelado-de-datos-y-bases-de-datos]]

## Open Questions
- ¿Qué convenciones adicionales (HATEOAS, versionado, paginación) distinguen una API "verdaderamente RESTful" madura de una que solo usa verbos HTTP sobre JSON sin más disciplina?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
