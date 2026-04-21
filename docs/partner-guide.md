# Guia para socio pouco tecnico

Este guia explica o fluxo do MVP sem exigir conhecimento tecnico profundo.

## O que estamos construindo

Vamos criar um processo para gerar sites de clientes com IA de forma repetivel.

A ideia e simples:
1. O cliente envia informacoes e arquivos.
2. A IA organiza isso em um repositorio no GitHub.
3. A IA cria ou atualiza o site.
4. O site e publicado na Vercel.
5. Cada alteracao fica registrada em linguagem humana.
6. Uma revisao automatica roda toda semana para procurar problemas.

## Papeis das duas skills

### Skill 1: intake-to-repo

Esta skill pega a pasta inicial do cliente e cria o repositorio padrao.

Ela verifica:
1. Se existe formulario do cliente.
2. Se existem arquivos de marca, como logo e cores.
3. Se existe conteudo inicial do site.
4. Se faltam informacoes importantes.

Depois ela cria o repositorio do cliente com tres areas principais:
1. `site/`: codigo do site.
2. `client-data/`: informacoes e arquivos originais do cliente.
3. `logs/`: memoria em linguagem humana do que a IA fez.

### Skill 2: build-and-deploy

Esta skill le o repositorio do cliente, cria ou altera o site e publica na Vercel.

Ela deve:
1. Ler as informacoes do cliente.
2. Criar o site ou fazer a alteracao pedida.
3. Testar se o site compila.
4. Publicar primeiro em preview.
5. Publicar em producao quando aprovado.
6. Registrar o que mudou nos logs.

## Fluxo operacional recomendado

1. Criar uma pasta de entrada para o cliente.
2. Colocar o formulario e assets nessa pasta.
3. Rodar a Skill 1 para criar o repositorio.
4. Revisar o relatorio de pendencias.
5. Rodar a Skill 2 para gerar o primeiro site.
6. Conferir o preview da Vercel.
7. Aprovar publicacao em producao.
8. Usar os logs como historico do projeto.

## Casos comuns do dia a dia

### Cliente organizado

O cliente envia formulario, textos, logo, imagens e objetivo claro. Esse e o melhor caso: o fluxo pode ir direto para repositorio, preview e aprovacao.

### Cliente incompleto

O cliente envia poucas informacoes ou assets ruins. A IA nao deve completar fatos importantes por conta propria. Ela deve gerar uma lista do que falta e, no maximo, montar uma versao provisoria claramente marcada como rascunho.

### Cliente sem marca pronta

Quando nao existe logo, paleta ou fotos boas, a IA pode propor uma direcao visual inicial. Essa proposta precisa ser aprovada antes de virar identidade do site.

### Landing page

Usar quando o cliente tem uma oferta principal e quer gerar contato, leads ou vendas. O foco e clareza, chamada para acao e evitar promessas exageradas.

### Site institucional simples

Usar quando o cliente precisa explicar quem e, o que faz, para quem atende e como entrar em contato. E o formato mais comum para empresas locais e prestadores de servico.

### Catalogo

Usar quando existem varios produtos, servicos, planos, unidades ou categorias. O cuidado principal e nao inventar detalhes de itens incompletos.

### Ajuste antes de publicar

Se Lucas ou cliente reprovar algo no preview, a IA faz ajuste, cria novo log e gera novo preview. Producao continua bloqueada ate nova aprovacao.

### Alteracao depois do site no ar

Trocas de telefone, texto, imagens, links e ofertas seguem o mesmo principio: preview primeiro, log da mudanca, aprovacao do Lucas e producao depois.

### Problema encontrado no review semanal

Quando a revisao semanal encontrar algo, isso vira uma pendencia objetiva. A IA pode corrigir, mas a correcao tambem passa por preview antes de producao se afetar o site publicado.

## O que o socio precisa conferir

Antes de iniciar:
1. Nome correto do cliente.
2. Dominio desejado, se existir.
3. Logo e imagens principais.
4. Oferta principal do negocio.
5. Publico-alvo.
6. Paginas esperadas no site.
7. Informacoes que nao podem ser publicadas.

Antes de publicar:
1. Se o nome da empresa esta correto.
2. Se telefone, email e links estao corretos.
3. Se as imagens podem ser usadas.
4. Se o site nao promete algo que o cliente nao entrega.
5. Se a URL de preview foi aprovada.

## Decisoes importantes

### GitHub

Repositorios de clientes devem ser sempre privados. Isso evita exposicao acidental de dados, assets ou rascunhos.

A organizacao GitHub da empresa Maz sera criada posteriormente. Enquanto isso, o projeto pode ser testado em conta pessoal ou repositorio temporario.

### Vercel

Inicialmente, a Vercel usara uma conta central da empresa para varios clientes.

Toda alteracao relevante deve ir primeiro para preview. Producao so deve ser atualizada quando Lucas aprovar.

### Ferramentas

As ferramentas existem para apoiar o fluxo, nao para definir o produto. Neste momento, o mais importante e garantir que cada caso de cliente tenha entrada, decisao, preview, aprovacao, publicacao e memoria registrada.

### Tipo de site

O primeiro template nao precisa ser sempre igual. A IA deve escolher o formato com base no cliente e justificar a escolha:
1. Institucional simples.
2. Landing page.
3. Catalogo.
4. Outro formato adequado ao objetivo do cliente.

### Logs

Os logs sao a memoria operacional do projeto. Eles devem ser escritos para humanos, nao para maquinas.

Exemplo de log bom:

```txt
Alteramos a pagina inicial para destacar o servico principal do cliente e adicionamos uma chamada para contato via WhatsApp. O risco principal e o numero estar incorreto; validar antes de publicar.
```

Exemplo de log ruim:

```txt
Updated files.
```

## Riscos que merecem atencao

1. Publicar dados privados do cliente.
2. Usar imagens sem autorizacao.
3. Configurar dominio errado.
4. Deixar alteracoes sem log.
5. Aceitar conteudo inventado pela IA como se fosse fato.
6. Publicar direto em producao sem preview.

## Como saber se o MVP funcionou

O MVP funcionou quando conseguirmos repetir o processo para 3 clientes:
1. Pasta inicial criada.
2. Repositorio criado automaticamente.
3. Site publicado na Vercel.
4. Logs atualizados.
5. Revisao semanal funcionando.

## Pontos que ainda precisam ser preparados

1. Criar a organizacao GitHub da Maz.
2. Conectar a conta central da Vercel da empresa.
3. Definir quem pode criar repositorios, publicar previews e aprovar producao.
4. Criar o primeiro projeto piloto com cliente ficticio.
