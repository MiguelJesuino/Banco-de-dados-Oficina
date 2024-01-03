# Modelo Lógico de Banco de Dados para Oficina 
Este repositório contém um modelo lógico de banco de dados para uma oficina automotiva, juntamente com uma série de queries SQL que podem ser utilizadas para responder a diversas perguntas e auxiliar na gestão da oficina.

## Estrutura do Banco de Dados 
O banco de dados é composto por várias tabelas que representam informações sobre clientes, veículos, serviços, peças, ordens de serviço e itens associados.
-  **Clientes**: Armazena informações sobre os clientes da oficina, incluindo nome, telefone e endereço.
-  **Veículos**: Registra detalhes dos veículos atendidos pela oficina, como modelo, ano e placa, além de estabelecer uma relação com os clientes.
-  **Serviços**: Contém informações sobre os serviços oferecidos, incluindo descrição e preço.
-  **Peças**: Armazena informações sobre as peças disponíveis na oficina, incluindo nome, estoque e preço.
-  **Ordens de Serviço**: Registra as ordens de serviço, vinculando clientes e veículos e indicando datas de entrada e conclusão.
-  **Itens de Serviço**: Associa serviços às ordens de serviço, registrando a quantidade utilizada.
-  **Itens de Peça**: Associa peças às ordens de serviço, registrando a quantidade utilizada.
## Exemplos de Consultas SQL 
Aqui estão alguns exemplos de consultas SQL que podem ser executadas no banco de dados para obter informações relevantes: 
1.  **Listar todos os dados da tabela Clientes**: 
```sql
SELECT * FROM Clientes;
```
2. **Obter a descrição e o preço de todos os serviços**:
```sql  
SELECT Descricao, Preco FROM Servicos;
```
3. **Filtrar veículos com ano de fabricação superior a 2015**:
```sql
SELECT * FROM Veiculos WHERE Ano > 2015;
```
4. **Identificar clientes que possuem número de telefone definido**:
```sql
SELECT * FROM Clientes WHERE Telefone IS NOT NULL;
```

5. **Calcular o total gasto por cada cliente em serviços**:
```sql
SELECT c.Nome, SUM(s.Preco) AS TotalGasto
FROM Clientes c
JOIN OrdensDeServico os ON c.ClienteID = os.ClienteID
JOIN ItensDeServico iserv ON os.OrdemID = iserv.OrdemID
JOIN Servicos s ON iserv.ServicoID = s.ServicoID
GROUP BY c.ClienteID, c.Nome;
```

6. **Ordenar veículos do mais novo para o mais antigo**:
```sql
SELECT * FROM Veiculos ORDER BY Ano DESC;
```

7. **Identificar clientes que gastaram mais de R$100 em serviços**:
```sql
SELECT c.ClienteID, c.Nome, SUM(s.Preco) AS TotalGasto
FROM Clientes c
JOIN OrdensDeServico os ON c.ClienteID = os.ClienteID
JOIN ItensDeServico iserv ON os.OrdemID = iserv.OrdemID
JOIN Servicos s ON iserv.ServicoID = s.ServicoID
GROUP BY c.ClienteID, c.Nome
HAVING TotalGasto > 100;
```
8. **Detalhes de clientes e veículos associados às ordens de serviço**:
```sql
SELECT os.OrdemID, c.Nome AS NomeCliente, v.Modelo
FROM OrdensDeServico os
JOIN Clientes c ON os.ClienteID = c.ClienteID
JOIN Veiculos v ON os.VeiculoID = v.VeiculoID;
```
9. **Peças e serviços utilizados em cada ordem de serviço**:
```sql
SELECT os.OrdemID, p.Nome AS NomePeca, s.Descricao AS DescricaoServico
FROM OrdensDeServico os
LEFT JOIN ItensDePeca ipeca ON os.OrdemID = ipeca.OrdemID
LEFT JOIN Pecas p ON ipeca.PecaID = p.PecaID
LEFT JOIN ItensDeServico iserv ON os.OrdemID = iserv.OrdemID
LEFT JOIN Servicos s ON iserv.ServicoID = s.ServicoID;
```
# Como Usar
1. Instale o MySQL

2. Crie o Banco de Dados: Execute o arquivo Banco_Oficina.sql

3. Insira os dados: utilize as inserções fornecidas ou insira com base em sua preferencia respeitanto a estrutura do banco de dados 

4. Execute Consultas Personalizadas: Utilize as consultas SQL fornecidas ou crie consultas personalizadas para obter informações específicas para a sua oficina.

# Contribuições
Contribuições são bem-vindas! Se você tiver sugestões de consultas adicionais, melhorias no modelo de banco de dados ou correções, sinta-se à vontade para criar um fork deste repositório, fazer as alterações e enviar um pull request.

# Licença
Este projeto está sob a [Licença MIT](https://opensource.org/licenses/MIT).

