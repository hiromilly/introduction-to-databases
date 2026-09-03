# SPRINT 1/5 — Planejamento do Banco de Dados

**Disciplina:** Laboratório de Banco de Dados  
**Data:** 31/08/2026  
**Modalidade:** Atividade individual / Equipe  

---

## Objetivo da Sprint 1/5

Nesta primeira etapa, cada aluno deverá planejar individualmente um banco de dados completo, que será desenvolvido de forma incremental ao longo das cinco Sprints.

O banco escolhido nesta Sprint será o mesmo utilizado nas próximas etapas da atividade.

Ao final da semana, cada aluno deverá possuir um banco de dados funcional contendo:

- estrutura de tabelas;
- chaves primárias;
- chaves estrangeiras;
- restrições de integridade;
- dados cadastrados;
- operações de inserção, alteração e exclusão;
- consultas SQL;
- funções de agregação;
- agrupamentos;
- validação e documentação final.

Nesta Sprint 1/5, o foco é exclusivamente o planejamento do banco de dados.

> **Importante:** ainda não é necessário implementar o banco em SQL. A implementação começará na Sprint 2/5.

---

## 1. Identificação do aluno

**Nome completo:**  
> Célia Hiromi Watanabe

**Nome escolhido para o banco de dados:**

```text
db_salao_beleza
```

---

## 2. Tema do banco de dados

Escolha um domínio para o banco de dados que será desenvolvido durante toda a atividade.

O tema é livre, desde que permita a criação de um banco relacional com múltiplas tabelas e relacionamentos coerentes.

### Tema escolhido

> Sistema de Gestão e Agendamento para Salão de Beleza (com controle de autenticação de clientes, catálogo de serviços com durações específicas, profissionais e agenda de horários).

---

## 3. Descrição do sistema

Explique brevemente o sistema que será representado pelo banco de dados.

A descrição deve responder:

1. Qual problema ou contexto o sistema representa?
2. Quem utilizaria esse sistema?
3. Quais informações principais precisarão ser armazenadas?
4. Quais operações o sistema deverá permitir?

### Descrição

> O sistema representa a gestão operacional e o autoatendimento de um Salão de Beleza. Ele será utilizado tanto pelos clientes do salão (que acessam a plataforma via login e senha para agendar atendimentos) quanto pelos profissionais e administradores do estabelecimento (para gerenciar a agenda, os serviços realizados e o faturamento).
> 
> O banco armazenará dados cadastrais e credenciais seguras dos clientes, dados dos profissionais atendentes, catálogo de serviços com suas respectivas durações (corte: 1h, limpeza de pele: 2h, escova: 1h, química: 3h, unha: 1h, depilação: 2h) e preços, além dos agendamentos de horários e registros de pagamentos.
> 
> O sistema permitirá o cadastro e autenticação de clientes, consulta de serviços e disponibilidade de horários, realização de agendamentos sem sobreposição de horários e emissão de históricos de atendimentos.

---

## 4. Objetivo do banco de dados

Explique qual é o principal objetivo do banco de dados proposto.

### Objetivo

> O objetivo principal deste banco de dados é centralizar, proteger e organizar as informações de clientes, profissionais, serviços e agendamentos do salão de beleza, garantindo a integridade dos dados de autenticação (login/senha), o controle rigoroso da agenda de horários conforme o tempo de cada procedimento e o histórico financeiro dos atendimentos.

---

## 5. Escopo inicial

Defina o que fará parte do banco de dados.

Liste as principais funcionalidades ou informações que deverão ser contempladas.

O banco deverá permitir:

1- Cadastrar e autenticar clientes com login e senha criptografada (`senha_hash`);
2- Armazenar dados de contato (telefone, e-mail e CPF) para comunicação e confirmação de horários;
3- Cadastrar e manter o catálogo de serviços com nome, descrição, valor e duração em horas;
4- Cadastrar os profissionais do salão e suas especialidades de atendimento;
5- Registrar agendamentos vinculando ao cliente, profissional, data, horário de início e horário estimado de término;
6- Permitir múltiplos serviços em um mesmo agendamento;
7- Controlar o status de cada agendamento (Agendado, Confirmado, Concluído, Cancelado);
8- Registrar o pagamento e histórico financeiro de cada atendimento concluído.

---

## 6. Identificação das entidades

Identifique as principais entidades necessárias para representar o sistema.

Uma entidade representa algo sobre o qual o banco precisa armazenar informações.

### Entidades do seu banco

| Nº | Entidade | O que representa? |
| :--- | :--- | :--- |
| 1 | `cliente` (ou `usuario`) | Representa os clientes do salão, armazenando dados pessoais e credenciais de login e senha para acesso. |
| 2 | `servico` | Representa os procedimentos oferecidos pelo salão, incluindo nome, preço e duração em horas. |
| 3 | `profissional` | Representa os atendentes e especialistas do salão (cabeleireiros, manicures, esteticistas). |
| 4 | `agendamento` | Representa a reserva de data e horário na agenda do salão para um cliente com um profissional. |
| 5 | `item_agendamento` | Representa a associação entre os agendamentos e os serviços contratados naquele atendimento. |
| 6 | `pagamento` | Representa o registro financeiro e forma de pagamento do atendimento realizado. |

> Como referência para esta atividade, planeje **pelo menos 4 tabelas relacionadas**.

---

## 7. Planejamento dos atributos

Para cada entidade, identifique os principais atributos que deverão ser armazenados.

### Entidade 1

**Nome da entidade:**

```text
cliente
```

| Atributo | Informação armazenada | Tipo de dado previsto | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `id_cliente` | Identificador único do cliente | `INT` | Sim (PK) |
| `nome_completo` | Nome completo do cliente | `VARCHAR(100)` | Sim |
| `cpf` | Cadastro de Pessoa Física | `VARCHAR(14)` | Sim (UNIQUE) |
| `telefone` | Telefone/WhatsApp para contato | `VARCHAR(20)` | Sim |
| `email` | E-mail para avisos e recuperação | `VARCHAR(100)` | Sim (UNIQUE) |
| `login` | Nome de usuário para autenticação | `VARCHAR(50)` | Sim (UNIQUE) |
| `senha_hash` | Hash da senha de acesso | `VARCHAR(255)` | Sim |
| `status_conta` | Status do acesso (Ativo/Inativo) | `VARCHAR(20)` | Sim (DEFAULT 'Ativo') |
| `data_cadastro` | Data de criação do cadastro | `DATETIME` | Sim |

---

### Entidade 2

**Nome da entidade:**

```text
servico
```

| Atributo | Informação armazenada | Tipo de dado previsto | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `id_servico` | Identificador único do serviço | `INT` | Sim (PK) |
| `nome_servico` | Nome do serviço (ex: Corte, Escova, etc.) | `VARCHAR(100)` | Sim |
| `duracao_horas` | Duração do procedimento em horas | `INT` | Sim |
| `preco` | Valor cobrado pelo serviço | `DECIMAL(10,2)` | Sim |
| `descricao` | Detalhes do procedimento | `TEXT` | Não |

---

### Entidade 3

**Nome da entidade:**

```text
profissional
```

| Atributo | Informação armazenada | Tipo de dado previsto | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `id_profissional` | Identificador único do profissional | `INT` | Sim (PK) |
| `nome_completo` | Nome completo do profissional | `VARCHAR(100)` | Sim |
| `especialidade` | Área principal (Cabelo, Estética, Unha) | `VARCHAR(50)` | Sim |
| `telefone` | Telefone de contato do profissional | `VARCHAR(20)` | Sim |
| `status_ativo` | Situação no salão (Ativo/Inativo) | `VARCHAR(20)` | Sim (DEFAULT 'Ativo') |

---

### Entidade 4

**Nome da entidade:**

```text
agendamento
```

| Atributo | Informação armazenada | Tipo de dado previsto | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `id_agendamento` | Identificador único do agendamento | `INT` | Sim (PK) |
| `id_cliente` | Código do cliente que agendou | `INT` | Sim (FK) |
| `id_profissional` | Código do profissional escolhido | `INT` | Sim (FK) |
| `data_hora_inicio` | Data e horário de início do atendimento | `DATETIME` | Sim |
| `data_hora_fim` | Data e horário previsto de término | `DATETIME` | Sim |
| `status_agendamento` | Situação (Agendado, Concluído, Cancelado) | `VARCHAR(20)` | Sim (DEFAULT 'Agendado') |
| `valor_total` | Valor total somado do agendamento | `DECIMAL(10,2)` | Sim |

---

### Outras entidades

Caso o projeto possua mais de quatro entidades, registre-as abaixo.

| Entidade | Principais atributos |
| :--- | :--- |
| `item_agendamento` | `id_item` (PK), `id_agendamento` (FK), `id_servico` (FK), `preco_aplicado` (DECIMAL) |
| `pagamento` | `id_pagamento` (PK), `id_agendamento` (FK), `forma_pagamento` (VARCHAR), `valor_pago` (DECIMAL), `data_pagamento` (DATETIME) |

---

## 8. Chaves primárias

Cada tabela deverá possuir uma forma de identificar unicamente seus registros.

| Entidade/Tabela    | Chave primária prevista | Justificativa                                                                            |
| :----------------- | :---------------------- | :--------------------------------------------------------------------------------------- |
| `cliente`          | `id_cliente`            | Identificador numérico inteiro com `AUTO_INCREMENT`, único e imutável para cada cliente. |
| `servico`          | `id_servico`            | Código numérico sequencial que identifica cada serviço de forma estável no catálogo.     |
| `profissional`     | `id_profissional`       | Identificador numérico único para cada colaborador do salão de beleza.                   |
| `agendamento`      | `id_agendamento`        | Código único para rastrear cada agendamento na agenda e no histórico.                    |
| `item_agendamento` | `id_item`               | Identificador único de cada serviço adicionado a um determinado agendamento.             |
| `pagamento`        | `id_pagamento`          | Código identificador exclusivo de cada transação de pagamento realizada.                 |

---

## 9. Relacionamentos entre as entidades

Identifique como as entidades se relacionam.

### Relacionamentos planejados

| Entidade A | Relacionamento | Entidade B |
| :--- | :--- | :--- |
| `cliente` | realiza | `agendamento` |
| `profissional` | atende | `agendamento` |
| `agendamento` | contém | `item_agendamento` |
| `servico` | compõe | `item_agendamento` |
| `agendamento` | gera | `pagamento` |

---

## 10. Cardinalidade inicial

Utilize:

```text
1:1  → um para um
1:N  → um para muitos
N:N  → muitos para muitos
```

| Relacionamento | Cardinalidade prevista | Justificativa |
| :--- | :--- | :--- |
| `cliente` - `agendamento` | `1:N` | Um cliente pode realizar vários agendamentos ao longo do tempo, mas cada agendamento pertence a um único cliente. |
| `profissional` - `agendamento` | `1:N` | Um profissional atende múltiplos agendamentos em horários distintos, mas cada agendamento tem um profissional responsável principal. |
| `agendamento` - `servico` | `N:N` (via `item_agendamento`) | Um agendamento pode conter vários serviços (ex: Corte + Escova), e um mesmo serviço pode estar presente em vários agendamentos. |
| `agendamento` - `pagamento` | `1:1` | Cada agendamento concluído gera exatamente um registro financeiro de pagamento correspondente. |

---

## 11. Chaves estrangeiras previstas

| Tabela | Atributo previsto como FK | Referencia qual tabela? |
| :--- | :--- | :--- |
| `agendamento` | `id_cliente` | `cliente(id_cliente)` |
| `agendamento` | `id_profissional` | `profissional(id_profissional)` |
| `item_agendamento` | `id_agendamento` | `agendamento(id_agendamento)` |
| `item_agendamento` | `id_servico` | `servico(id_servico)` |
| `pagamento` | `id_agendamento` | `agendamento(id_agendamento)` |

> As `FOREIGN KEY` serão implementadas posteriormente. Nesta Sprint, apenas planeje os relacionamentos.

---

## 12. Restrições de integridade previstas

| Tabela | Atributo | Restrição prevista | Motivo |
| :--- | :--- | :--- | :--- |
| `cliente` | `id_cliente` | `PRIMARY KEY`, `AUTO_INCREMENT` | Identificação unívoca de cada cliente. |
| `cliente` | `login` | `NOT NULL`, `UNIQUE` | Não permitir logins repetidos nem em branco no sistema. |
| `cliente` | `cpf` | `NOT NULL`, `UNIQUE` | Garantir que o mesmo cliente não possua cadastros duplicados. |
| `cliente` | `email` | `NOT NULL`, `UNIQUE` | Canal exclusivo para notificações e recuperação de senha. |
| `cliente` | `senha_hash` | `NOT NULL` | Obriga que todo usuário tenha senha criptografada de acesso. |
| `servico` | `preco` | `NOT NULL`, `CHECK (preco >= 0)` | Garante que o valor do serviço não seja negativo. |
| `servico` | `duracao_horas` | `NOT NULL`, `CHECK (duracao_horas > 0)` | A duração mínima do serviço deve ser de pelo menos 1 hora. |
| `agendamento` | `data_hora_inicio` | `NOT NULL` | Nenhum agendamento pode existir sem data e hora definida. |

---

## 13. Regras de negócio

Defina pelo menos 5 regras de negócio para o sistema.

### Regras do seu banco

1. **Autenticação Obrigatória:** O cliente só pode realizar agendamentos após autenticar-se com login e senha válidos.
2. **Segurança de Credenciais:** As senhas dos clientes nunca devem ser salvas em texto puro, sendo obrigatório o uso de criptografia hash (`senha_hash`).
3. **Unicidade de Identificação:** Cada cliente deve possuir login, e-mail e CPF únicos no sistema.
4. **Duração Padrão dos Serviços:** O agendamento deve reservar na agenda o tempo correto do serviço (Corte de cabelo: 1h, Limpeza de pele: 2h, Escova: 1h, Pintura e químico: 3h, Unha: 1h, Depilação: 2h).
5. **Prevenção de Conflito de Agenda:** Um profissional não pode ter dois agendamentos sobrepostos no mesmo intervalo de data e hora.
6. **Controle de Acesso:** Apenas clientes com `status_conta = 'Ativo'` podem agendar serviços.

---

## 14. Esboço da estrutura do banco

Faça uma representação textual inicial das tabelas e relacionamentos.

### Esboço do seu banco

```text
CLIENTE
├── id_cliente (PK)
├── nome_completo
├── cpf (UNIQUE)
├── telefone
├── email (UNIQUE)
├── login (UNIQUE)
├── senha_hash
├── status_conta
└── data_cadastro

PROFISSIONAL
├── id_profissional (PK)
├── nome_completo
├── especialidade
├── telefone
└── status_ativo

SERVICO
├── id_servico (PK)
├── nome_servico
├── duracao_horas
├── preco
└── descricao

AGENDAMENTO
├── id_agendamento (PK)
├── id_cliente (FK)
├── id_profissional (FK)
├── data_hora_inicio
├── data_hora_fim
├── status_agendamento
└── valor_total

ITEM_AGENDAMENTO
├── id_item (PK)
├── id_agendamento (FK)
├── id_servico (FK)
└── preco_aplicado

PAGAMENTO
├── id_pagamento (PK)
├── id_agendamento (FK)
├── forma_pagamento
├── valor_pago
└── data_pagamento

RELACIONAMENTOS:
CLIENTE (1) ───────────< (N) AGENDAMENTO
PROFISSIONAL (1) ──────< (N) AGENDAMENTO
AGENDAMENTO (1) ───────< (N) ITEM_AGENDAMENTO >─────────── (1) SERVICO
AGENDAMENTO (1) ─────── (1) PAGAMENTO
```

---

## 15. Dados que futuramente serão inseridos

Descreva que tipos de registros deverão existir no banco quando ele for populado.

- **Clientes:** Registros de clientes contendo nomes reais fictícios, CPFs formatados, telefones, e-mails, logins únicos e hashes simuladas de senha (ex: Cliente Maria Silva, login `maria.silva`).
- **Serviços:** Catálogo inicial com os 6 serviços obrigatórios:
  1. *Corte de cabelo* — Duração: 1 hora — Preço: R$ 60,00
  2. *Escova* — Duração: 1 hora — Preço: R$ 45,00
  3. *Unha* — Duração: 1 hora — Preço: R$ 40,00
  4. *Limpeza de pele* — Duração: 2 horas — Preço: R$ 120,00
  5. *Depilação* — Duração: 2 horas — Preço: R$ 90,00
  6. *Pintura e procedimento químico* — Duração: 3 horas — Preço: R$ 200,00
- **Profissionais:** Cabeleireiros, manicures e esteticistas cadastrados com suas especialidades.
- **Agendamentos e Itens:** Registros de horários marcados em diferentes datas e horários, associando clientes a profissionais e serviços.
- **Pagamentos:** Registros de recebimentos em dinheiro, cartão de crédito, débito e PIX.

---

## 16. Perguntas que o banco deverá ser capaz de responder

Defina pelo menos 5 perguntas que futuramente deverão ser respondidas por consultas SQL.

### Perguntas do seu projeto

1. **Quais clientes estão cadastrados e ativos no sistema?**  
   *(Consulta de listagem com `SELECT` e `WHERE`)*
2. **Quais serviços têm duração maior ou igual a 2 horas e seus respectivos valores?**  
   *(Consulta de catálogo com filtro de tempo e ordenação de preço)*
3. **Quais agendamentos um determinado cliente realizou, com data, profissional e status?**  
   *(Consulta com `JOIN` entre Cliente, Agendamento e Profissional)*
4. **Qual é o total de agendamentos e o faturamento bruto gerado por cada serviço?**  
   *(Consulta com `JOIN`, `GROUP BY`, `COUNT` e `SUM`)*
5. **Quais profissionais possuem agendamentos marcados para uma data específica?**  
   *(Consulta com `JOIN` e filtro de data para a agenda do salão)*

---

## 17. Decisões e dúvidas pendentes

> Nenhuma dúvida pendente nesta Sprint.

---

## 18. Checklist da Sprint 1/5

- [x] identifiquei o aluno responsável;
- [x] defini o tema do banco de dados;
- [x] descrevi o sistema;
- [x] defini o objetivo do banco;
- [x] defini o escopo inicial;
- [x] identifiquei pelo menos 4 entidades;
- [x] planejei os principais atributos;
- [x] defini as chaves primárias previstas;
- [x] identifiquei os relacionamentos;
- [x] defini as cardinalidades iniciais;
- [x] identifiquei possíveis chaves estrangeiras;
- [x] planejei restrições de integridade;
- [x] defini pelo menos 5 regras de negócio;
- [x] fiz um esboço da estrutura do banco;
- [x] defini os tipos de dados que futuramente serão cadastrados;
- [x] defini pelo menos 5 perguntas que o banco deverá responder;
- [x] registrei dúvidas ou decisões pendentes;
- [x] revisei o arquivo antes de finalizar.

---

## Entrega da Sprint 1/5

O arquivo desta etapa deverá ser salvo com o nome: 

```text
SPRINT1-5.md
```

O aluno deverá manter este arquivo, pois ele será utilizado como referência para as próximas Sprints.

A evolução será:

```text
SPRINT1-5.md
    ↓
Planejamento do banco
    ↓
SPRINT2-5.md
    ↓
Criação da estrutura com DDL
    ↓
SPRINT3-5.md
    ↓
Inserção e manipulação de dados
    ↓
SPRINT4-5.md
    ↓
Consultas SQL
    ↓
SPRINT5-5.md
    ↓
Validação e entrega do banco completo
```

---

## Regras de Git/GitHub

A atividade é individual / por equipe.  
Cada aluno/equipe deverá manter seu próprio histórico de desenvolvimento durante as cinco Sprints.

### Branch

O aluno deverá trabalhar em uma branch própria durante toda a atividade.  
A branch não deverá ser recriada a cada Sprint.  
Utilize a convenção definida pelo professor para identificação individual / da equipe:

```text
team-03-sprints-1-5
```

### Commit

Cada Sprint deverá gerar pelo menos um commit próprio.

Mensagem sugerida para hoje:

```text
Team 03 - conclui Sprint 1 de 5 - planejamento do banco
```

Nas próximas etapas:

```text
Team 03 - conclui Sprint 2 de 5 - estrutura DDL
Team 03 - conclui Sprint 3 de 5 - operações DML
Team 03 - conclui Sprint 4 de 5 - consultas SQL
Team 03 - conclui Sprint 5 de 5 - validação final
```

### Pull Request

**Não abrir o Pull Request final nesta Sprint.**  
O Pull Request será realizado somente após a conclusão da Sprint 5/5.

```text
SPRINT1-5.md → commit
SPRINT2-5.md → commit
SPRINT3-5.md → commit
SPRINT4-5.md → commit
SPRINT5-5.md → commit
                         ↓
                  Pull Request final
                         ↓
                        main
```

---

## Critério de conclusão da Sprint 1/5

A Sprint será considerada concluída quando o aluno apresentar um planejamento suficientemente detalhado para permitir que, na próxima etapa, consiga transformar sua proposta em um banco de dados relacional utilizando SQL.

Não basta informar apenas o tema. O planejamento deverá demonstrar:

- quais tabelas existirão;
- quais informações serão armazenadas;
- como as tabelas se relacionarão;
- quais regras deverão ser respeitadas;
- quais consultas o banco deverá permitir ao final da atividade.

---

## Próxima etapa

Na **Sprint 2/5**, o planejamento será transformado em uma implementação utilizando comandos DDL.

Serão trabalhados:

```sql
CREATE DATABASE
CREATE TABLE
ALTER TABLE
DROP TABLE
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
DEFAULT
```

> **Não implemente a Sprint 2/5 neste arquivo.** A atividade de hoje será avaliada exclusivamente pelo planejamento registrado na Sprint 1/5.
