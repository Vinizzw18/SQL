select version();

create user 'analista_vinicius'@'localhost';

set password for 'analista_vinicius'@'localhost' = 
password('vinicius123');

alter user 'analista_vinicius'@'localhost' 
password expire interval 90 day;

select user, host from mysql.user 
where user like '%vinicius%';

create user 'usuario_ext'@'192.168.1.%';

set password for 'usuario_ext'@'192.168.1.%'
= password('usuario123');

alter user 'usuario_ext'@'192.168.1.%' password expire never;

select user, host from mysql.user 
where user like '%usuario%';

select 
user, 
host, 
password_expired as 'Senha Expirada?'
from mysql.user
where user not like 'mysql%'
and user != 'root';

-- criar usuario com privilegios especificos -- 

create user 'UsuarioLeitor'@'localhost';

set password for 'UsuarioLeitor'@'localhost' = 
password('leitor1234');


create database if not exists empresa_dados;

show databases;

grant select on empresa_dados.* to 'UsuarioLeitor'@'localhost';

flush privileges;
show grants for 'UsuarioLeitor'@'localhost';

-- criptografando informações

create database loja_virtual;
use loja_virtual;

create table clientes (
	id int primary key auto_increment,
    nome_completo varchar(100) not null,
    cpf_visivel varchar(14),
    cpf_criptografado varbinary(255),
    email varchar(100),
    telefone varchar (20),
    data_cadastro timestamp default current_timestamp
);

create index idx_cliente_nomee on clientes(nome_completo);

describe clientes;

set @minha_chave_secreta = '(chave123)';

insert into clientes (nome_completo, cpf_criptografado, email, telefone) values ('vinicius gomes', aes_encrypt('123.456.789-00', @minha_chave_secreta), 'vinicius@vinicius.com', '(44)9 9999-1234');

insert into clientes (nome_completo, cpf_criptografado, email, telefone) values ('lukas versan', aes_encrypt('555.444.232-00', @minha_chave_secreta), 'lukas@lukas.com', '(44)9 0000-1123');

select id, nome_completo, cpf_criptografado, email from clientes;

select HEX(cpf_criptografado) from clientes;

-- Descriptografar

set @minha_chave_secreta = '(chave123)';

select id, nome_completo, cast(aes_decrypt(cpf_criptografado, @minha_chave_secreta) as char) cpf_descriptografado, email, telefone from clientes;