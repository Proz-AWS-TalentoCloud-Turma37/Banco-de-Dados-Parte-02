drop table ProdutosDetalhes;

CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,
    NomeCategoria NVARCHAR(50) NOT NULL
);

CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY,
    NomeFornecedor NVARCHAR(50) NOT NULL,
    TelefoneFornecedor NVARCHAR(15) NOT NULL
);

CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    NomeProduto NVARCHAR(50) NOT NULL,
    CategoriaID INT NOT NULL,
    FornecedorID INT NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);

INSERT INTO Categorias (CategoriaID, NomeCategoria)
VALUES
(1, 'Papelaria'),
(2, 'Eletrônicos');

INSERT INTO Fornecedores (FornecedorID, NomeFornecedor, TelefoneFornecedor)
VALUES
(101, 'Fornecedora ABC', '(11) 99999-9999'),
(102, 'Fornecedora XYZ', '(21) 88888-8888'),
(103, 'Fornecedora DEF', '(31) 77777-7777');

INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, FornecedorID, Preco)
VALUES
(1, 'Caneta Azul', 1, 101, 2.50),
(2, 'Caneta Vermelha', 1, 101, 2.50),
(3, 'Caderno A4', 1, 102, 15.00),
(4, 'Calculadora', 2, 103, 45.00),
(5, 'Mouse Sem Fio', 2, 103, 75.00);

  --SELECT 
  --<TABELA>.<COLUNA>
  --FROM
  --<TABELA>
  --JOIN <TABELA ESTRANGEIRA> ON <TABELA>.<ID> = <TABELA ESTRANGEIRA>.<ID>

SELECT p.NomeProduto, c.NomeCategoria, p.Preco
FROM Produtos p
JOIN Categorias c ON p.CategoriaID = c.CategoriaID;

SELECT f.NomeFornecedor, f.TelefoneFornecedor, p.NomeProduto, p.Preco
FROM Fornecedores f
JOIN Produtos p ON f.FornecedorID = p.FornecedorID;


SELECT p.NomeProduto, p.Preco
FROM Produtos p
JOIN Categorias c ON p.CategoriaID = c.CategoriaID
WHERE c.NomeCategoria = 'Papelaria';

SELECT*FROM Produtos;
SELECT*FROM Categorias;
SELECT*FROM Fornecedores;

SELECT 
    Produtos.ProdutoID,
    Produtos.NomeProduto,
	Categorias.NomeCategoria,
    Fornecedores.FornecedorID,
    Fornecedores.NomeFornecedor,
    Fornecedores.TelefoneFornecedor,
    Produtos.Preco
FROM 
    Produtos
INNER JOIN 
    Categorias ON Produtos.CategoriaID = Categorias.CategoriaID
INNER JOIN 
    Fornecedores ON Produtos.FornecedorID = Fornecedores.FornecedorID;
