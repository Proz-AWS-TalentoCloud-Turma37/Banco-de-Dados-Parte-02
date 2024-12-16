
![Logo](https://github.com/analianai/Banco-de-Dados-Parte-01/blob/main/hd-header.png?raw=true)

# Normalização de Dados em Banco de Dados

<details>
<summary>1 - O que é Normalização em Banco de Dados?</summary>

   ## Introdução

A **normalização de dados** é um processo utilizado no design de bancos de dados para organizar os dados de forma eficiente, reduzindo a redundância e melhorando a integridade dos dados. Este processo envolve a divisão de tabelas grandes e complexas em tabelas menores e o estabelecimento de relacionamentos entre elas.

## Objetivos da Normalização

1. **Eliminar Redundâncias**: Reduzir dados duplicados no banco de dados.
2. **Garantir Consistência**: Minimizar anomalias de inserção, atualização e exclusão.
3. **Melhorar a Integridade dos Dados**: Garantir que os dados estejam estruturados corretamente.
4. **Facilitar a Manutenção**: Tornar o banco de dados mais flexível e fácil de gerenciar.

## Formas Normais

A normalização é realizada em etapas chamadas de **Formas Normais (FN)**. Abaixo estão as principais formas normais e seus critérios:

### 1ª Forma Normal (1FN)
- Garantir que todos os valores sejam **atômicos** (não divisíveis).
- Remover grupos repetidos de dados.
- Criar uma chave primária única para identificar cada registro.

**Exemplo:**
Uma tabela não normalizada:

| ID Cliente | Nome Cliente | Telefones       |
|------------|--------------|-----------------|
| 1          | João Silva   | 12345, 67890    |
| 2          | Maria Souza  | 98765, 43210    |

Após normalização para 1FN:

| ID Cliente | Nome Cliente | Telefone |
|------------|--------------|----------|
| 1          | João Silva   | 12345    |
| 1          | João Silva   | 67890    |
| 2          | Maria Souza  | 98765    |
| 2          | Maria Souza  | 43210    |

---

### 2ª Forma Normal (2FN)
- Estar na 1FN.
- Garantir que todos os atributos não primários dependam **totalmente** da chave primária.

**Problema Resolvido:**
Dependências parciais em tabelas com chaves compostas.

---

### 3ª Forma Normal (3FN)
- Estar na 2FN.
- Garantir que nenhum atributo não chave dependa de outro atributo não chave (remover dependências transitivas).

**Exemplo:**
Uma tabela na 2FN:

| ID Produto | Nome Produto | ID Categoria | Nome Categoria |
|------------|--------------|--------------|----------------|
| 1          | Caneta       | 10           | Papelaria      |
| 2          | Borracha     | 10           | Papelaria      |

Após normalização para 3FN:

**Tabela Produto:**
| ID Produto | Nome Produto | ID Categoria |
|------------|--------------|--------------|
| 1          | Caneta       | 10           |
| 2          | Borracha     | 10           |

**Tabela Categoria:**
| ID Categoria | Nome Categoria |
|--------------|----------------|
| 10           | Papelaria      |

---

## Outras Formas Normais

- **Forma Normal de Boyce-Codd (FNBC)**: Trata anomalias não resolvidas pela 3FN, garantindo que cada dependência funcional seja uma dependência de chave.
- **4ª e 5ª Formas Normais**: Lidam com dependências multivaloradas e junções complexas, respectivamente. São mais raramente utilizadas em projetos convencionais.

---

## Benefícios da Normalização

- **Redução de Redundância**: Dados duplicados são minimizados.
- **Melhoria da Consistência**: Menos erros e inconsistências.
- **Facilidade de Expansão**: Estrutura mais flexível para alterações futuras.
- **Eficiência no Armazenamento**: Uso otimizado de espaço em disco.

## Desvantagens da Normalização

- **Complexidade Aumentada**: A estrutura do banco de dados pode se tornar mais complexa.
- **Desempenho de Consulta**: Pode haver perda de desempenho em consultas devido ao aumento do número de junções entre tabelas.

---

## Quando Normalizar?

- **Normalizar**: Quando a integridade dos dados e a redução de redundâncias são mais importantes do que o desempenho.
- **Não Normalizar (ou Desnormalizar)**: Quando o desempenho é mais crítico, como em sistemas de relatórios ou bancos de dados OLAP.

---

## Exemplos Práticos

Veja exemplos detalhados de normalização em [exemplos.md](./exemplos.md).

---

## Recursos Adicionais

- [Artigo da Wikipedia sobre Normalização](https://pt.wikipedia.org/wiki/Normaliza%C3%A7%C3%A3o_de_banco_de_dados)
- [Documentação do PostgreSQL](https://www.postgresql.org/docs/)
- [Curso sobre Normalização no YouTube](https://www.youtube.com/)

---

## Contribuições

Sinta-se à vontade para contribuir com este repositório! Sugestões, correções e exemplos adicionais são bem-vindos. Faça um **fork** e envie seu **pull request**.

---
</details>

<details>
<summary> Atividade Prática: Normalização de Dados em Banco de Dados</summary>

Você foi contratado para organizar os dados de uma loja fictícia chamada **Loja XYZ**. Atualmente, as informações dos produtos, categorias e fornecedores estão armazenadas de forma desorganizada em uma única tabela. Sua tarefa é aplicar as regras de normalização e reorganizar os dados em tabelas normalizadas.

---

## Tabela Inicial (Não Normalizada)

Abaixo está a tabela inicial, onde todas as informações estão misturadas e contém redundâncias:

| Produto ID | Nome Produto      | Categoria     | Fornecedor ID | Nome Fornecedor  | Telefone Fornecedor | Preço   |
|------------|-------------------|---------------|---------------|------------------|---------------------|---------|
| 1          | Caneta Azul       | Papelaria     | 101           | Fornecedora ABC  | (11) 99999-9999     | 2.50    |
| 2          | Caneta Vermelha   | Papelaria     | 101           | Fornecedora ABC  | (11) 99999-9999     | 2.50    |
| 3          | Caderno A4        | Papelaria     | 102           | Fornecedora XYZ  | (21) 88888-8888     | 15.00   |
| 4          | Calculadora       | Eletrônicos   | 103           | Fornecedora DEF  | (31) 77777-7777     | 45.00   |
| 5          | Mouse Sem Fio     | Eletrônicos   | 103           | Fornecedora DEF  | (31) 77777-7777     | 75.00   |

---

## Instruções

1. **Analisar a tabela inicial**:
   - Identifique os problemas de redundância de dados.
   - Observe quais informações podem ser separadas em diferentes tabelas.

2. **Aplicar a 1ª Forma Normal (1FN)**:
   - Garanta que todos os campos contenham apenas valores atômicos (não divisíveis).
   - Remova repetições de dados.

3. **Aplicar a 2ª Forma Normal (2FN)**:
   - Separe os dados em tabelas menores, garantindo que todos os atributos dependam totalmente da chave primária.

4. **Aplicar a 3ª Forma Normal (3FN)**:
   - Elimine dependências transitivas (quando um atributo não chave depende de outro atributo não chave).

---

## Resolução Esperada

### Passo 1: Após aplicar a 1ª Forma Normal (1FN)

Crie tabelas separadas para **Produtos**, **Categorias** e **Fornecedores**:

**Tabela Produtos:**

| Produto ID | Nome Produto      | Categoria ID | Fornecedor ID | Preço   |
|------------|-------------------|--------------|---------------|---------|
| 1          | Caneta Azul       | 1            | 101           | 2.50    |
| 2          | Caneta Vermelha   | 1            | 101           | 2.50    |
| 3          | Caderno A4        | 1            | 102           | 15.00   |
| 4          | Calculadora       | 2            | 103           | 45.00   |
| 5          | Mouse Sem Fio     | 2            | 103           | 75.00   |

**Tabela Categorias:**

| Categoria ID | Nome Categoria |
|--------------|----------------|
| 1            | Papelaria      |
| 2            | Eletrônicos    |

**Tabela Fornecedores:**

| Fornecedor ID | Nome Fornecedor  | Telefone Fornecedor |
|---------------|------------------|---------------------|
| 101           | Fornecedora ABC  | (11) 99999-9999     |
| 102           | Fornecedora XYZ  | (21) 88888-8888     |
| 103           | Fornecedora DEF  | (31) 77777-7777     |

---

### Passo 2: Após aplicar a 2ª Forma Normal (2FN)

Já realizado no passo anterior, as dependências parciais foram eliminadas ao separar categorias e fornecedores.

---

### Passo 3: Após aplicar a 3ª Forma Normal (3FN)

A tabela já está na 3FN, pois:
- Não há dependências transitivas.
- Cada atributo não chave depende exclusivamente da chave primária.

---

## Tarefa Final

1. Reorganize as tabelas acima em um banco de dados relacional.
2. Crie os relacionamentos entre as tabelas usando **chaves primárias** e **chaves estrangeiras**.
3. Teste as tabelas com alguns exemplos de inserção, atualização e exclusão para garantir que as redundâncias foram eliminadas e os dados estão consistentes.

---

## Conclusão

Esta atividade demonstra como a normalização melhora a estrutura de um banco de dados, reduzindo redundâncias e facilitando a manutenção. Certifique-se de revisar as formas normais e aplicar as regras corretamente para organizar os dados da melhor forma possível.

</details>

 <details>
<summary>Resolução da Atividade: Normalização de Dados em SQL Server </summary>

## Tabela não Normalizada 

````sql
-- Criar a tabela
CREATE TABLE ProdutosDetalhes (
    ProdutoID INT PRIMARY KEY,
    NomeProduto NVARCHAR(50) NOT NULL,
    Categoria NVARCHAR(50) NOT NULL,
    FornecedorID INT NOT NULL,
    NomeFornecedor NVARCHAR(50) NOT NULL,
    TelefoneFornecedor NVARCHAR(15) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

-- Inserir os dados na tabela
INSERT INTO ProdutosDetalhes (ProdutoID, NomeProduto, Categoria, FornecedorID, NomeFornecedor, TelefoneFornecedor, Preco)
VALUES
(1, 'Caneta Azul', 'Papelaria', 101, 'Fornecedora ABC', '(11) 99999-9999', 2.50),
(2, 'Caneta Vermelha', 'Papelaria', 101, 'Fornecedora ABC', '(11) 99999-9999', 2.50),
(3, 'Caderno A4', 'Papelaria', 102, 'Fornecedora XYZ', '(21) 88888-8888', 15.00),
(4, 'Calculadora', 'Eletrônicos', 103, 'Fornecedora DEF', '(31) 77777-7777', 45.00),
(5, 'Mouse Sem Fio', 'Eletrônicos', 103, 'Fornecedora DEF', '(31) 77777-7777', 75.00);

````

## Passo 1: Criar o Banco de Dados

Crie o banco de dados chamado **LojaXYZ** para armazenar os dados normalizados.

```sql
CREATE DATABASE LojaXYZ;
GO

USE LojaXYZ;
GO
````
## Passo 2: Criar Tabelas Normalizadas

2.1 Tabela Categorias
A tabela Categorias contém as informações sobre as categorias dos produtos. Cada categoria tem um identificador único (CategoriaID) e um nome (NomeCategoria).

````sql
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,
    NomeCategoria NVARCHAR(50) NOT NULL
);
````

2.2 Tabela Fornecedores
A tabela Fornecedores contém informações dos fornecedores, incluindo um identificador único (FornecedorID), nome do fornecedor (NomeFornecedor) e telefone (TelefoneFornecedor).

````sql
CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY,
    NomeFornecedor NVARCHAR(50) NOT NULL,
    TelefoneFornecedor NVARCHAR(15) NOT NULL
);
````

2.3 Tabela Produtos
A tabela Produtos contém as informações sobre os produtos, incluindo identificador único (ProdutoID), nome do produto (NomeProduto), identificador da categoria (CategoriaID), identificador do fornecedor (FornecedorID) e preço (Preco).

Chaves estrangeiras ligam a tabela Produtos às tabelas Categorias e Fornecedores.

````sql
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto NVARCHAR(50) NOT NULL,
    CategoriaID INT NOT NULL,
    FornecedorID INT NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);
````
## Passo 3: Inserir Dados nas Tabelas

3.1 Inserir Dados na Tabela Categorias
Adicione as categorias disponíveis.

````sql
INSERT INTO Categorias (CategoriaID, NomeCategoria)
VALUES
(1, 'Papelaria'),
(2, 'Eletrônicos');
````

3.2 Inserir Dados na Tabela Fornecedores
Adicione os fornecedores e seus contatos.

````sql
INSERT INTO Fornecedores (FornecedorID, NomeFornecedor, TelefoneFornecedor)
VALUES
(101, 'Fornecedora ABC', '(11) 99999-9999'),
(102, 'Fornecedora XYZ', '(21) 88888-8888'),
(103, 'Fornecedora DEF', '(31) 77777-7777');
````

3.3 Inserir Dados na Tabela Produtos
Adicione os produtos e relacione-os com suas categorias e fornecedores.

````sql
INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, FornecedorID, Preco)
VALUES
(1, 'Caneta Azul', 1, 101, 2.50),
(2, 'Caneta Vermelha', 1, 101, 2.50),
(3, 'Caderno A4', 1, 102, 15.00),
(4, 'Calculadora', 2, 103, 45.00),
(5, 'Mouse Sem Fio', 2, 103, 75.00);
````

Passo 4: Consultar os Dados
4.1 Produtos com Suas Categorias
Realize uma consulta para listar os produtos junto com suas respectivas categorias e preços.

````sql
SELECT p.NomeProduto, c.NomeCategoria, p.Preco
FROM Produtos p
JOIN Categorias c ON p.CategoriaID = c.CategoriaID;
````

4.2 Informações de Fornecedores e Produtos
Liste os fornecedores e os produtos que eles fornecem, com os preços.

````sql
SELECT f.NomeFornecedor, f.TelefoneFornecedor, p.NomeProduto, p.Preco
FROM Fornecedores f
JOIN Produtos p ON f.FornecedorID = p.FornecedorID;
````

4.3 Listar Produtos de uma Categoria Específica
Filtre os produtos de uma categoria específica, como "Papelaria".

````sql
SELECT p.NomeProduto, p.Preco
FROM Produtos p
JOIN Categorias c ON p.CategoriaID = c.CategoriaID
WHERE c.NomeCategoria = 'Papelaria';
````
## Estrutura Normalizada Final

### Tabela Produtos

| Produto ID | Nome Produto      | Categoria ID | Fornecedor ID | Preço   |
|------------|-------------------|--------------|---------------|---------|
| 1          | Caneta Azul       | 1            | 101           | 2.50    |
| 2          | Caneta Vermelha   | 1            | 101           | 2.50    |
| 3          | Caderno A4        | 1            | 102           | 15.00   |
| 4          | Calculadora       | 2            | 103           | 45.00   |
| 5          | Mouse Sem Fio     | 2            | 103           | 75.00   |

### Tabela Categorias

| Categoria ID | Nome Categoria |
|--------------|----------------|
| 1            | Papelaria      |
| 2            | Eletrônicos    |

### Tabela Fornecedores

| Fornecedor ID | Nome Fornecedor  | Telefone Fornecedor |
|---------------|------------------|---------------------|
| 101           | Fornecedora ABC  | (11) 99999-9999     |
| 102           | Fornecedora XYZ  | (21) 88888-8888     |
| 103           | Fornecedora DEF  | (31) 77777-7777     |


</details>
## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).


