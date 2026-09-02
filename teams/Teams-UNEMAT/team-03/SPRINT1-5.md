# SPRINT 1/5 — Planejamento Inicial do Módulo

**Disciplina:** Laboratório de Banco de Dados  
**Data:** 01/09/2026  
**Equipe:** Team 03  
**Módulo:** Autenticação e Gestão de Clientes (Salão de Beleza Bridge of Beauty)  

---

## Objetivo da Sprint 1/5

Nesta primeira etapa, a equipe deverá **planejar o módulo sob sua responsabilidade antes de iniciar a implementação em SQL**.

O objetivo de hoje é definir claramente:

- quem são os integrantes da equipe;
- qual é a responsabilidade do módulo;
- quais dados deverão ser armazenados;
- quais atributos farão parte da tabela principal;
- qual será a chave primária;
- quais restrições de integridade serão necessárias;
- quais outros módulos poderão se relacionar com este módulo.

> **Importante:** nesta Sprint ainda não é necessário implementar `CREATE TABLE`, `INSERT`, `UPDATE`, `DELETE` ou consultas SQL. Esses conteúdos serão desenvolvidos nas próximas aulas.

---

## 1. Integrantes

Preencha com os integrantes da equipe.

- Nome completo: Célia Hiromi Watanabe

---

## 2. Descrição do módulo

Esse módulo será responsável pelo cadastro e acesso dos clientes ao sistema do Salão de Beleza. Dentro dele terão informações como: nome, telefone, e-mail, login e senha de cada cliente.

Com essas informações serão utilizadas para identificar o cliente e permitir que ele entre no sistema com seu login e a senha.  Após feito isso ele poderá ter acesso para consultar os serviços oferecidos pelo salão, verificar os preços e promoções, visualizar os dias e horários disponíveis e realizar seus agendamentos. Também poderá relacionar com o módulo de serviços, para visualizar os preços dos serviços e com o módulo de agendamento, para que assim o cliente possa escolher um serviço, selecionar data e horário disponível para marcar seu atendimento, deixando de maneira mais organizado facilitando o processo dos serviços oferecidos pelo Salão de Beleza.
### Exemplo de nível esperado

> O Módulo de Autenticação e Clientes será responsável por armazenar os dados cadastrais (login e senha) de cada cliente do salão de beleza. Esses dados serão utilizados para autenticar o cliente na plataforma e permitir o agendamento de serviços na agenda de horários (como cortes de cabelo, escovas, limpeza de pele, unhas, depilação e procedimentos químicos).


### Descrição da equipe

> Os  usuários e clientes cadastrados terão acesso ao serviço do salão de beleza, permitindo o entrar ao sistema podendo utilizar seu login e senha cadastrado, para visualizar e marcar horários com agendamentos dos serviços oferecidos, podendo ver preços e dias disponíveis para cada serviço

---

## 3. Planejamento da tabela principal

A equipe deverá definir os atributos iniciais da tabela responsável por representar os usuários e clientes do salão.

Preencha a tabela abaixo.

| Atributo        | Tipo de dado previsto | Obrigatório? | Restrição prevista                      | Justificativa                                            |
| :-------------- | :-------------------- | :----------- | :-------------------------------------- | :------------------------------------------------------- |
| `id_usuario`    | `INT`                 | Sim          | `PRIMARY KEY`, `AUTO_INCREMENT`         | Identificador único de cada cliente/usuário no sistema   |
| `nome_completo` | `VARCHAR(100)`        | Sim          | `NOT NULL`                              | Nome completo do cliente para exibição e agendamentos    |
| `cpf`           | `VARCHAR(14)`         | Sim          | `NOT NULL`, `UNIQUE`                    | Documento único nacional que evita cadastros duplicados  |
| `telefone`      | `VARCHAR(20)`         | Sim          | `NOT NULL`                              | Contato telefônico para confirmação de agendamentos      |
| `email`         | `VARCHAR(100)`        | Sim          | `NOT NULL`, `UNIQUE`                    | E-mail para contato e recuperação de senha               |
| `login`         | `VARCHAR(50)`         | Sim          | `NOT NULL`, `UNIQUE`                    | Nome de usuário único para autenticação/login no sistema |
| `senha_hash`    | `VARCHAR(255)`        | Sim          | `NOT NULL`                              | Senha de acesso armazenada em formato hash seguro        |
| `tipo_usuario`  | `VARCHAR(20)`         | Sim          | `NOT NULL`, `DEFAULT 'Cliente'`         | Nível de acesso (Cliente, Profissional, Administrador)   |
| `status_conta`  | `VARCHAR(20)`         | Sim          | `NOT NULL`, `DEFAULT 'Ativo'`           | Estado do cadastro (Ativo, Inativo, Bloqueado)           |
| `data_cadastro` | `DATETIME`            | Sim          | `NOT NULL`, `DEFAULT CURRENT_TIMESTAMP` | Data e hora em que o cadastro foi realizado              |

A equipe deverá propor **pelo menos 5 atributos além do identificador principal**.

Alguns exemplos de atributos que podem ser considerados:

- nome;
- CPF;
- login;
- senha;
- e-mail;
- telefone;
- data de cadastro;
- status da conta.

A equipe não é obrigada a utilizar exatamente esses atributos.

---

## 4. Chave primária

Informe qual atributo será utilizado como chave primária da tabela.

**Atributo escolhido:**

`id_usuario`

### Justificativa

Explique por que esse atributo é adequado para identificar cada registro de forma única.

> Será utilizado um id_usuário como chave primária porque cada cliente cadastrado terá um número de identificação único dentro do sistema. Mesmo que o cliente altere alguma informação do seu cadastro, seu identificador continuará sendo o mesmo, já o CPF será cadastrado como uma informação única de cada cliente e será utilizado para realizar o login no sistema junto com a senha criada, assim  permitindo que ele acesse sua conta para consultar os serviços, preços, horários disponíveis e realizar seus agendamentos.

---

## 5. Restrições de integridade

Identifique quais restrições poderão ser necessárias.

| Atributo | Restrição prevista | Justificativa |
| :--- | :--- | :--- |
| `id_usuario` | `PRIMARY KEY`, `AUTO_INCREMENT` | Garante a identificação única e automática de cada usuário. |
| `login` | `NOT NULL`, `UNIQUE` | Garante que cada cliente tenha um login exclusivo e que nunca fique em branco. |
| `email` | `NOT NULL`, `UNIQUE` | Impede e-mails duplicados e assegura um canal único para recuperação de conta. |
| `cpf` | `NOT NULL`, `UNIQUE` | Garante que um mesmo cliente não seja cadastrado mais de uma vez. |
| `senha_hash` | `NOT NULL` | Torna obrigatório que todo usuário possua uma senha de acesso. |
| `telefone` | `NOT NULL` | Obrigatório para contato do salão para confirmação de horários. |
| `status_conta` | `NOT NULL`, `DEFAULT 'Ativo'` | Define que todo novo usuário inicia com acesso liberado. |

Durante a discussão, considere perguntas como:

- dois clientes podem possuir o mesmo login?
- dois clientes podem possuir o mesmo e-mail ou CPF?
- a senha de um usuário pode ficar vazia?
- quais informações devem ser obrigatórias?
- quais dados precisam ser únicos?

---

## 6. Relacionamentos com outros módulos

Liste os módulos que poderão utilizar ou se relacionar com os dados de clientes/usuários.

| Módulo relacionado | Como poderá se relacionar com Usuários/Clientes? |
| :--- | :--- |
| Agenda de Horários / Agendamentos | O cliente autenticado (`id_usuario`) realiza agendamentos escolhendo datas e horários disponíveis. |
| Serviços do Salão | O agendamento associa o cliente aos serviços selecionados (Corte 1h, Limpeza de pele 2h, Escova 1h, Pintura/Química 3h, Unha 1h, Depilação 2h). |
| Profissionais / Atendentes | Vincula o atendimento do cliente ao profissional responsável pela execução do serviço. |
| Financeiro / Pagamentos | Registra os pagamentos e valores correspondentes aos serviços agendados pelo cliente. |

> Nesta Sprint, não é necessário implementar `FOREIGN KEY`. O objetivo é apenas identificar possíveis relacionamentos.

---

## 7. Regras de negócio identificadas

Registre pelo menos **3 regras de negócio** que a equipe considera importantes para o módulo.

Exemplos de perguntas que podem ajudar:

- todo cliente deve possuir login e senha?
- a senha pode ser armazenada em texto puro?
- um cliente pode existir sem telefone ou e-mail?
- como a duração dos serviços (1h, 2h, 3h) impacta a reserva na agenda?

### Regras da equipe

1. **Autenticação Obrigatória:** O cliente só pode acessar a agenda e realizar agendamentos após autenticar-se com login e senha válidos.
2. **Segurança de Senha:** As senhas devem ser armazenadas de forma criptografada (`senha_hash`), nunca em texto puro.
3. **Unicidade de Acesso:** Cada cliente deve possuir login, e-mail e CPF únicos no sistema.
4. **Respeito à Duração dos Serviços na Agenda:** Cada agendamento feito pelo cliente deve bloquear na agenda o tempo correspondente ao serviço escolhido (Corte: 1h, Limpeza de pele: 2h, Escova: 1h, Pintura e químico: 3h, Unha: 1h, Depilação: 2h).
5. **Acesso Apenas para Contas Ativas:** Clientes com status diferente de `'Ativo'` ficam impossibilitados de realizar agendamentos.

---

## 8. Dúvidas ou decisões pendentes

Registre aqui pontos que ainda precisam ser discutidos com o professor ou com outras equipes.

> Nenhuma dúvida pendente nesta Sprint.

---

## 9. Checklist da Sprint 1/5

Antes de finalizar a atividade de hoje, verifique se a equipe completou:

- [x] identificação dos integrantes;
- [x] descrição do módulo;
- [x] definição da tabela principal;
- [x] pelo menos 5 atributos além da chave primária;
- [x] escolha e justificativa da chave primária;
- [x] identificação das principais restrições;
- [x] identificação dos relacionamentos com outros módulos;
- [x] definição de pelo menos 3 regras de negócio;
- [x] registro de dúvidas ou decisões pendentes;
- [x] revisão do arquivo antes do commit.

---

## 10. Regras de versionamento e entrega no GitHub
A equipe deverá utilizar o fluxo de trabalho com **branch, commit e Pull Request (PR)** durante toda a semana.

A Sprint 1/5 é apenas a primeira etapa. Os arquivos `SPRINT2-5.md`, `SPRINT3-5.md`, `SPRINT4-5.md` e `SPRINT5-5.md` serão adicionados progressivamente à **mesma branch de trabalho da equipe**, e o Pull Request final será aberto na sexta-feira.

### 10.1 Branch

A equipe **não deverá desenvolver diretamente na branch `main`**.

Crie uma branch específica para o trabalho da equipe durante a semana.

Para o Team 03, utilize:

```text
team-03-sprints-1-5
```

O fluxo esperado é:

```text
main
  └── team-03-sprints-1-5
        ├── SPRINT1-5.md
        ├── SPRINT2-5.md
        ├── SPRINT3-5.md
        ├── SPRINT4-5.md
        └── SPRINT5-5.md
```

A branch deverá ser mantida até a conclusão da Sprint 5/5.

> O workflow de validação do repositório é executado quando um Pull Request é aberto tendo a branch `main` como destino. Portanto, o PR final da equipe deverá apontar para `main`.

---

### 10.2 Commit

Cada Sprint deverá gerar pelo menos **um commit próprio**, permitindo acompanhar a evolução do trabalho durante a semana.

Para hoje, após concluir o arquivo `SPRINT1-5.md`, utilize uma mensagem clara e objetiva.

Mensagem sugerida:

```text
Team 03 - conclui Sprint 1 de 5
```

Nas próximas etapas, utilize o mesmo padrão:

```text
Team 03 - conclui Sprint 2 de 5
Team 03 - conclui Sprint 3 de 5
Team 03 - conclui Sprint 4 de 5
Team 03 - conclui Sprint 5 de 5
```

Antes do commit, confira se o arquivo está na pasta correta:

```text
teams/Teams-UNEMAT/team-03/
```

Fluxo esperado:

```text
editar arquivo
      ↓
revisar conteúdo
      ↓
salvar
      ↓
commit
      ↓
push para a branch da equipe
```

> O arquivo não deve ser enviado diretamente para `main`.

---

### 10.3 Pull Request — PR

**Não abrir o Pull Request final hoje.**

O PR deverá ser aberto somente na **Sprint 5/5, na sexta-feira**, depois que todos os arquivos da semana estiverem concluídos.

Ao final da semana, a branch deverá conter:

```text
teams/Teams-UNEMAT/team-03/
├── SPRINT1-5.md
├── SPRINT2-5.md
├── SPRINT3-5.md
├── SPRINT4-5.md
└── SPRINT5-5.md
```

O Pull Request deverá utilizar:

**Branch de origem:**

```text
team-03-sprints-1-5
```

**Branch de destino:**

```text
main
```

Título sugerido para o PR:

```text
[N1][UNEMAT][Team 03] Sprints 1-5 - Autenticação e Gestão de Clientes
```

Na descrição do Pull Request, a equipe deverá informar:

- integrantes;
- módulo desenvolvido;
- resumo do trabalho realizado durante as cinco Sprints;
- confirmação de que os arquivos foram revisados;
- confirmação de que os códigos SQL desenvolvidos nas etapas seguintes foram testados;
- eventuais dificuldades ou limitações encontradas.

---

### 10.4 Regras importantes do Pull Request

O workflow de validação do repositório é executado sobre Pull Requests direcionados à branch:

```text
main
```

Por isso:

- o PR final deverá ter `main` como destino;
- a equipe deverá alterar somente os arquivos autorizados para sua entrega;
- não deverão ser modificados arquivos de outras equipes;
- não deverão ser modificados arquivos administrativos do repositório;
- alterações indevidas poderão fazer a validação automática do PR falhar;
- o PR somente será considerado entrega quando estiver aberto no repositório oficial da disciplina.

---

## 11. Entrega da Sprint 1/5

O arquivo desta etapa deverá ser salvo com o nome:

```text
SPRINT1-5.md
```

e permanecer dentro da pasta da equipe:

```text
teams/Teams-UNEMAT/team-03/SPRINT1-5.md
```

Ao finalizar a atividade de hoje:

1. revise todas as respostas;
2. confirme que o arquivo está na pasta correta;
3. confirme que está trabalhando na branch `team-03-sprints-1-5`;
4. faça o commit da Sprint 1/5;
5. envie a atualização para a branch da equipe;
6. **não abra ainda o PR final**.

### Checklist Git/GitHub de hoje

- [x] Estou trabalhando na branch `team-03-sprints-1-5`;
- [x] não alterei diretamente a `main`;
- [x] editei apenas os arquivos da minha equipe;
- [x] o arquivo se chama `SPRINT1-5.md`;
- [x] o arquivo está em `teams/Teams-UNEMAT/team-03/`;
- [x] revisei o conteúdo antes de salvar;
- [x] realizei o commit da Sprint 1/5;
- [x] enviei o commit para a branch da equipe;
- [x] não abri o PR final antes da Sprint 5/5.

---

## Próxima etapa

Na **Sprint 2/5**, a equipe utilizará o planejamento produzido hoje para implementar a estrutura do banco de dados utilizando comandos DDL, especialmente:

- `CREATE TABLE`;
- tipos de dados;
- `PRIMARY KEY`;
- `FOREIGN KEY`;
- `NOT NULL`;
- `UNIQUE`;
- `DEFAULT`;
- `ALTER TABLE`, quando necessário.

> **Não antecipe a Sprint 2/5 neste arquivo.** A atividade de hoje será avaliada exclusivamente pelo planejamento registrado na Sprint 1/5.