---
type: concept
created: 2026-07-21
tags: [ai, llm, architecture, retrieval]
---

# RAG (Retrieval Augmented Generation)

## Definition
**Retrieval Augmented Generation** es un patrón arquitectónico donde un LLM:
1. Recibe una query del usuario
2. Busca y recupera chunks relevantes de documentos
3. Genera respuesta basada en los chunks recuperados
4. No persiste síntesis ni conocimiento entre queries

## How It Works

```
User Query → Search/Retrieval → Relevant Chunks → LLM → Answer
                                                          ↓
                                                     (forgotten)
```

Cada query es independiente. El LLM "re-descubre" conocimiento cada vez.

## Common Implementations

- **NotebookLM** (Google)
- **ChatGPT file uploads**
- **Claude Projects** (con archivos)
- Mayoría de "chat with your documents" apps

## Strengths

✅ Simple de implementar  
✅ No requiere preprocessing elaborado  
✅ Funciona out-of-the-box  
✅ Bueno para queries simples sobre documentos específicos  

## Limitations

❌ **No accumulation:** Redescubre conocimiento en cada query  
❌ **Synthesis lost:** Insights no persisten  
❌ **Contradictions hidden:** No hay tracking entre fuentes  
❌ **Cross-refs ad-hoc:** Conexiones se pierden después del query  
❌ **No compounding:** Valor no crece con el tiempo  
❌ **Complex queries expensive:** Sintetizar 5+ docs requiere re-procesarlos cada vez  

## Contrast: RAG vs LLM Wiki

Ver comparación completa en [[llm-wiki-pattern|LLM Wiki Pattern]].

**Analogía:**
- **RAG** = Buscar en Google cada vez que necesitas información
- **LLM Wiki** = Tener una biblioteca personal que mejora continuamente

## When to Use RAG

RAG es apropiado cuando:
- Queries simples sobre docs específicos
- No necesitas acumulación de conocimiento
- One-off analysis, no uso repetido
- Documentos no están relacionados entre sí

## When to Use LLM Wiki Instead

LLM Wiki es superior cuando:
- ✅ Múltiples fuentes sobre mismo tema
- ✅ Uso prolongado (semanas/meses)
- ✅ Necesitas síntesis cross-document
- ✅ Contradicciones son importantes
- ✅ Conocimiento debe crecer con el tiempo

## Related Concepts

- [[llm-wiki-pattern|LLM Wiki Pattern]] - Alternativa superior para knowledge acumulativo
- [[vector-search|Vector Search]] - Técnica común en RAG
- [[semantic-search|Semantic Search]] - Base de retrieval en RAG

## Sources

- [[2026-07-21-llm-wiki-pattern-karpathy|LLM Wiki Pattern - Karpathy]] - Crítica y contraste con RAG

---

**Última actualización:** 2026-07-21  
**Aparece en:** 1 fuente
