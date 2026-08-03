---
type: concept
created: 2026-08-03
updated: 2026-08-03
tags: [redes, ip, tcp, udp, dns, puertos]
related: [protocolo-http, fundamentos-de-computacion, apis-rest]
---

# Redes y Protocolos (IP, TCP/UDP, DNS, Puertos)

## Definition
Conjunto de reglas y estándares que permiten que dispositivos independientes se localicen (**IP**, **DNS**) y se comuniquen de forma fiable o eficiente (**TCP**, **UDP**) a través de servicios específicos (**Puertos**), bajo el patrón fundacional del **modelo Cliente-Servidor**.

## Key Ideas
- **Modelo Cliente-Servidor:** el Cliente envía una Solicitud (Request); el Servidor procesa y envía una Respuesta (Response).
- **Dirección IP:** identificador numérico único de cada dispositivo en la red (ej. `192.0.2.1`).
- **DNS (Domain Name System):** traduce nombres de dominio legibles (`google.com`) a direcciones IP — el "directorio telefónico" de Internet.
- **IP vs. TCP:** IP mueve paquetes de un punto a otro sin garantizar la llegada; **TCP** se asienta sobre IP y añade fiabilidad (numera, verifica, reensambla, reenvía lo perdido).
- **UDP:** sacrifica la verificación de TCP por latencia mínima — preferible para streaming/videoconferencia, donde un salto de señal es mejor que un retraso acumulado.
- **Puertos:** identifican el servicio específico dentro de un dispositivo (HTTP: 80, HTTPS: 443); una solicitud se dirige a IP:Puerto (ej. `192.0.2.1:443`).

## Applications
- Elegir TCP para transferencia de datos financieros o ejecución remota de código (donde el error no es una opción) y UDP para videollamadas o streaming en vivo.
- Diagnosticar problemas de conectividad distinguiendo entre fallo de DNS (no resuelve el dominio), de IP (no hay ruta al host) o de puerto (host alcanzable pero servicio inaccesible).
- Configurar correctamente los puertos expuestos de un servidor para evitar exponer servicios internos por error.

## Examples
```text
Usuario escribe: https://miapp.com
  → DNS traduce miapp.com → 192.0.2.1
  → Conexión TCP a 192.0.2.1:443 (HTTPS)
  → Cliente envía Request, Servidor responde con Response
```

## Comparison
| Aspecto | TCP | UDP |
|---------|---------------|-------------|
| Fiabilidad | Garantiza entrega, orden y reintento | No garantiza nada, "fire and forget" |
| Velocidad/Latencia | Menor (overhead de verificación) | Mínima |
| Caso de uso típico | Transferencias de datos críticos, APIs, ejecución de código | Streaming, videoconferencia, juegos en tiempo real |

## Sources
- [[wiki/sources/2026-08-03-redes]] — modelo cliente-servidor, IP, DNS, TCP/UDP y puertos.
- [[wiki/sources/2026-08-03-conclusiones-fundamentos-sistemas-redes]] — la conectividad global como pilar de la experiencia de usuario moderna, síntesis final del Módulo 4.

## Related Concepts
[[protocolo-http]], [[fundamentos-de-computacion]], [[apis-rest]]

## Open Questions
- ¿Qué mecanismos de QUIC/HTTP-3 (sobre UDP) están desplazando a TCP como base del tráfico web moderno, y qué implica eso para la fiabilidad tradicionalmente asociada a TCP?

---

**Última actualización:** 2026-08-03
**Aparece en:** 2 fuentes
