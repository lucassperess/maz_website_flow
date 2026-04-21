# MVP Plan - AI Website Flow (maz)

## 1) Escopo do MVP

Entregar um fluxo operacional de ponta a ponta para:
1. Ingerir dados iniciais do cliente (formulario + assets).
2. Criar repositório padrao do cliente no GitHub da `maz`.
3. Gerar e manter o site com IA.
4. Publicar no Vercel.
5. Registrar historico em linguagem humana.
6. Rodar code review semanal automatizado.

Fora do MVP (fase posterior):
1. Multi-tenant dashboard.
2. Billing automatizado.
3. Aprovação visual com staging por branch para nao-tecnicos.

## 2) Arquitetura de alto nivel

Componentes:
1. `Skill A - intake-to-repo`
2. `Skill B - build-and-deploy`
3. `Template de repositorio de cliente`
4. `Scheduler semanal de review`

Stack inicial sugerida:
1. Claude Code Max (Opus como default para tarefas de engenharia).
2. GitHub API (criacao de repo, commits, PRs e labels).
3. Vercel API (projeto, envs, deploy e aliases de dominio).
4. GitHub Actions (agendamento semanal e automacoes de QA).

## 3) Contrato de entrada (pasta 1 - onboarding)

Padrao de pasta de entrada por cliente:

```txt
incoming/<cliente-id>/
  client-form.json
  brand/
    logo-primary.png
    logo-secondary.svg
    colors.json
    fonts/
  content/
    sitemap.md
    pages/
      home.md
      about.md
  assets/
    images/
    videos/
  legal/
    terms.pdf
    privacy.pdf
```

Regras minimas:
1. `client-form.json` obrigatorio com campos de negocio e contato.
2. `brand/` e `content/` obrigatorios (pode estar incompleto, mas pasta deve existir).
3. Arquivos ausentes devem gerar aviso em `logs/intake-report.md`.

## 4) Estrutura padrao do repo do cliente (pasta 2 - GitHub)

Template de repositorio:

```txt
<cliente-repo>/
  site/
    app/              # Next.js ou stack escolhida
    public/
    package.json
  client-data/
    client-form.json
    brand/
    content/
    assets/
    legal/
  logs/
    CHANGELOG_AI.md
    entries/
      2026-04-21-initial-intake.md
  .github/
    workflows/
      weekly-review.yml
      ci.yml
  docs/
    runbook.md
```

Padroes de log:
1. Toda alteracao feita pela IA gera arquivo em `logs/entries/`.
2. `CHANGELOG_AI.md` recebe resumo cumulativo.
3. Formato do log: contexto, mudanca, motivo, risco, rollback.

## 5) Skill A - intake-to-repo

Responsabilidades:
1. Ler pasta `incoming/<cliente-id>`.
2. Validar estrutura minima.
3. Criar repo no GitHub da `maz` com nome padrao (`client-<slug>`).
4. Aplicar template de pastas.
5. Copiar dados do cliente para `client-data/`.
6. Criar commit inicial + push.
7. Registrar `logs/entries/<data>-initial-intake.md`.

Saidas esperadas:
1. URL do repositorio criado.
2. Relatorio de validacao de intake.
3. Lista de pendencias de dados.

## 6) Skill B - build-and-deploy

Responsabilidades:
1. Ler `client-data/`.
2. Gerar/atualizar `site/` de forma incremental.
3. Executar build e checks basicos.
4. Criar deploy na Vercel via API.
5. Atualizar dominio/alias quando aplicavel.
6. Registrar alteracoes em `logs/`.

Politica de modelos (Claude):
1. Opus para arquitetura, codigo, refatoracoes e depuracao.
2. Modelo mais barato para ajustes finos de texto/copy quando aprovado.

## 7) Review semanal automatizado

Objetivo: detectar bugs, vulnerabilidades e regressoes.

Execucao:
1. Workflow `weekly-review.yml` com cron semanal.
2. Rodar lint, testes, auditoria basica de seguranca e analise automatizada.
3. Abrir issue (ou PR) com findings e prioridade.
4. Registrar resumo em `logs/entries/<data>-weekly-review.md`.

## 8) Seguranca e operacao

Segredos necessarios (GitHub/Vercel):
1. `GITHUB_TOKEN` com escopo minimo para repositorios alvo.
2. `VERCEL_TOKEN`.
3. `VERCEL_TEAM_ID` e `VERCEL_PROJECT_ID` (ou criacao dinamica por cliente).

Regras:
1. Nunca versionar tokens.
2. Aplicar principle of least privilege.
3. Isolar ambientes (`preview` e `production`).

## 9) Roadmap de implementacao

Fase 1 (fundacao):
1. Criar template de repo cliente.
2. Definir schema do `client-form.json`.
3. Implementar logging padrao.

Fase 2 (Skill A):
1. Parser da pasta de intake.
2. Validacao + relatorio.
3. Criacao automatica de repo + commit inicial.

Fase 3 (Skill B):
1. Geracao de site base.
2. Integracao API Vercel.
3. Deploy e registro de alteracoes.

Fase 4 (review semanal):
1. Workflow agendado.
2. Regras de severidade.
3. Abertura automatica de issue/PR.

## 10) Definition of Done (MVP)

Considerar MVP pronto quando:
1. Um cliente novo entra via pasta padrao e gera repo automaticamente.
2. O site sobe na Vercel com URL funcional.
3. Toda alteracao cria log humano versionado.
4. Review semanal roda sem intervencao manual.
5. Time consegue repetir o processo para pelo menos 3 clientes.
