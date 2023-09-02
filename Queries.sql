
-- todos os dados da minha tabela Clientes
SELECT * FROM Clientes;

-- descrição e o preço de todos os serviços
SELECT Descricao, Preco FROM Servicos;

-- Veiculos com o ano maior que 2015
SELECT * FROM Veiculos WHERE Ano > 2015;

-- Clientes que tem telefone definido
SELECT * FROM Clientes WHERE Telefone IS NOT NULL;

-- Quanto cada cliente gastou
SELECT c.Nome, SUM(s.Preco) AS TotalGasto
FROM Clientes c
JOIN OrdensDeServico os ON c.ClienteID = os.ClienteID
JOIN ItensDeServico iserv ON os.OrdemID = iserv.OrdemID
JOIN Servicos s ON iserv.ServicoID = s.ServicoID
GROUP BY c.ClienteID, c.Nome;

-- Ordenando os veiculos do mais novo para mais antigo
SELECT * FROM Veiculos ORDER BY Ano DESC;

-- Clientes que Gastaram nais de R$100 em serviços
SELECT c.ClienteID, c.Nome, SUM(s.Preco) AS TotalGasto
FROM Clientes c
JOIN OrdensDeServico os ON c.ClienteID = os.ClienteID
JOIN ItensDeServico iserv ON os.OrdemID = iserv.OrdemID
JOIN Servicos s ON iserv.ServicoID = s.ServicoID
GROUP BY c.ClienteID, c.Nome
HAVING TotalGasto > 100;

-- Detalhes de clientes e veículos
SELECT os.OrdemID, c.Nome AS NomeCliente, v.Modelo
FROM OrdensDeServico os
JOIN Clientes c ON os.ClienteID = c.ClienteID
JOIN Veiculos v ON os.VeiculoID = v.VeiculoID;

-- Peças e serviços utilizados em cada ordem de serviço
SELECT os.OrdemID, p.Nome AS NomePeca, s.Descricao AS DescricaoServico
FROM OrdensDeServico os
LEFT JOIN ItensDePeca ipeca ON os.OrdemID = ipeca.OrdemID
LEFT JOIN Pecas p ON ipeca.PecaID = p.PecaID
LEFT JOIN ItensDeServico iserv ON os.OrdemID = iserv.OrdemID
LEFT JOIN Servicos s ON iserv.ServicoID = s.ServicoID;
