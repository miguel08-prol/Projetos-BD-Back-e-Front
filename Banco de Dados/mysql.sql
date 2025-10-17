CREATE DATABASE academia_techfit;

USE academia_techfit;

CREATE TABLE cadastro (
    Id_cadastro INT PRIMARY KEY,
    Senha_cadastro VARCHAR(255) NOT NULL,
    CPF_cliente VARCHAR(14) UNIQUE,
    Data_cadastro DATETIME
);

CREATE TABLE Vendas (
    Id_venda INT PRIMARY KEY,
    Comprador_venda INT,
    Venda_realizada DATETIME,
    Preco_total_venda DECIMAL(10, 2), 
    Quantidade_total_venda INT, 
    Codigo_venda VARCHAR(50) UNIQUE
);

CREATE TABLE Funcionario (
    Id_funcionario INT PRIMARY KEY,
    Idd_funcionario INT,
    Data_nascimento DATETIME,
    Cargo_funcionario VARCHAR(100),
    Salario_funcionario DECIMAL(10, 2),
    Id_cadastro INT,
    Id_venda INT, 
    FOREIGN KEY(Id_cadastro) REFERENCES cadastro (Id_cadastro),
    FOREIGN KEY(Id_venda) REFERENCES Vendas (Id_venda)
);

CREATE TABLE Fornecedor (
    Id_fornecedor INT PRIMARY KEY,
    Razao_social VARCHAR(255) NOT NULL,
    CNPJ VARCHAR(14) UNIQUE NOT NULL,
    Telefone VARCHAR(20),
    Status VARCHAR(20),
    Endereco VARCHAR(255),
    Cep VARCHAR(14)
);

CREATE TABLE Produto (
    Id_produto INT PRIMARY KEY,
    Nome_produto VARCHAR(255) NOT NULL,
    Categoris_produto VARCHAR(100),
    Data_cadastro DATETIME,
    Descricao VARCHAR(255),
    Preco_venda DECIMAL(10, 2) NOT NULL,
    Quantidade_estoquee INT
);

CREATE TABLE Clientes (
    Id_cliente INT PRIMARY KEY,
    Data_cadastro DATETIME,
    CPF_cliente VARCHAR(14) UNIQUE,
    Matricula_cliente VARCHAR(20) UNIQUE,
    Frequencia_cliente VARCHAR(50),
    Nome_cliente VARCHAR(255) NOT NULL,
    Idd_cliente INT,
    Id_cadastro INT,
    FOREIGN KEY(Id_cadastro) REFERENCES cadastro (Id_cadastro)
);

CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY,
    data_fornecimento DATETIME,
    cod_produto VARCHAR(50) UNIQUE, 
    qtd INT,
    nome_produto VARCHAR(100),
    descricao VARCHAR(255)
);



CREATE TABLE Fornece (
    Id_produto INT,
    Id_fornecedor INT,
    PRIMARY KEY (Id_produto, Id_fornecedor),
    FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto),
    FOREIGN KEY(Id_fornecedor) REFERENCES Fornecedor (Id_fornecedor)
);

CREATE TABLE Realiza (
    Id_venda INT,
    Id_produto INT,
    Quantidade_item INT, 
    Preco_unitario_venda DECIMAL(10, 2), 
    PRIMARY KEY (Id_venda, Id_produto),
    FOREIGN KEY(Id_venda) REFERENCES Vendas (Id_venda),
    FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto)
);

CREATE TABLE adquire_produtos (
    Id_cliente INT,
    Id_produto INT,
    PRIMARY KEY (Id_cliente, Id_produto),
    FOREIGN KEY(Id_cliente) REFERENCES Clientes (Id_cliente),
    FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto)
);

CREATE TABLE Cadastra (
    Id_funcionario INT,
    Id_produto INT,
    Data_cadastrado DATETIME,
    PRIMARY KEY (Id_funcionario, Id_produto),
    FOREIGN KEY(Id_funcionario) REFERENCES Funcionario (Id_funcionario),
    FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto)
);

CREATE TABLE faz_reposicao (
    Id_funcionario INT,
    id_estoque INT,
    Data_reposicao DATETIME, 
    PRIMARY KEY (Id_funcionario, id_estoque),
    FOREIGN KEY(Id_funcionario) REFERENCES Funcionario (Id_funcionario),
    FOREIGN KEY(id_estoque) REFERENCES Estoque (id_estoque)
);

CREATE TABLE gera (
    Id_produto INT,
    id_estoque INT,
    PRIMARY KEY (Id_produto, id_estoque),
    FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto),
    FOREIGN KEY(id_estoque) REFERENCES Estoque (id_estoque)
);


INSERT INTO cadastro (Id_cadastro, Senha_cadastro, CPF_cliente, Data_cadastro) VALUES
(1, 'senha123', '111.111.111-11', '2024-01-10 10:00:00'),
(2, 'senha456', '222.222.222-22', '2024-01-15 11:30:00'),
(3, 'senha789', '333.333.333-33', '2024-02-01 09:00:00');

INSERT INTO Vendas (Id_venda, Comprador_venda, Venda_realizada, Preco_total_venda, Quantidade_total_venda, Codigo_venda) VALUES
(101, 1, '2024-03-05 14:00:00', 150.00, 3, 'VND20240305001'),
(102, 2, '2024-03-05 15:30:00', 80.50, 2, 'VND20240305002'),
(103, 3, '2024-03-06 11:00:00', 30.00, 1, 'VND20240306001');


INSERT INTO Funcionario (Id_funcionario, Idd_funcionario, Data_nascimento, Cargo_funcionario, Salario_funcionario, Id_cadastro, Id_venda) VALUES
(1, 35, '1990-05-20 00:00:00', 'Gerente de Vendas', 5000.00, 3, 101),
(2, 28, '1997-11-10 00:00:00', 'Atendente', 2500.00, 2, 102);


INSERT INTO Fornecedor (Id_fornecedor, Razao_social, CNPJ, Telefone, Status, Endereco, Cep) VALUES
(501, 'Distribuidora ABC Ltda', '00.111.222/0001-33', '(11) 98765-4321', 'Ativo', 'Rua das Flores, 100', '01000-001'),
(502, 'Produtos Saudáveis S.A.', '00.333.444/0001-55', '(21) 12345-6789', 'Ativo', 'Av. Principal, 500', '20000-002');


INSERT INTO Produto (Id_produto, Nome_produto, Categoris_produto, Data_cadastro, Descricao, Preco_venda, Quantidade_estoquee) VALUES
(10, 'Whey Protein 900g', 'Suplemento', '2024-01-01 08:00:00', 'Proteína de soro de leite concentrada', 80.00, 50),
(11, 'Creatina Monoidratada', 'Suplemento', '2024-01-01 08:15:00', 'Suplemento para aumento de força', 50.00, 100),
(12, 'Barra de Proteína', 'Alimento', '2024-01-10 12:00:00', 'Barra sabor chocolate e amendoim', 10.00, 200);


INSERT INTO Clientes (Id_cliente, Data_cadastro, CPF_cliente, Matricula_cliente, Frequencia_cliente, Nome_cliente, Idd_cliente, Id_cadastro) VALUES
(1, '2024-01-10 10:00:00', '111.111.111-11', 'CLT2024001', 'Regular', 'Ana Silva', 25, 1),
(2, '2024-01-15 11:30:00', '222.222.222-22', 'CLT2024002', 'Ocasional', 'Bruno Mendes', 30, 2),
(3, '2024-02-01 09:00:00', '333.333.333-33', 'CLT2024003', 'Diária', 'Carla Souza', 22, 3);


INSERT INTO Estoque (id_estoque, data_fornecimento, cod_produto, qtd, nome_produto, descricao) VALUES
(1001, '2024-02-15 09:00:00', 'E10', 50, 'Whey Protein 900g', 'Lote 1: Validade 12/2025'),
(1002, '2024-02-15 09:00:00', 'E11', 100, 'Creatina Monoidratada', 'Lote 1: Validade 06/2026'),
(1003, '2024-03-01 10:30:00', 'E12', 200, 'Barra de Proteína', 'Lote 2: Validade 09/2024');


INSERT INTO Fornece (Id_produto, Id_fornecedor) VALUES
(10, 501),
(11, 501),
(12, 502);


INSERT INTO Realiza (Id_venda, Id_produto, Quantidade_item, Preco_unitario_venda) VALUES
(101, 10, 1, 80.00), 
(101, 11, 1, 50.00), 
(101, 12, 2, 10.00), 
(102, 10, 1, 80.50); 


INSERT INTO adquire_produtos (Id_cliente, Id_produto) VALUES
(1, 10),
(1, 11),
(2, 10),
(3, 12);


INSERT INTO Cadastra (Id_funcionario, Id_produto, Data_cadastrado) VALUES
(1, 10, '2024-01-01 08:00:00'),
(2, 12, '2024-01-10 12:00:00');

INSERT INTO faz_reposicao (Id_funcionario, id_estoque, Data_reposicao) VALUES
(1, 1001, '2024-02-16 10:00:00'),
(1, 1002, '2024-02-16 10:00:00'),
(2, 1003, '2024-03-02 11:00:00');


INSERT INTO gera (Id_produto, id_estoque) VALUES
(10, 1001),
(11, 1002),
(12, 1003);