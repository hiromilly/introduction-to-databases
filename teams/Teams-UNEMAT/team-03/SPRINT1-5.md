# SPRINT 1/5 — Planejamento Inicial do Módulo

**Disciplina:** Laboratório de Banco de Dados  
**Data:** 31/08/2026  
**Equipe:** Team 01  
**Módulo:** Alunos  

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

- Nome completo:
- Nome completo:
- Nome completo:
- Nome completo:

---

## 2. Descrição do módulo

Escreva uma breve descrição explicando o papel do **Módulo de Alunos** dentro do sistema.

A descrição deve responder:

1. O que este módulo representa?
2. Quais informações principais serão armazenadas?
3. Para que essas informações serão utilizadas?
4. Com quais outros módulos ele poderá se relacionar?

### Exemplo de nível esperado

> O Módulo de Alunos será responsável por armazenar e organizar os dados acadêmicos básicos dos estudantes cadastrados no sistema. Esses dados poderão posteriormente ser utilizados por outros módulos, como matrículas, notas, frequência e biblioteca.

**Não copie o exemplo literalmente. Produza a descrição da própria equipe.**

### Descrição da equipe

> Escreva aqui.

---

## 3. Planejamento da tabela principal

A equipe deverá definir os atributos iniciais da tabela responsável por representar os alunos.

Preencha a tabela abaixo.

| Atributo | Tipo de dado previsto | Obrigatório? | Restrição prevista | Justificativa |
|---|---|---|---|---|
| `id_aluno` | `INT` | Sim | `PRIMARY KEY` | Identificador único do aluno |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |

A equipe deverá propor **pelo menos 5 atributos além do identificador principal**.

Alguns exemplos de atributos que podem ser considerados:

- nome;
- matrícula;
- e-mail;
- data de nascimento;
- data de ingresso;
- situação acadêmica.

A equipe não é obrigada a utilizar exatamente esses atributos.

---

## 4. Chave primária

Informe qual atributo será utilizado como chave primária da tabela.

**Atributo escolhido:**

`________________________________________`

### Justificativa

Explique por que esse atributo é adequado para identificar cada registro de forma única.

> Escreva aqui.

---

## 5. Restrições de integridade

Identifique quais restrições poderão ser necessárias.

| Atributo | Restrição prevista | Justificativa |
|---|---|---|
|  | `NOT NULL`, `UNIQUE`, etc. |  |
|  |  |  |
|  |  |  |
|  |  |  |

Durante a discussão, considere perguntas como:

- dois alunos podem possuir a mesma matrícula?
- dois alunos podem possuir o mesmo e-mail?
- o nome de um aluno pode ficar vazio?
- quais informações devem ser obrigatórias?
- quais dados precisam ser únicos?

---

## 6. Relacionamentos com outros módulos

Liste os módulos que poderão utilizar ou se relacionar com os dados de alunos.

| Módulo relacionado | Como poderá se relacionar com Alunos? |
|---|---|
| Matrículas | |
| Notas | |
| Frequência | |
| Biblioteca | |
| Outro, se necessário | |

> Nesta Sprint, não é necessário implementar `FOREIGN KEY`. O objetivo é apenas identificar possíveis relacionamentos.

---

## 7. Regras de negócio identificadas

Registre pelo menos **3 regras de negócio** que a equipe considera importantes para o módulo.

Exemplos de perguntas que podem ajudar:

- todo aluno deve possuir matrícula?
- uma matrícula pode se repetir?
- um aluno pode existir sem e-mail?
- o sistema deverá registrar a situação acadêmica do aluno?

### Regras da equipe

1. 
2. 
3. 

---

## 8. Dúvidas ou decisões pendentes

Registre aqui pontos que ainda precisam ser discutidos com o professor ou com outras equipes.

- 
- 
- 

Caso não existam dúvidas, escreva:

> Nenhuma dúvida pendente nesta Sprint.

---

## 9. Checklist da Sprint 1/5

Antes de finalizar a atividade de hoje, verifique se a equipe completou:

- [ ] identificação dos integrantes;
- [ ] descrição do módulo;
- [ ] definição da tabela principal;
- [ ] pelo menos 5 atributos além da chave primária;
- [ ] escolha e justificativa da chave primária;
- [ ] identificação das principais restrições;
- [ ] identificação dos relacionamentos com outros módulos;
- [ ] definição de pelo menos 3 regras de negócio;
- [ ] registro de dúvidas ou decisões pendentes;
- [ ] revisão do arquivo antes do commit.

---

## 10. Regras de versionamento e entrega no GitHub

A equipe deverá utilizar o fluxo de trabalho com **branch, commit e Pull Request (PR)** durante toda a semana.

A Sprint 1/5 é apenas a primeira etapa. Os arquivos `SPRINT2-5.md`, `SPRINT3-5.md`, `SPRINT4-5.md` e `SPRINT5-5.md` serão adicionados progressivamente à **mesma branch de trabalho da equipe**, e o Pull Request final será aberto na sexta-feira.

### 10.1 Branch

A equipe **não deverá desenvolver diretamente na branch `main`**.

Crie uma branch específica para o trabalho da equipe durante a semana.

Para o Team 01, utilize:

```text
team-01-sprints-1-5
```

O fluxo esperado é:

```text
main
  └── team-01-sprints-1-5
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
Team 01 - conclui Sprint 1 de 5
```

Nas próximas etapas, utilize o mesmo padrão:

```text
Team 01 - conclui Sprint 2 de 5
Team 01 - conclui Sprint 3 de 5
Team 01 - conclui Sprint 4 de 5
Team 01 - conclui Sprint 5 de 5
```

Antes do commit, confira se o arquivo está na pasta correta:

```text
teams/Teams-UNEMAT/team-01/
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
teams/Teams-UNEMAT/team-01/
├── SPRINT1-5.md
├── SPRINT2-5.md
├── SPRINT3-5.md
├── SPRINT4-5.md
└── SPRINT5-5.md
```

O Pull Request deverá utilizar:

**Branch de origem:**

```text
team-01-sprints-1-5
```

**Branch de destino:**

```text
main
```

Título sugerido para o PR:

```text
[N1][Team 01] Sprints 1-5 - Módulo de Alunos
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

> **Atenção:** o arquivo de workflow atualmente presente no repositório ainda utiliza o padrão antigo `teams/team-*.md`. A estrutura adotada nesta atividade é `teams/Teams-UNEMAT/team-01/SPRINT1-5.md`; portanto, o professor atualizará o workflow para reconhecer a nova organização das Sprints antes da entrega final.

---

## 11. Entrega da Sprint 1/5

O arquivo desta etapa deverá ser salvo com o nome:

```text
SPRINT1-5.md
```

e permanecer dentro da pasta da equipe:

```text
teams/Teams-UNEMAT/team-01/SPRINT1-5.md
```

Ao finalizar a atividade de hoje:

1. revise todas as respostas;
2. confirme que o arquivo está na pasta correta;
3. confirme que está trabalhando na branch `team-01-sprints-1-5`;
4. faça o commit da Sprint 1/5;
5. envie a atualização para a branch da equipe;
6. **não abra ainda o PR final**.

### Checklist Git/GitHub de hoje

- [ ] Estou trabalhando na branch `team-01-sprints-1-5`;
- [ ] não alterei diretamente a `main`;
- [ ] editei apenas os arquivos da minha equipe;
- [ ] o arquivo se chama `SPRINT1-5.md`;
- [ ] o arquivo está em `teams/Teams-UNEMAT/team-01/`;
- [ ] revisei o conteúdo antes de salvar;
- [ ] realizei o commit da Sprint 1/5;
- [ ] enviei o commit para a branch da equipe;
- [ ] não abri o PR final antes da Sprint 5/5.

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
