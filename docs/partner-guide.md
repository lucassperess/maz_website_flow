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

Repositorios de clientes devem comecar privados. Isso evita exposicao acidental de dados, assets ou rascunhos.

### Vercel

Toda alteracao relevante deve ir primeiro para preview. Producao so deve ser atualizada quando alguem aprovar.

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

## Perguntas que ainda precisamos fechar

1. Qual sera o nome exato da organizacao no GitHub: `maz`, outra org, ou conta pessoal?
2. Os repositorios dos clientes serao sempre privados?
3. A Vercel sera uma conta da empresa ou conta por cliente?
4. Quem aprova deploy em producao?
5. Qual modelo de site inicial queremos usar: institucional simples, landing page, ou catalogo de servicos?
