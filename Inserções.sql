-- Inserção de dados na tabela Clientes
INSERT INTO Clientes (Nome, Telefone, Endereco)
VALUES
    ('João Silva', '123456789', 'Rua A, 123'),
    ('Maria Santos', '987654321', 'Avenida B, 456');

-- Inserção de dados na tabela Veiculos
INSERT INTO Veiculos (ClienteID, Modelo, Ano, Placa)
VALUES
    (1, 'Ford Fiesta', 2015, 'ABC1234'),
    (2, 'Chevrolet Onix', 2020, 'XYZ5678');

-- Inserção de dados na tabela Servicos
INSERT INTO Servicos (Descricao, Preco)
VALUES
    ('Troca de óleo', 100.00),
    ('Alinhamento', 50.00);

-- Inserção de dados na tabela Pecas
INSERT INTO Pecas (Nome, Estoque, Preco)
VALUES
    ('Pastilha de freio', 50, 40.00),
    ('Filtro de ar', 100, 20.00);

-- Inserção de dados na tabela OrdensDeServico
INSERT INTO OrdensDeServico (ClienteID, VeiculoID, DataEntrada, DataConclusao)
VALUES
    (1, 1, '2023-08-01', '2023-08-03'),
    (2, 2, '2023-08-02', '2023-08-05');

-- Inserção de dados na tabela ItensDeServico
INSERT INTO ItensDeServico (OrdemID, ServicoID, Quantidade)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (2, 1, 1);

-- Inserção de dados na tabela ItensDePeca
INSERT INTO ItensDePeca (OrdemID, PecaID, Quantidade)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 2, 2);