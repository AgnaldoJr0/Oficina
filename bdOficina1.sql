drop database oficina;
create database oficina;
use oficina;

create table clients(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Lname varchar(20),
    CPF char(11) not null,
    Veiculo varchar(20),
    constraint unique_cpf_client unique (CPF)
);
alter table clients auto_increment=1;

create table veiculo(
    idVeiculo int auto_increment primary key,
    idVClient int,
    marca varchar(45),
    modelo varchar(45),
    ano year,
    constraint fk_veiculo_client foreign key (idVClient) references clients(idClient)
);

create table pedido(
    idPedido int auto_increment primary key,
    idPClient int,
    idPVeiculo int,
    Fname varchar(10),
    descricao varchar(45),
    constraint fk_pedido_veiculo foreign key (idPVeiculo) references veiculo(idVeiculo),
    constraint fk_pedido_client foreign key (idPClient) references clients(idClient)
);

create table equipe1(
    idEquipe1 int primary key,
    codigoMecanico int,
    fname varchar(10),
    endereco varchar(55),
    especialidade varchar(45)
);

create table equipe2(
    idEquipe2 int primary key,
    codigoMecanico int,
    fname varchar(10),
    endereco varchar(55),
    especialidade varchar(45)
);

create table OrdemServico(
    idOrderService int auto_increment primary key,
    idOEquipe1 int,
    idOEquipe2 int,
    idOPedido int,
    numeroPedido int,
    dataEmissao date,
    valor float,
    statusPedido enum('em processamento','em andamento','finalizado') default 'em processamento',
    dataConclusao date,
    constraint fk_order_equipe1 foreign key (idOEquipe1) references equipe1(idEquipe1),
    constraint fk_order_equipe2 foreign key (idOEquipe2) references equipe2(idEquipe2),
    constraint fk_order_pedido foreign key (idOPedido) references pedido(idPedido)
);

show tables;
