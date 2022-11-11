-- Projeto E-COMMERCE - Desafio DIO

-- Criação de banco de dados para o e-Commerce
create database ecommerce;
use ecommerce;

-- Criar tabela cliente
create table Cliente(
	idCliente int auto_increment primary key,
    PNome varchar(20),
    UNome varchar(20),
    CPF char(11) not null,
    Telefone1 char(11),
    Telefone2 char(11),
    Email varchar(30),
    constraint unique_cpf_cliente unique(CPF)
);
alter table Cliente auto_increment=1;

-- Criar tabela Endereço
create table Endereco(
	idEndereco int auto_increment primary key,
    Rua varchar(40),
    Bairro varchar(25),
    Numero varchar(5),
    Complemento varchar(10),
    CEP char(8),
    Cidade varchar(20),
    Estado char(2),
    End_padrao boolean default true
);


-- Criar tabela Cartão
create table Cartao(
	idCartao int auto_increment primary key,
    Nome_titular varchar(30),
    Numero_cartao varchar(14),
    Bandeira enum('Mastercard','Visa','Elo','Hipercard', 'American Express'),
    Data_validade date,
    Metodo enum('crédito','débito') default ('crédito')
);

-- Criar tabela Forma de Pagamento
create table Pagamento(
	idPagamento int auto_increment primary key,
    PIX varchar(45),
    Boleto varchar(50),
    idCliente int,
    idCartao int,
    constraint fk_cliente_pagamento foreign key (idCliente) references Cliente(idCliente),
    constraint fk_cartao_pagamento foreign key (idCartao) references Cartao(idCartao)
);


-- Criar tabela Produto
create table Produto(
	idProduto int auto_increment primary key,
    Nome varchar(20) not null,
    Descricao varchar(30),
    Categoria enum('Eletrônico', 'Roupa e calçado', 'Papelaria', 'Alimentos', 'Cozinha', 'Móveis', 'Outros') not null,
    Codigo char(13) not null, 
    Avaliacao float,
    Valor_unitario float not null,
    constraint unique_codigo_produto unique(Codigo)
);
-- alter table Produto auto_increment=1;

-- Criar tabela Vendedor
create table Vendedor(
	idVendedor int auto_increment primary key,
    Razao_social varchar(30) not null,
    Nome_fantasia varchar(30),
    CNPJ char(14) not null,
    Telefone char(11),
    Email varchar(30)
);
-- alter table Vendedor auto_increment=1;

-- Criar tabela Fornecedor
create table Fornecedor(
	idFornecedor int auto_increment primary key,
    Razao_social varchar(30) not null,
    Nome_fantasia varchar(30),
    CNPJ char(14) not null,
	Telefone char(11),
    Email varchar(30)
);
-- alter table Fornecedor auto_increment=1;

-- Criar tabela Transportadora
create table Transportadora(
	idTransportadora int auto_increment primary key,
    Razao_social varchar(50) not null,
    Nome_fantasia varchar(50),
    CNPJ char(14) not null,
	Telefone char(11),
    Email varchar(30)
);
-- alter table Transportadora auto_increment=1;

-- Criar tabela Entrega
create table Entrega(
	idEntrega int auto_increment primary key,
    status_entrega enum('Processando', 'Em trânsito', 'Entregue'),
    codigo_rastreio varchar(20),
    valor_frete float,
    idTransportadora int,
    idEndereco int,
    constraint fk_transp_entrega foreign key (idTransportadora) references Transportadora(idTransportadora),
    constraint fk_endereco_entrega foreign key (idEndereco) references Endereco(idEndereco)
);
-- alter table Entrega auto_increment=1;

-- Criar tabela Pedido
create table Pedido(
	idPedido int auto_increment primary key,
    Data_pedido datetime,
    Status_pedido enum('Pendente de pagamento', 'Cancelado', 'Confirmado'),
    idCliente int,
    idPagamento int,
    idEntrega int,
    constraint fk_cliente_pedido foreign key (idCliente) references Cliente(idCliente),
    constraint fk_pagamento_pedido foreign key (idPagamento) references Pagamento(idPagamento),
    constraint fk_entrega_pedido foreign key (idEntrega) references Entrega(idEntrega)
);
-- alter table Pedido auto_increment=1;

-- Criar tabela Endereco_cliente
create table Endereco_Cliente(
	idCliente int,
    idEndereco int,
    constraint fk_endereco_cliente foreign key (idCliente) references Cliente(idCliente),
    constraint fk_cliente_endereco foreign key (idEndereco) references Endereco(idEndereco)
);

-- Criar tabela Compras (Pedido_Produto)
create table Compras(
	idPedido int,
    idProduto int,
    quantidade int default 1,
    constraint fk_pedido_compras foreign key (idPedido) references Pedido(idPedido),
    constraint fk_produto_compras foreign key (idProduto) references Produto(idProduto)
);

-- Criar tabela Estoque
create table Estoque(
	idEstoque int auto_increment primary key,
    localizacao varchar(30)
);
-- alter table Estoque auto_increment=1;

-- Criar tabela Estoque disponível (Estoque_Produto)
create table Estoque_disponivel(
	idProduto int,
    idEstoque int,
    quantidade int not null default 0,
    constraint fk_produto_disponivel foreign key (idProduto) references Produto(idProduto),
    constraint fk_estoque_disponivel foreign key (idEstoque) references Estoque(idEstoque)
);

-- Criar tabela Fornecimento (Fornecedor_Estoque)
create table Fornecimento(
	idFornecedor int,
    idEstoque int,
    constraint fk_fornecedor_fornecimento foreign key (idFornecedor) references Fornecedor(idFornecedor),
    constraint fk_estoque_fornecimento foreign key (idEstoque) references Estoque(idEstoque)
);

-- Criar tabela Produto_vendedor
create table Produto_vendedor(
	idProduto int,
    idVendedor int,
    constraint fk_produto_vendedor foreign key (idProduto) references Produto(idProduto),
    constraint fk_vendedor_produto foreign key (idVendedor) references Vendedor(idVendedor)
);