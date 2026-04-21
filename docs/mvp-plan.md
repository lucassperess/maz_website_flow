# MVP Plan - AI Website Flow (maz)

## 1) Escopo do MVP

Entregar um fluxo operacional de ponta a ponta para:
1. Ingerir dados iniciais do cliente (formulario + assets).
2. Criar repositorio padrao do cliente no GitHub da Maz.
3. Gerar e manter o site com IA.
4. Publicar no Vercel.
5. Registrar historico em linguagem humana.
6. Rodar code review semanal automatizado.

Fora do MVP inicial:
1. Multi-tenant dashboard.
2. Billing automatizado.
3. Aprovacao visual avancada para nao-tecnicos.

## 2) Decisoes fechadas

1. A Maz tera posteriormente uma organizacao propria no GitHub.
2. Os repositorios dos clientes serao sempre privados.
3. A Vercel usara inicialmente uma conta central da empresa para varios clientes.
4. Lucas aprova deploy em producao.
5. O primeiro template de site nao sera unico. A IA deve escolher entre institucional simples, landing page, catalogo ou outro formato adequado ao caso.

## 3) Arquitetura de alto nivel

Componentes:
1. `Skill A - intake-to-repo`
2. `Skill B - build-and-deploy`
3. `Template de repositorio de cliente`
4. `Scheduler semanal de review`

Stack inicial sugerida:
1. Claude Code Max, usando Opus como default para tarefas de engenharia.
2. GitHub API ou GitHub CLI para criacao de repo, commits, PRs e labels.
3. Vercel API ou Vercel CLI para projeto, envs, deploy e aliases de dominio.
4. GitHub Actions para CI e review semanal.

## 4) Contrato de entrada (pasta 1 - onboarding)

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
2. `brand/` e `content/` obrigatorios. Podem estar incompletos, mas devem existir.
3. Arquivos ausentes devem gerar aviso em `logs/intake-report.md`.
4. Dados sensiveis nao devem ser versionados.

## 5) Estrutura padrao do repo do cliente

Template de repositorio:

```txt
<cliente-repo>/
  site/
    app/
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
3. Formato do log: contexto, mudanca, motivo, checks, risco e rollback.

## 6) Skill A - intake-to-repo

Responsabilidades:
1. Ler pasta `incoming/<cliente-id>`.
2. Validar estrutura minima.
3. Criar repo privado no GitHub da Maz com nome padrao `client-<slug>`.
4. Aplicar template de pastas.
5. Copiar dados do cliente para `client-data/`.
6. Criar commit inicial + push.
7. Registrar `logs/entries/<data>-initial-intake.md`.

Saidas esperadas:
1. URL do repositorio criado.
2. Relatorio de validacao de intake.
3. Lista de pendencias de dados.

## 7) Skill B - build-and-deploy

Responsabilidades:
1. Ler `client-data/`.
2. Escolher o tipo de site adequado ao cliente: institucional simples, landing page, catalogo ou outro formato justificado.
3. Gerar ou atualizar `site/` de forma incremental.
4. Executar build e checks basicos.
5. Criar deploy de preview na Vercel.
6. Solicitar aprovacao do Lucas antes de deploy em producao.
7. Registrar alteracoes em `logs/`.

Politica de modelos:
1. Opus para arquitetura, codigo, refatoracoes e depuracao.
2. Modelo mais barato apenas para ajustes finos de texto/copy quando aprovado.

## 8) Review semanal automatizado

Objetivo: detectar bugs, vulnerabilidades e regressoes.

Execucao:
1. Workflow `weekly-review.yml` com cron semanal.
2. Rodar lint, testes, auditoria basica de seguranca e analise automatizada.
3. Abrir issue ou PR com findings e prioridade.
4. Registrar resumo em `logs/entries/<data>-weekly-review.md`.

## 9) Seguranca e operacao

Segredos necessarios:
1. `GITHUB_TOKEN` com escopo minimo para repositorios privados da Maz.
2. `VERCEL_TOKEN` da conta central da empresa.
3. `VERCEL_TEAM_ID` quando a conta central estiver em um time.
4. `VERCEL_PROJECT_ID` quando o projeto ja existir, ou criacao dinamica por cliente.

Regras:
1. Nunca versionar tokens.
2. Aplicar menor privilegio possivel.
3. Isolar ambientes `preview` e `production`.
4. Publicar em producao apenas com aprovacao do Lucas.

## 10) Roadmap de implementacao

Fase 1 (fundacao):
1. Criar template de repo cliente.
2. Definir schema do `client-form.json`.
3. Implementar logging padrao.

Fase 2 (Skill A):
1. Parser da pasta de intake.
2. Validacao + relatorio.
3. Criacao automatica de repo privado + commit inicial.

Fase 3 (Skill B):
1. Selecao de tipo de site.
2. Geracao de site base.
3. Integracao API/CLI Vercel.
4. Deploy preview e registro de alteracoes.
5. Deploy producao apenas apos aprovacao.

Fase 4 (review semanal):
1. Workflow agendado.
2. Regras de severidade.
3. Abertura automatica de issue/PR.

## 11) Definition of Done (MVP)

Considerar MVP pronto quando:
1. Um cliente novo entra via pasta padrao e gera repo privado automaticamente.
2. O site sobe na Vercel com URL de preview funcional.
3. Deploy em producao exige aprovacao do Lucas.
4. Toda alteracao cria log humano versionado.
5. Review semanal roda sem intervencao manual.
6. Time consegue repetir o processo para pelo menos 3 clientes.
