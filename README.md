# 🗄️ Banco de Dados SQL — Loja Byte

Projeto desenvolvido durante meus estudos de **Desenvolvimento Full Stack na Coude**, com foco em modelagem de bancos de dados relacionais, manipulação de registros e construção de consultas SQL.

O projeto simula a estrutura de um sistema comercial para uma loja fictícia chamada **Loja Byte**, permitindo organizar clientes, produtos, pedidos e itens vendidos.

## 📂 Estrutura do Banco de Dados

O banco de dados `loja_byte` é composto por quatro tabelas principais:

### 1. Clientes (`clientes`)

Armazena os dados dos clientes cadastrados.

| Campo | Tipo | Descrição |
|---|---|---|
| `id_cliente` | INT | Identificador único |
| `nome` | VARCHAR(200) | Nome do cliente |
| `estado` | CHAR(2) | Estado do cliente |

### 2. Produtos (`produtos`)

Armazena os produtos disponíveis na loja, seus preços e quantidades em estoque.

| Campo | Tipo | Descrição |
|---|---|---|
| `id_produto` | INT | Identificador do produto |
| `nomeproduto` | VARCHAR(300) | Nome do produto |
| `valorproduto` | DECIMAL(10,2) | Preço do produto |
| `estoque` | INT | Quantidade disponível |

### 3. Pedidos (`pedidos`)

Registra os pedidos realizados pelos clientes.

| Campo | Tipo | Descrição |
|---|---|---|
| `id_pedido` | INT | Identificador do pedido |
| `data_pedido` | DATETIME | Data e hora do pedido |
| `valor_total` | DECIMAL(10,2) | Valor total |
| `id_cliente` | INT | Referência ao cliente |

### 4. Itens do Pedido (`itens_pedido`)

Relaciona os produtos aos pedidos realizados.

| Campo | Tipo | Descrição |
|---|---|---|
| `id_item` | INT | Identificador do item |
| `id_pedido` | INT | Referência ao pedido |
| `id_produto` | INT | Referência ao produto |
| `quantidade` | INT | Quantidade comprada |
| `preco_unitario` | DECIMAL(10,2) | Preço unitário na compra |

## 🔗 Relacionamentos

O banco utiliza chaves primárias e estrangeiras para garantir a relação entre os registros.

- **Clientes → Pedidos:** um cliente pode realizar vários pedidos.
- **Pedidos → Itens do Pedido:** um pedido pode conter vários itens.
- **Produtos → Itens do Pedido:** um produto pode estar presente em diferentes pedidos.

As relações são estabelecidas utilizando `PRIMARY KEY`, `FOREIGN KEY` e `CONSTRAINT`.

## 📚 Conteúdo desenvolvido

O arquivo SQL está organizado em etapas práticas de aprendizado.

### Campo 1 — Criação do banco de dados

- Criação do banco `loja_byte`;
- Criação das quatro tabelas;
- Definição de chaves primárias;
- Configuração de chaves estrangeiras;
- Inserção de clientes, produtos, pedidos e itens.

### Campo 2 — Inserção de registros

Prática de inserção de novos clientes e produtos utilizando:

- `INSERT INTO`;
- `VALUES`;
- Inserção de registros com identificadores específicos.

### Campo 3 — Consultas e relacionamentos

Utilização de diferentes tipos de JOIN para consultar informações relacionadas.

- `INNER JOIN`;
- `LEFT JOIN`;
- `RIGHT JOIN`;
- Filtragem de registros com `WHERE`;
- Identificação de registros sem correspondência.

### Campo 4 — Funções de agregação

Consultas para obter informações estatísticas do banco:

- `COUNT()` — contagem de registros;
- `SUM()` — soma de valores;
- `AVG()` — cálculo de médias;
- `MIN()` — identificação do menor valor;
- `MAX()` — identificação do maior valor;
- `DISTINCT` — eliminação de duplicidades;
- `GROUP BY` — agrupamento de resultados.

### Campo 5 — Relatórios por estado

Consulta que calcula o faturamento total e a quantidade de itens vendidos, agrupando os resultados pelo estado dos clientes.

Utiliza:
- `INNER JOIN`;
- `SUM()`;
- `GROUP BY`;
- `ORDER BY`.

### Campo 6 — Filtragem e condições de agrupamento

Consulta de faturamento considerando pedidos realizados após uma data específica.

Conceitos praticados:
- `WHERE`;
- `HAVING`;
- `GROUP BY`;
- `ORDER BY`;
- Funções de agregação.

### Campo 7 — Atualização de registros

Prática de inserção e atualização de produtos utilizando:

- `INSERT INTO`;
- `UPDATE`;
- `SET`;
- `WHERE`.

### Campo 8 — Exclusão de registros

Utilização de consultas para identificar clientes sem pedidos e exclusão de registros com:

- `LEFT JOIN`;
- `IS NULL`;
- `DELETE FROM`;
- `WHERE`.

### Campo 9 — Alteração de informações

Atualização do estado de um cliente cadastrado utilizando `UPDATE`.

## 🛠️ Tecnologias e conceitos utilizados

- **MySQL** — sistema de gerenciamento de banco de dados.
- **SQL** — linguagem de consulta e manipulação de dados.
- **MySQL Workbench** — ambiente para execução e gerenciamento de consultas.

**Principais comandos e recursos praticados:**

`CREATE DATABASE` · `CREATE TABLE` · `INSERT INTO` · `SELECT` · `UPDATE` · `DELETE` · `ALTER TABLE` · `INNER JOIN` · `LEFT JOIN` · `RIGHT JOIN` · `GROUP BY` · `HAVING` · `ORDER BY` · `COUNT` · `SUM` · `AVG` · `MIN` · `MAX`.

## 🚀 Como executar

### 1. Requisitos

- MySQL Server instalado;
- MySQL Workbench ou outro cliente compatível;
- Arquivo `index.sql`.

### 2. Clone o repositório

```bash
git clone URL_DO_REPOSITORIO
```

### 3. Abra o projeto

Abra o arquivo `index.sql` no MySQL Workbench.

### 4. Execute o script

Execute os comandos para criar o banco de dados, gerar as tabelas, inserir os registros e realizar as consultas.

O banco será criado com:

```sql
CREATE DATABASE IF NOT EXISTS loja_byte;

USE loja_byte;
```

