use oficina;

show tables;

insert into clients(Fname, Lname, CPF, Veiculo) values
('Luana','Lima','18394023928','Corolla'),
('João','Sousa','94107709772','Civic g10 Touring'),
('Agnaldo','Leal','56390802931','Silvia S15'),
('Matheus','Oliveira','12492048234','Taycan');

select * from clients;

insert into veiculo(idVClient,marca, modelo, ano) values
(1,'Toyota','Corolla Altis Premium','2024'),
(2,'BMW','320i GP','2022'),
(3,'Nissan','Silvia S15','1999'),
(4,'Porsche','Taycan GTS','2023');

select * from veiculo;

insert into pedido(idPClient,idPVeiculo , Fname, descricao) values
(2,2,'João','Revisão geral'),
(4,4,'Matheus','Troca de Oleo'),
(3,3,'Agnaldo','Revisão geral'),
(1,1,'Luana','Troca do retrovisor');

select * from pedido;

insert into equipe1 (idEquipe1, codigoMecanico, fname, rua, cidade, estado, cep, especialidade) values
(1, 2342, 'Juan', 'Avenida das Acácias, 987', 'Brasília', 'Distrito Federal', '70070-000', 'Sistemas elétricos e eletrônicos'),
(1, 3474, 'José', 'Travessa do Sol, 321', 'Fortaleza', 'Ceará', '60010-110', 'Motor de combustão interna'),
(1, 2345, 'Roberto', 'Rua das Flores, 123', 'São Paulo', 'São Paulo', '01010-010', 'Transmissão e embreagem'),
(1, 1247, 'Jorge', 'Avenida das Palmeiras, 456', 'Recife', 'Pernambuco', '50010-000', 'Suspensão e direção');

select * from equipe1;

insert into equipe2(idEquipe2, codigoMecanico, fname, endereco, especialidade) values
(2,3486,'Ricardo','Avenida Atlântica, 456, Rio de Janeiro, Rio de Janeiro 22010-000','Transmissão e embreagem'),
(2,1627,'Robson','Rua das Palmeiras, 789, Belo Horizonte, Minas Gerais 30123-450','Sistemas elétricos e eletrônicos'),
(2,0812,'Josué','Rua das Mangueiras, 654, Salvador, Bahia 40010-090','Motor de combustão interna'),
(2,1244,'Marcos','Rua das Rosas, 123, Porto Alegre, Rio Grande do Sul, 90010-010','Suspensão e direção');

select * from equipe2;

insert into OrdemServico (idOEquipe1, idOEquipe2, idOPedido, numeroPedido, dataEmissao, valor, statusPedido, dataConclusao) values
(null, 2, 3, 1, '2023-04-12', 1100.00, 'em andamento', '2023-04-14'),
(1, null, 1, 2, '2023-05-19', 800.00, 'finalizado', '2023-05-19'),
(null, 2, 2, 3, '2023-06-13', 1100.00, 'em andamento', '2023-06-14'),
(1, null, 4, 4, '2023-08-20', 400.00, default, '2023-08-25');


select * from OrdemServico;

select * from clients where idclient = 1;

select * from equipe2 where codigoMecanico = 0812;

SELECT TIMEDIFF(dataConclusao, dataEmissao) AS tempo_decorrido FROM OrdemServico;

select * from equipe1 order by Fname;

select * from veiculo order by ano;

select * from clients order by Fname;

SELECT idOPedido, SUM(valor) AS total_pedidos
FROM OrdemServico
GROUP BY idOPedido
HAVING SUM(valor) > 600;

SELECT c.*, v.*
FROM clients c
JOIN pedido p ON c.idClient = p.idPClient
JOIN veiculo v ON p.idPVeiculo = v.idVeiculo;


