-- Projeto E-COMMERCE - Desafio DIO

-- Queries / Consultas

use ecommerce;

-- Produtos vendidos por Pedido 
select pd.idPedido, pd.Data_pedido, pd.Status_pedido, pr.Nome, pr.Categoria, pr.Valor_unitario from Pedido pd inner join Compras cp on pd.idPedido=cp.idPedido
	inner join Produto pr on cp.idProduto=pr.idProduto;


-- Locais de entrega e suas transportadoras
select * from Endereco ed inner join Entrega et on et.idEndereco=ed.idEndereco
	inner join Transportadora t on t.idTransportadora=et.idTransportadora;


-- Quantidade de produtos disponíveis nos estoques
select sum(e.quantidade) as 'Quantidade', p.Nome from Estoque_disponivel e inner join Produto p on p.idProduto=e.idProduto
	group by p.Nome order by p.Nome;
    

-- Quantidade de pedidos feitos por cada cliente
select count(p.idCliente) as 'Quantidade', concat(c.Pnome,' ',c.UNome) as 'Cliente' from Pedido p inner join Cliente c
	on c.idCliente=p.idCliente
	group by p.idCliente;