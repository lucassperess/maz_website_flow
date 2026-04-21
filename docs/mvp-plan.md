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

## 3) Visao operacional do fluxo

O MVP deve ser pensado como uma linha de producao assistida por IA, nao como uma stack fechada.

Etapas do fluxo:
1. Captacao: cliente envia formulario, contexto do negocio e assets.
2. Triagem: Maz verifica se existe informacao suficiente para iniciar.
3. Organizacao: IA cria o repositorio privado do cliente e separa dados, site e logs.
4. Producao: IA escolhe o tipo de site e cria a primeira versao.
5. Preview: Maz revisa o link antes de envolver producao.
6. Ajustes: IA aplica correcoes de conteudo, design ou estrutura.
7. Aprovacao: Lucas aprova ou bloqueia publicacao em producao.
8. Publicacao: site vai ao ar.
9. Manutencao: logs, revisoes semanais e alteracoes futuras mantem memoria do projeto.

Ferramentas como Claude Code, GitHub, Vercel e GitHub Actions entram como meios para executar essas etapas. A documentacao do MVP deve priorizar o comportamento esperado do processo.

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

## 5) Casos cobertos pelo fluxo

### Caso A - Cliente chega com material completo

Entrada:
1. Formulario preenchido.
2. Logo, cores, imagens e textos principais.
3. Objetivo do site claro.

Fluxo:
1. Skill A valida a pasta e cria o repositorio privado.
2. Skill B escolhe o tipo de site.
3. IA cria preview.
4. Lucas revisa e aprova producao.

Resultado esperado:
1. Site publicado.
2. Logs completos.
3. Pendencias zeradas ou nao bloqueantes.

### Caso B - Cliente chega com informacoes incompletas

Entrada:
1. Faltam textos, imagens, logo ou clareza sobre oferta.

Fluxo:
1. Skill A cria relatorio de pendencias.
2. Repositorio pode ser criado, mas o projeto fica marcado como incompleto.
3. Skill B pode gerar uma versao provisoria apenas se os riscos estiverem claros.

Resultado esperado:
1. Lista objetiva do que precisa ser pedido ao cliente.
2. Nenhum dado inventado tratado como verdade.
3. Preview so avanca se a Maz aceitar as limitacoes.

### Caso C - Cliente nao tem identidade visual

Entrada:
1. Cliente tem informacoes de negocio, mas nao tem logo, cores ou imagens boas.

Fluxo:
1. Skill A registra ausencia de identidade visual.
2. Skill B cria direcao visual provisoria e marca como proposta.
3. Preview deve deixar claro o que e decisao da IA e o que veio do cliente.

Resultado esperado:
1. Site pode avancar como proposta inicial.
2. Lucas ou cliente aprova/substitui a direcao visual antes da producao final.

### Caso D - Cliente quer landing page de campanha

Entrada:
1. Uma oferta clara, publico-alvo e chamada para acao.

Fluxo:
1. Skill B seleciona `landing-page`.
2. IA prioriza conversao, dobra inicial, prova, beneficios e contato.
3. Preview e revisado para evitar promessas nao validadas.

Resultado esperado:
1. Landing page publicada apos aprovacao.
2. Log registra oferta, CTA e riscos de copy.

### Caso E - Cliente precisa de catalogo

Entrada:
1. Multiplos produtos, servicos, unidades ou categorias.

Fluxo:
1. Skill B seleciona `catalog`.
2. IA estrutura listagem, detalhe e navegacao.
3. Dados incompletos de produtos ficam como pendencia.

Resultado esperado:
1. Catalogo funcional em preview.
2. Itens incompletos nao sao inventados.

### Caso F - Ajuste apos preview

Entrada:
1. Lucas ou cliente pede mudancas antes da producao.

Fluxo:
1. IA aplica alteracao no site.
2. Cria novo log explicando mudanca e motivo.
3. Gera novo preview.

Resultado esperado:
1. Historico claro de iteracoes.
2. Producao continua bloqueada ate aprovacao.

### Caso G - Alteracao depois do site no ar

Entrada:
1. Cliente pede troca de texto, imagem, secao, telefone, link ou oferta.

Fluxo:
1. IA altera em branch/preview.
2. Logs registram pedido, arquivo alterado, risco e rollback.
3. Lucas aprova producao.

Resultado esperado:
1. Site atualizado sem perder historico.
2. Alteracao pode ser revertida com contexto.

### Caso H - Review semanal encontra problema

Entrada:
1. Revisao automatica identifica bug, dependencia quebrada, texto suspeito ou risco visual.

Fluxo:
1. Sistema abre issue ou registro de review.
2. IA propoe correcao.
3. Correcao segue preview antes de producao.

Resultado esperado:
1. Problemas recorrentes ficam documentados.
2. Projeto nao depende apenas de memoria humana.

## 6) Estrutura padrao do repo do cliente

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

## 7) Skill A - intake-to-repo

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

## 8) Skill B - build-and-deploy

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

## 9) Review semanal automatizado

Objetivo: detectar bugs, vulnerabilidades e regressoes.

Execucao:
1. Workflow `weekly-review.yml` com cron semanal.
2. Rodar lint, testes, auditoria basica de seguranca e analise automatizada.
3. Abrir issue ou PR com findings e prioridade.
4. Registrar resumo em `logs/entries/<data>-weekly-review.md`.

## 10) Seguranca e operacao

Segredos necessarios devem ser definidos apenas quando o fluxo for conectado a contas reais. No nivel de processo, o importante e:
1. Somente pessoas autorizadas podem criar repositorios de cliente.
2. Somente pessoas autorizadas podem publicar em producao.
3. Tokens e credenciais nunca entram em pastas de cliente nem em logs.
4. Cada cliente deve ter separacao clara entre preview e producao.

Regras:
1. Nunca versionar tokens.
2. Aplicar menor privilegio possivel.
3. Isolar ambientes `preview` e `production`.
4. Publicar em producao apenas com aprovacao do Lucas.

## 11) Roadmap de implementacao

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
3. Criacao de preview.
4. Registro de alteracoes.
5. Publicacao em producao apenas apos aprovacao.

Fase 4 (review semanal):
1. Workflow agendado.
2. Regras de severidade.
3. Abertura automatica de issue/PR.

## 12) Definition of Done (MVP)

Considerar MVP pronto quando:
1. Um cliente novo entra via pasta padrao e gera repo privado automaticamente.
2. O site sobe na Vercel com URL de preview funcional.
3. Deploy em producao exige aprovacao do Lucas.
4. Toda alteracao cria log humano versionado.
5. Review semanal roda sem intervencao manual.
6. Time consegue repetir o processo para pelo menos 3 clientes.
