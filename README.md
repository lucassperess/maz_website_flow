# maz_website_flow

MVP para criar e manter sites de clientes com IA, usando fluxo operacional baseado em skills no Claude Code Max.

## Objetivo

Padronizar um pipeline com duas skills principais:
1. `intake-to-repo`: ler uma pasta de onboarding do cliente e criar/estruturar o repositorio no GitHub da maz.
2. `build-and-deploy`: ler o repositorio do cliente, construir/atualizar o site e fazer deploy na Vercel com logs humanos.

Inclui tambem uma rotina semanal automatizada de code review para detectar bugs e regressoes.

## Estrutura

1. [docs/mvp-plan.md](docs/mvp-plan.md): plano tecnico do MVP.
2. [docs/partner-guide.md](docs/partner-guide.md): guia para socio pouco tecnico.
3. [skills/intake-to-repo/SKILL.md](skills/intake-to-repo/SKILL.md): skill de criacao do repo do cliente.
4. [skills/build-and-deploy/SKILL.md](skills/build-and-deploy/SKILL.md): skill de build/deploy do site.
5. [templates/client-repo](templates/client-repo): template inicial para repositorios de clientes.
6. [examples/intake-sample](examples/intake-sample): intake ficticio para testar o fluxo.

## Proximo marco

Validar o fluxo com um cliente ficticio antes de conectar tokens reais de GitHub e Vercel.
