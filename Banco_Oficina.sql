CREATE DATABASE oficina;

USE oficina;

-- Tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Telefone VARCHAR(15),
    Endereco VARCHAR(255),
    INDEX idx_Clientes_Nome (Nome)
);

-- Tabela de Veículos
CREATE TABLE Veiculos (
    VeiculoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    Modelo VARCHAR(50),
    Ano INT,
    Placa VARCHAR(15),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    INDEX idx_Veiculos_ClienteID (ClienteID)
);

-- Tabela de Serviços
CREATE TABLE Servicos (
    ServicoID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2),
    INDEX idx_Servicos_Descricao (Descricao)
);

-- Tabela de Peças
CREATE TABLE Pecas (
    PecaID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Estoque INT,
    Preco DECIMAL(10, 2),
    INDEX idx_Pecas_Nome (Nome)
);

-- Tabela de Ordens de Serviço
CREATE TABLE OrdensDeServico (
    OrdemID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    VeiculoID INT,
    DataEntrada DATE,
    DataConclusao DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculos(VeiculoID),
    INDEX idx_OrdensDeServico_ClienteID (ClienteID),
    INDEX idx_OrdensDeServico_VeiculoID (VeiculoID)
);

-- Tabela de Itens de Serviço
CREATE TABLE ItensDeServico (
    OrdemID INT,
    ServicoID INT,
    Quantidade INT,
    PRIMARY KEY (OrdemID, ServicoID),
    FOREIGN KEY (OrdemID) REFERENCES OrdensDeServico(OrdemID),
    FOREIGN KEY (ServicoID) REFERENCES Servicos(ServicoID)
);

-- Tabela de Itens de Peça
CREATE TABLE ItensDePeca (
    OrdemID INT,
    PecaID INT,
    Quantidade INT,
    PRIMARY KEY (OrdemID, PecaID),
    FOREIGN KEY (OrdemID) REFERENCES OrdensDeServico(OrdemID),
    FOREIGN KEY (PecaID) REFERENCES Pecas(PecaID)
);