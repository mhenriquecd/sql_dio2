create SCHEMA if not exists oficina;

use oficina;

create table if not exists cliente(
	idCliente int auto_increment primary key,
    nome varchar(20),
    minit char(3),
    CPF char(11) not null,
    Endereco varchar(50) not null,
    constraint cpf_client unique (CPF)
    
);

create table if not exists fornecedor(
	idFornecedor int primary key,
    CNPJ char(15) not null,
    nome varchar(255) not null,
    contato char(11) not null,
    constraint unique_fornecedor unique(CNPJ)
);

create table if not exists estoque(
	idProduto int auto_increment primary key,
    idFornecedor int,
    nome varchar(30) not null,
    valorCompra float,
    tipo enum('carro', 'moto', 'pintura') not null,
    preco float,
    quantidade int default 0
);

create table if not exists vendedor(
	idVendedor int primary key,
    CNPJ char(15),
    CPF char(9),
    Nome varchar(255) not null,
    contato char(11) not null,
    Endereço varchar(255),
    constraint unique_CPF_vendedor unique(CPF),
    constraint unique_CNPJ_vendedor unique(CNPJ)
);

create table servico(
    idCliente int,
    descricao varchar(255),
    prioridade enum('baixa', 'média', 'alta') default 'baixa',
    status enum('Em andamento', 'Sem solução',
		'Concluido com sucesso', 'Entregue ao Cliente'),
	primary key(idCLiente)
);
