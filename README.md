# 🗄️ Banco de Dados — Loja Byte

Projeto de banco de dados desenvolvido durante meus estudos de desenvolvimento Full Stack, com foco na prática de **SQL e modelagem de bancos de dados relacionais**.

O projeto consiste na criação de uma estrutura de banco de dados para uma loja fictícia chamada **Loja Byte**, contemplando clientes, produtos, pedidos e itens de pedidos.

## 📂 Estrutura do Banco de Dados

O banco de dados é composto por quatro tabelas principais:

### 1. Clientes (`clientes`)

Armazena as informações dos clientes cadastrados.

| Campo | Tipo | Descrição |
|---|---|---|
| `id` | INT | Identificador único do cliente |
| `nome` | VARCHAR(100) | Nome do cliente |
| `email` | VARCHAR(300) | E-mail do cliente |
| `estado` | CHAR(2) | Unidade federativa |

### 2. Produtos (`produtos`)

Armazena os produtos disponíveis na loja.

| Campo | Tipo | Descrição |
|---|---|---|
| `id_produto` | INT | Identificador do produto |
| `nomeproduto` | VARCHAR(100) | Nome do produto |
| `valor` | VARCHAR(10000) | Valor cadastrado |

### 3. Pedidos (`pedidos`)

Registra os pedidos realizados e sua relação com os clientes.

| Campo | Tipo | Descrição |
|---|---|---|
| `id_pedido` | INT | Identificador do pedido |
| `cliente_id` | INT | Referência ao cliente |
| `pedido` | VARCHAR(1000) | Descrição do pedido |
| `data_pedido` | DATE | Data da realização |
| `valorpedido` | VARCHAR(10000) | Valor total do pedido |

### 4. Itens do Pedido (`itens_pedido`)

Armazena os produtos associados aos pedidos.

| Campo | Tipo | Descrição |
|---|---|---|
| `nomeitem` | VARCHAR(1000) | Nome do item |
| `valoritem` | VARCHAR(10000) | Valor do item |
| `pedido_id` | INT | Referência ao pedido |
| `produto_id` | INT | Referência ao produto |

## 🔗 Relacionamentos

O projeto utiliza chaves primárias e estrangeiras para estabelecer relacionamentos entre as tabelas.

- **Clientes → Pedidos:** um cliente pode estar associado a vários pedidos.
- **Pedidos → Itens do Pedido:** um pedido pode possuir vários itens.
- **Produtos → Itens do Pedido:** um produto pode aparecer em diferentes pedidos.

Esses relacionamentos são estabelecidos por meio de `FOREIGN KEY`, garantindo referências entre os registros.

## 🛠️ Conceitos e comandos SQL praticados

### Criação e estruturação
- `CREATE DATABASE`
- `USE`
- `CREATE TABLE`
- `ALTER TABLE`
- `ADD COLUMN`

### Relacionamentos
- `PRIMARY KEY`
- `FOREIGN KEY`
- `AUTO_INCREMENT`
- `CONSTRAINT`

### Manipulação de dados
- `INSERT INTO`
- `VALUES`

### Administração
- `DROP TABLE`
- `COMMIT`

## 🚀 Como executar

### 1. Requisitos

- MySQL Server;
- MySQL Workbench ou outro cliente SQL;
- Arquivo `index.sql`.

### 2. Clone o repositório

```bash
git clone URL_DO_REPOSITORIO
```

### 3. Execute o script

Abra o arquivo `index.sql` no MySQL Workbench e execute os comandos para criar e manipular o banco de dados.

O banco será identificado como:

```sql
CREATE DATABASE loja_byte;
USE loja_byte;
```

**Observação:** o script representa um exercício em desenvolvimento. Antes de executar integralmente, é necessário corrigir alguns problemas de sintaxe e integridade referencial.

## 📚 Objetivos de aprendizagem

- Compreender a estrutura de bancos relacionais;
- Criar tabelas e definir seus campos;
- Trabalhar com chaves primárias e estrangeiras;
- Construir relacionamentos entre tabelas;
- Inserir registros em diferentes estruturas;
- Alterar a estrutura de tabelas existentes;
- Praticar comandos de administração de banco de dados;
- Entender a organização de dados em um sistema comercial.

## 👨‍💻 Autor

**Kayo Julian**

- GitHub: [@kayolindo58](https://github.com/kayolindo58)
- Formação: Curso Full Stack — Coude

---

*Projeto educacional desenvolvido durante meus estudos de SQL e desenvolvimento Full Stack.*
