-- Projeto E-COMMERCE - Desafio DIO

-- Inserção de dados no e-Commerce

-- Visualizando as tabelas criadas (existentes no BD ecommerce)
use ecommerce;
show tables;

-- Visualizando as colunas da tabela Cliente
desc Cliente;

-- Inserindo dados na tabela Cliente
insert into Cliente (Pnome, UNome, CPF, Telefone1, Telefone2, Email)
	values('Maria', 'Luiza', '08812301202', '31988090087', '', 'maria.l@hotmail.com'),
		  ('José', 'Marcos', '12365483691', '61999876754', '6138042201', 'jose_marcos01@gmail.com'),
          ('Teresa Maria', 'Rodrigues Silva', '98076524302', '31999087765', '31999087765', 'teresa-rodrigues@outlook.com'),
          ('Mario Paulo', 'Santos', '44532188745', '87986554123', '', 'mpaulosantos@hotmail.com'),
          ('Alzira', 'Lopes Mattos', '90876543203', '31999876543', '31988098878', 'alzira_mattos@gmail.com'),
          ('Mariana', 'Silva Oliveira', '09876534521', '31988090087', '6187654312', 'marianasilvaoliveira@gmail.com'),
          ('Sandra', 'Lopes', '09878623145', '31988655644', '', 'sandra.l@hotmail.com'),
		  ('José', 'Passos', '00845600512', '61999876004', '6138042256', 'josep@outlook.com');

-- Inserindo dados na tabela Produto
desc Produto;
alter table Produto modify Nome varchar(40);
alter table Produto modify Descricao varchar(150);
insert into Produto (Nome, Descricao, Categoria, Codigo, Avaliacao, Valor_unitario)
	values ('Fone de ouvido','Fone de ouvido. Bluetooth. Preto. JBL. Wave 200 TWS','Eletrônico', 6548964631668,4.4,149.99),
		   ('Sofá retrátil','Sofá retrátil. Suede. Cinza. Linoforte. Benetton','Móveis', 1998960831168,4.2,1249.90),
           ('Jogo de prato','Jogo de prato com 6 peças. Porcelana. Branco. Duralex. Astral','Cozinha', 1200392680912,3.8,100.00),
           ('Bota Coturno','Bota Coturno masculino. Material sintético. Preto. Adventure. Conforto','Roupa e calçado', 4321239840062,4.2,250.00),
           ('Notebook Dell Inspiron','Notebook Dell Inspiron 15 11a geração Intel Core i7 16Gb 512Gb SSD. Prata. Dell. Inspiron 15','Eletrônico', 675498768320,4.5,5400.00);
           
-- Inserindo dados na tabela Fornecedor
desc Fornecedor;
insert into Fornecedor(Razao_social, Nome_fantasia, CNPJ, Telefone, Email)
	values ('Veste Bem ltda','Veste Bem','28528494000109','6139870011','contato@vestebem.com.br'),
		   ('Informática e Eletrônica ltda','Info Eletro','39857923000108','1134765643','vendas@infoeletro.com.br'),
           ('Casa Tudo ltda','','97597214000129','1199760011','contato@casatudo.com.br');

-- Inserindo dados na tabela Estoque
desc Estoque;
insert into Estoque(localizacao)
	values ('São Paulo'),
			('Curitiba'),
            ('Recife'),
            ('Goiânia');

-- Inserindo dados na tabela Vendedor
desc Vendedor;
insert into Vendedor(Razao_social, Nome_fantasia, CNPJ, Telefone, Email)
	values ('Julian Vendas ME', 'Julian Vendas', '11284414000106', '81988765423', 'julianvendas@outlook.com'),
		   ('Paula Lima ME', 'Eletro Paula', '36697019000186', '3121987765', 'eletro_paula@gmail.com');
           
-- Inserindo dados na tabela Transportadora
desc Transportadora;
insert into Transportadora(Razao_social, Nome_fantasia, CNPJ, Telefone, Email)
	values ('Leve Traz Transportes e Serviços', 'Leve Traz', '08567913000104', '3135106355', 'contato@levetraz.com.br'),
			('Chegou Entregas ltda', 'Chegou Entregas', '88176116000127', '1138772291', 'contato@chegou.com.br');
            
-- Inserindo dados na tabela Enderecos
desc Endereco;
insert into Endereco(Rua, Bairro, Numero, Complemento, CEP, Cidade, Estado)
	values('Rua Aurelia Dias', 'Jardim', '20', '', '56310500', 'Petrolina', 'PE'),
		  ('Rua Paulina Alves', 'São Gonçalo', '150', '', '56312150', 'Petrolina', 'PE'),
          ('Rua Aurelia Dias', 'Jardim', '20', 'Casa B', '56310500', 'Petrolina', 'PE'),
          ('Rua José Prado', 'Vila do Castelo', '8', '', '04438050', 'São Paulo', 'SP'),
          ('Rua Ricardo Paletti', 'Ponte Alta', '54', 'Apto 301', '32605650', 'Betim', 'MG');

-- Inserindo dados na tabela Pedido
desc Pedido;          
insert into Pedido(Data_pedido, Status_pedido, idCliente)
	values('2022-10-30 13:01:47', null, 1),
		  ('2022-10-30 20:12:03', null, 5),
          ('2022-11-01 12:01:34', 'Confirmado', 4),
          ('2022-11-01 11:09:21', 'Confirmado', 4);

-- Inserindo dados na tabela Compras
desc Compras;
insert into Compras(idPedido, idProduto, quantidade)
	values(1,1,1),
		  (1,5,1),
		  (2,1,2),
          (3,2,1),
          (4,3,1);
          
-- Inserindo dados na tabela Cartão
desc Cartao;
insert into Cartao(Nome_titular, Numero_cartao, Bandeira, Data_validade, Metodo)
	values('Maria L dos Santos', '5132955920242091', 'Mastercard', '2028-03-31', 'débito'),
		  ('Mariana Silva Oliveira', '6062821187696712', 'Hipercard', '2023-12-01', 'crédito'),
          ('Mario Paulo Santos', '4485081943347977', 'Visa', '2024-11-30', 'débito'),
          ('Douglas V Carvalho', '5463612829301382', 'Mastercard', '2024-07-01', 'crédito');
    
 
-- Inserindo dados na tabela Forma de Pagamento
desc Pagamento;
insert into Pagamento(PIX, Boleto, idCliente, idCartao)
	values(null, null, 1, 1),
          (null, null, 6, 2),
          (null, null, 4, 3),
		  (null, '34191.7900101043.51004791020.150008191560026000', 5, null);

-- Inserindo dados na tabela Estoque disponível
desc Estoque_disponivel;
insert into Estoque_disponivel(idProduto, idEstoque, quantidade)
	values(1, 1, 15),
		  (2, 1, 3),
          (3, 2, 6),
          (4, 4, 7),
          (5, 2, 5),
          (1, 3, 10),
          (5, 1, 4),
          (3, 2, 5);
    
-- Inserindo dados na tabela Fornecimento
desc Fornecimento;
insert into Fornecimento(idFornecedor, idEstoque)
	values(1, 2),
		  (2, 2),
          (1, 4),
          (3, 2),
          (2, 1),
          (1, 3),
          (3, 4);

-- Inserindo dados na tabela Endereco_cliente
desc Endereco_cliente;
insert into Endereco_cliente(idCliente, idEndereco)
	values(1,4),
		  (2,null),
          (3,2),
          (4,2),
          (5,4),
          (6,3),
          (7,null),
          (8,null),
          (1,5),
          (3,1),
          (4,null);
    
-- Inserindo dados na tabela Produto_vendedor
desc Produto_vendedor;
insert into Produto_vendedor(idVendedor, idProduto)
	values(1,2),
		  (1,3),
          (2,1),
          (2,5);
          
-- Inserindo dados na tabela Entrega
desc Entrega;
insert into Entrega(Status_entrega, Codigo_rastreio, Valor_frete, idTransportadora, idEndereco)
	values('Processando', null, 8.50, 1, 2),
		  ('Em trânsito', 'BR098368919', 10, 2, 5),
          ('Processando', null, 8.50, 1, 2),
          ('Em trânsito', 'BR098678910', 12, 1, 4);
          

