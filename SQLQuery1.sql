create database lojaXYZ;

use lojaXYZ;

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

select*from ProdutosDetalhes;

-- Inserir os dados na tabela
INSERT INTO ProdutosDetalhes (ProdutoID, NomeProduto, Categoria, FornecedorID, NomeFornecedor, TelefoneFornecedor, Preco)
VALUES
(1, 'Caneta Azul', 'Papelaria', 101, 'Fornecedora ABC', '(11) 99999-9999', 2.50),
(2, 'Caneta Vermelha', 'Papelaria', 101, 'Fornecedora ABC', '(11) 99999-9999', 2.50),
(3, 'Caderno A4', 'Papelaria', 102, 'Fornecedora XYZ', '(21) 88888-8888', 15.00),
(4, 'Calculadora', 'Eletrônicos', 103, 'Fornecedora DEF', '(31) 77777-7777', 45.00),
(5, 'Mouse Sem Fio', 'Eletrônicos', 103, 'Fornecedora DEF', '(31) 77777-7777', 75.00);