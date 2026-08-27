# Sistema de Gestão de Eventos — SQL Server

Projeto de estudo em SQL Server focado em modelagem de dados, T-SQL e boas práticas de banco de dados relacional. Desenvolvido a partir de requisitos de negócio, sem soluções prontas — toda a modelagem, estruturas e lógica foram pensadas e implementadas do zero.

## Contexto

Uma empresa organiza eventos (workshops, conferências, palestras) e precisa controlar inscrições, participantes, palestrantes e salas.

## Modelagem

O modelo é composto por 7 tabelas:

| Tabela | Descrição |
|---|---|
| `Pessoa` | Dados base (nome, telemóvel, email) compartilhados entre participantes e palestrantes |
| `Participante` | Extensão de Pessoa, com dados próprios (empresa) |
| `Palestrante` | Extensão de Pessoa, com dados próprios (especialização) |
| `Sala` | Nome e capacidade da sala |
| `Evento` | Título, descrição, datas, capacidade máxima, sala associada |
| `Evento_Palestra` | Tabela associativa (N:N) entre Evento e Palestrante |
| `Inscricao` | Inscrição de um participante num evento, com data e status |

### Decisões de design

- **Pessoa como entidade raiz**: como uma mesma pessoa pode ser participante em um evento e palestrante em outro, unificar os dados pessoais numa única tabela evita duplicação e inconsistência.
- **Tabela associativa para N:N**: a relação entre Evento e Palestrante é muitos-para-muitos, resolvida com a tabela `Evento_Palestra`.
- **Sem redundância de dados**: nenhum campo de `Pessoa` é repetido em `Participante` ou `Palestrante` — o acesso é feito via `JOIN`.

## Stack

- SQL Server / T-SQL
- DDL, DML
- Stored Procedures, Triggers, Functions
- Views, CTEs, Window Functions

## Estrutura do repositório

```
├── README.md
├── diagrama/          # Diagrama ER do modelo
├── ddl/               # Scripts de criação das tabelas
├── dml/               # Scripts de carga de dados de exemplo
├── procedures/        # Stored procedures
├── triggers/          # Triggers
├── functions/         # Functions
└── queries/           # Consultas e views
```

## Regras de negócio implementadas

- Não é possível inscrever mais participantes que a capacidade da sala
- Um participante não pode estar em dois eventos no mesmo horário
- Palestrantes não pagam inscrição
- Cada evento precisa de pelo menos 1 palestrante

## Status do projeto

- [x] Modelagem de dados (entidades, relacionamentos, chaves)
- [ ] Scripts DDL (criação das tabelas)
- [ ] Scripts DML (dados de exemplo)
- [ ] Procedures e triggers
- [ ] Consultas e views
- [ ] Otimização (índices)

