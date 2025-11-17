drop database if exists loja;
create database loja;
use loja;
 
 
show databases;

create table produtos (
	id int auto_increment primary key,
	nome varchar(100) not null,
    preco decimal(10, 2) not null,
    estoque int not null
);

desc produtos;

create table vendas (
	id int auto_increment primary key,
    produto_id int,
    produto varchar(100) not null,
    quantidade int not null,
    valor_total decimal(10, 2) not null,
    data_venda date not null,
    foreign key (produto_id) references produtos(id)
);

desc vendas;


INSERT INTO produtos (nome, preco, estoque) VALUES
('Mouse Gamer RGB', 79.90, 50),
('Teclado Mecânico Blue Switch', 229.90, 30),
('Monitor 24" Full HD', 899.00, 15),
('Headset Wireless', 349.90, 20),
('Cadeira Gamer Reclinável', 1299.00, 10),
('Notebook i5 8GB RAM', 2999.00, 8),
('HD Externo 1TB', 299.90, 40),
('SSD 480GB', 219.90, 35),
('Pendrive 64GB', 39.90, 100),
('Webcam Full HD', 159.90, 25),
('Mousepad Grande', 49.90, 60),
('Caixa de Som Bluetooth', 99.90, 45),
('Roteador Wi-Fi Dual Band', 149.90, 22),
('Smartphone 128GB', 1899.00, 12),
('Carregador Turbo USB-C', 79.00, 70),
('Cabo HDMI 2m', 29.90, 80),
('Placa de Vídeo GTX 1660', 1499.00, 5),
('Fonte 600W 80 Plus', 349.00, 18),
('Gabinete Mid Tower RGB', 299.00, 14),
('Controle Wireless para PC', 199.00, 28);

INSERT INTO vendas (produto_id, produto, quantidade, valor_total, data_venda) VALUES
(1, 'Mouse Gamer RGB', 2, 159.80, DATE_SUB(CURDATE(), INTERVAL 1 DAY)),
(2, 'Teclado Mecânico Blue Switch', 1, 229.90, DATE_SUB(CURDATE(), INTERVAL 4 DAY)),
(3, 'Monitor 24\" Full HD', 1, 899.00, DATE_SUB(CURDATE(), INTERVAL 7 DAY)),
(4, 'Headset Wireless', 3, 1049.70, DATE_SUB(CURDATE(), INTERVAL 6 DAY)),
(5, 'Cadeira Gamer Reclinável', 1, 1299.00, DATE_SUB(CURDATE(), INTERVAL 3 DAY)),
(6, 'Notebook i5 8GB RAM', 1, 2999.00, DATE_SUB(CURDATE(), INTERVAL 4 DAY)),
(7, 'HD Externo 1TB', 2, 599.80, DATE_SUB(CURDATE(), INTERVAL 9 DAY)),
(8, 'SSD 480GB', 3, 659.70, DATE_SUB(CURDATE(), INTERVAL 8 DAY)),
(9, 'Pendrive 64GB', 5, 199.50, DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
(10, 'Webcam Full HD', 1, 159.90, DATE_SUB(CURDATE(), INTERVAL 2 DAY)),
(11, 'Mousepad Grande', 4, 199.60, DATE_SUB(CURDATE(), INTERVAL 3 DAY)),
(12, 'Caixa de Som Bluetooth', 2, 199.80, DATE_SUB(CURDATE(), INTERVAL 6 DAY)),
(13, 'Roteador Wi-Fi Dual Band', 1, 149.90, DATE_SUB(CURDATE(), INTERVAL 8 DAY)),
(14, 'Smartphone 128GB', 1, 1899.00, DATE_SUB(CURDATE(), INTERVAL 7 DAY)),
(15, 'Carregador Turbo USB-C', 3, 237.00, DATE_SUB(CURDATE(), INTERVAL 9 DAY)),
(16, 'Cabo HDMI 2m', 5, 149.50, DATE_SUB(CURDATE(), INTERVAL 1 DAY)),
(17, 'Placa de Vídeo GTX 1660', 1, 1499.00, DATE_SUB(CURDATE(), INTERVAL 2 DAY)),
(18, 'Fonte 600W 80 Plus', 2, 698.00, DATE_SUB(CURDATE(), INTERVAL 8 DAY)),
(19, 'Gabinete Mid Tower RGB', 1, 299.00, DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
(20, 'Controle Wireless para PC', 2, 398.00, DATE_SUB(CURDATE(), INTERVAL 4 DAY));

select * from vendas;

drop table vendas;
drop table produtos;


select * from produtos;

select produto, data_venda from vendas;

select * from vendas where quantidade >= 3;

select * from vendas where data_venda <= curdate() - interval 4 day;

-- Delimitador temporário para criar o bloco de código

delimiter //

create procedure AplicadorDeDescontoGeral(in porcentagem decimal (5, 2)) 
begin
-- Atualizar a tabela de produtos aplicando o desconto
	update produtos
    set preco = preco * (1 - (porcentagem / 100));
    -- Informar quantas linhas foram afetadas
    select concat('Desconto de ', porcentagem, '%2 aplicado em ', row_count(),
    ' produtos.') as Resultado;
    end //
delimiter ;

call AplicadorDeDescontoGeral(0.9);
select * from produtos;






