
![Logo](https://github.com/analianai/Banco-de-Dados-Parte-01/blob/main/hd-header.png?raw=true)

# Normalização de Dados em Banco de Dados

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

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
