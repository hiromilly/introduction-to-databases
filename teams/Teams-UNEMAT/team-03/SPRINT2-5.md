# SPRINT 2/5 — Implementação da Estrutura do Banco de Dados com DDL

**Disciplina:** Laboratório de Banco de Dados  
**Modalidade:** Atividade individual / Equipe  
**Aluna:** Célia Hiromi Watanabe (Team 03)  
**Entrega desta Sprint:** `SPRINT2-5.md` + `SPRINT2-5.sql`

---

# Objetivo da Sprint 2/5

Nesta etapa, cada aluno deverá transformar o planejamento produzido na `SPRINT1-5.md` em uma **estrutura funcional de banco de dados no MySQL**.

O objetivo é criar o banco e suas tabelas utilizando comandos DDL (*Data Definition Language*), implementando corretamente:

- `CREATE DATABASE`;
- `USE`;
- `CREATE TABLE`;
- tipos de dados;
- `PRIMARY KEY`;
- `AUTO_INCREMENT`, quando adequado;
- `NOT NULL`;
- `UNIQUE`;
- `DEFAULT`, quando adequado;
- `FOREIGN KEY`;
- `ALTER TABLE`;
- `DROP TABLE` em exercício controlado;
- validação da estrutura criada.

Ao final da Sprint 2/5, o aluno deverá possuir **dois arquivos**:

```text
SPRINT2-5.md
SPRINT2-5.sql
```

O arquivo `.md` documentará as decisões, explicações e evidências da Sprint.

O arquivo `.sql` conterá o **script SQL executável produzido no MySQL Workbench**.

> Os dois arquivos deverão permanecer na branch individual do aluno e serão incluídos posteriormente no Pull Request final, após a Sprint 5/5.

---

# 1. Antes de começar

Abra a sua `SPRINT1-5.md` e revise:

- tema escolhido;
- entidades;
- atributos;
- chaves primárias;
- relacionamentos;
- cardinalidades;
- possíveis chaves estrangeiras;
- restrições de integridade;
- regras de negócio.

A Sprint 2/5 deve ser uma implementação do que foi planejado anteriormente.

Caso seja necessário alterar alguma decisão da Sprint 1/5, isso é permitido, mas a mudança deverá ser registrada neste arquivo.

---

# 2. Passo a passo no MySQL Workbench

## Passo 1 — Abrir o MySQL Workbench

1. Abra o **MySQL Workbench**.
2. Na tela inicial, localize sua conexão MySQL.
3. Clique na conexão.
4. Informe a senha, caso seja solicitado.
5. Aguarde a abertura do ambiente SQL.

Ao entrar, você deverá visualizar:

- área de edição SQL;
- painel **Navigator**;
- seção **Schemas**;
- barra de execução dos comandos.

---

## Passo 2 — Criar uma nova aba SQL

Clique em:

```text
File → New Query Tab
```

ou utilize o botão de criação de uma nova aba SQL.

Essa será a área onde o script da Sprint será desenvolvido.

---

## Passo 3 — Abrir o arquivo modelo `SPRINT2-5.sql`

Utilize o arquivo `SPRINT2-5.sql` fornecido na pasta da equipe como estrutura inicial.

---

# 3. Criando o banco de dados

Todo projeto deverá possuir um banco de dados próprio.

## Código utilizado no seu projeto

```sql
CREATE DATABASE IF NOT EXISTS db_salao_beleza;

USE db_salao_beleza;
```

## Nome definitivo do banco

```text
db_salao_beleza
```

---

# 4. Tipos de dados

Escolha tipos coerentes com as informações armazenadas:

- `INT` para chaves primárias e estrangeiras com `AUTO_INCREMENT`;
- `VARCHAR(100)` para nomes e descrições curtas;
- `VARCHAR(14)` para CPF formatado (`000.000.000-00`);
- `VARCHAR(20)` para contatos telefônicos e status;
- `DECIMAL(10,2)` para valores monetários de serviços;
- `DATETIME` para registro de data e horário dos agendamentos.

---

# 5. Criando as tabelas

Com base na Sprint 1/5, implemente as tabelas do banco.

Para esta atividade, o projeto possui **4 tabelas relacionadas**:

## Tabelas planejadas

| Nº | Nome da tabela | Finalidade |
|---:|---|---|
| 1 | `cliente` | Armazena dados cadastrais e de contato dos clientes do salão |
| 2 | `profissional` | Registra os colaboradores do salão e suas especialidades |
| 3 | `servico` | Catálogo dos procedimentos disponíveis com duração e valor |
| 4 | `agendamento` | Gerencia os atendimentos marcados vinculando cliente, profissional e serviço |

---

# 6. Ordem de criação das tabelas

A ordem de criação é importante quando existem `FOREIGN KEY`.

Regra prática adotada:

```text
1. criar primeiro as tabelas independentes;
2. depois criar as tabelas que possuem chaves estrangeiras.
```

## Ordem definida para o seu projeto

1. `cliente` (independente)
2. `profissional` (independente)
3. `servico` (independente)
4. `agendamento` (dependente — referencia `cliente`, `profissional` e `servico`)

---

# 7. PRIMARY KEY

Cada tabela deverá possuir uma chave primária adequada.

## Chaves primárias implementadas

| Tabela | Chave primária | Utiliza `AUTO_INCREMENT`? |
|---|---|---|
| `cliente` | `id_cliente` | Sim |
| `profissional` | `id_profissional` | Sim |
| `servico` | `id_servico` | Sim |
| `agendamento` | `id_agendamento` | Sim |

---

# 8. NOT NULL

Utilize `NOT NULL` quando a informação for obrigatória.

## Campos obrigatórios implementados

| Tabela | Campo | Por que é obrigatório? |
|---|---|---|
| `cliente` | `nome`, `cpf`, `telefone` | O salão necessita identificar o cliente e manter canal de contato |
| `profissional` | `nome`, `especialidade`, `telefone` | Dados obrigatórios para alocação na agenda de serviços |
| `servico` | `nome_servico`, `duracao_minutos`, `preco` | O catálogo não pode ter serviços sem nome, tempo ou preço |
| `agendamento` | `id_cliente`, `id_profissional`, `id_servico`, `data_hora`, `status` | Todos os vínculos e o horário são estritamente necessários para o atendimento |

---

# 9. UNIQUE

Utilize `UNIQUE` quando um valor não puder se repetir.

## Restrições `UNIQUE` implementadas

| Tabela | Campo | Por que não pode se repetir? |
|---|---|---|
| `cliente` | `cpf` | Cada cliente possui um CPF único, evitando cadastros duplicados |

---

# 10. DEFAULT

Utilize `DEFAULT` quando existir um valor padrão coerente.

## Valores padrão utilizados

| Tabela | Campo | DEFAULT | Justificativa |
|---|---|---|---|
| `agendamento` | `status` | `'Agendado'` | Todo novo agendamento deve iniciar automaticamente com status 'Agendado' |

---

# 11. FOREIGN KEY

As chaves estrangeiras representam relacionamentos entre tabelas.

## Chaves estrangeiras implementadas

| Tabela | Campo FK | Referencia | Relacionamento |
|---|---|---|---|
| `agendamento` | `id_cliente` | `cliente(id_cliente)` | 1:N — Um cliente realiza vários agendamentos |
| `agendamento` | `id_profissional` | `profissional(id_profissional)` | 1:N — Um profissional atende vários agendamentos |
| `agendamento` | `id_servico` | `servico(id_servico)` | 1:N — Um serviço é prestado em vários agendamentos |

---

# 12. Relacionamento N:N

Caso exista um relacionamento muitos-para-muitos (`N:N`), normalmente será necessária uma tabela associativa.

## Seu banco possui relacionamento N:N?

- [ ] Sim
- [x] Não

Justificativa:

> O modelo foi simplificado para associar diretamente o serviço contratado em cada registro de agendamento (1:N), eliminando tabelas associativas e facilitando a integridade dos dados e as consultas SQL nas próximas Sprints.

---

# 13. ALTER TABLE

Nesta Sprint, execute pelo menos **uma alteração estrutural utilizando `ALTER TABLE`**.

## ALTER TABLE utilizado no projeto

```sql
ALTER TABLE agendamento
ADD COLUMN observacoes VARCHAR(255);
```

### Explique a alteração

> Foi adicionada a coluna `observacoes` na tabela `agendamento` para permitir registrar preferências ou instruções adicionais do cliente durante o atendimento.

---

# 14. DROP TABLE — exercício controlado

`DROP TABLE` remove a tabela e sua estrutura.

## Código executado

```sql
CREATE TABLE tabela_teste_exclusao (
    id_teste INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50)
);

DROP TABLE tabela_teste_exclusao;
```

## Explique a diferença

Qual é a diferença entre `DELETE FROM tabela;` e `DROP TABLE tabela;`?

> - `DELETE FROM tabela;` é um comando de manipulação de dados (DML). Ele apaga apenas as linhas (registros) da tabela, mantendo sua estrutura intacta para futuras inserções.
> - `DROP TABLE tabela;` é um comando de definição de dados (DDL). Ele apaga tanto os dados quanto toda a estrutura da tabela do banco de dados, removendo-a permanentemente do schema.

---

# 15. Estrutura executada

O script executado no MySQL Workbench segue a estrutura completa do arquivo `SPRINT2-5.sql` presente na pasta da equipe.

---

# 16. Validações realizadas

## Comandos executados

```sql
DESCRIBE cliente;
DESCRIBE profissional;
DESCRIBE servico;
DESCRIBE agendamento;
```

## Validações realizadas

| Tabela | `DESCRIBE` executado? | Estrutura correta? |
|---|---|---|
| `cliente` | Sim | Sim, colunas, tipos e restrições validados |
| `profissional` | Sim | Sim, campos e tipos validados |
| `servico` | Sim | Sim, campos e preços decimais validados |
| `agendamento` | Sim | Sim, campos, DEFAULT e FKs validadas |

---

# 17. Registro de problemas encontrados

| Problema | Causa identificada | Como foi resolvido |
|---|---|---|
| *(Nenhum)* | *(Nenhuma)* | A execução em ordem correta (tabelas pai antes da tabela filha) impediu conflitos de chave estrangeira. |

> Nenhum problema identificado após a execução final.

---

# 18. Script final

O código completo, formatado e comentado está salvo no arquivo:

```text
teams/Teams-UNEMAT/team-03/SPRINT2-5.sql
```

---

# 19. Checklist técnico da Sprint 2/5

Antes de finalizar:

- [x] utilizei como base a `SPRINT1-5.md`;
- [x] criei um banco de dados;
- [x] utilizei `USE`;
- [x] criei pelo menos 4 tabelas relacionadas;
- [x] todas as tabelas possuem chave primária;
- [x] utilizei tipos de dados coerentes;
- [x] apliquei `NOT NULL` quando necessário;
- [x] apliquei `UNIQUE` quando necessário;
- [x] apliquei `DEFAULT` quando necessário;
- [x] implementei as chaves estrangeiras necessárias;
- [x] respeitei a ordem de criação das tabelas;
- [x] tratei corretamente relacionamentos N:N, caso existam;
- [x] executei pelo menos um `ALTER TABLE`;
- [x] pratiquei `DROP TABLE` em tabela temporária;
- [x] executei `DESCRIBE` nas tabelas;
- [x] verifiquei as tabelas no painel Schemas;
- [x] corrigi erros de execução;
- [x] organizei o script final;
- [x] salvei o script como `SPRINT2-5.sql`;
- [x] preenchi completamente este `SPRINT2-5.md`.

---

# 20. Regras de Git/GitHub

A atividade é **individual / por equipe**.

Continue utilizando a mesma branch:

```text
team-03-sprints-1-5
```

## Arquivos no commit da Sprint 2/5

```text
SPRINT2-5.md
SPRINT2-5.sql
```

Mensagem sugerida:

```text
Conclui Sprint 2 de 5 - estrutura DDL
```

> **Não abrir o Pull Request final hoje.** O PR só será aberto na Sprint 5/5.
