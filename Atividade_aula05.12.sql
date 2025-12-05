create database loja;
use loja;


-- ------------------------- CRIAÇÃO DE USUARIOS -- -------------------------------------------------------------

			-- Criando usuário GERENTE(acesso total) da loja:
create user 'gerente_loja'@'localhost';

			-- Definindo a senha do GERENTE
set password for 'gerente_loja'@'localhost' = password ('Ger3nt3@2024!');

			-- Definindo validade da senha (60 dias)
alter user 'gerente_loja'@'localhost' password expire interval 60 day;
		
			-- Definindo permissões do GERENTE
grant all privileges on loja.* to 'gerente_loja'@'localhost';

-- ----------------------------------------------------------------------------------
			-- Criando usuário VENDEDOR(acesso limitado(apenas Inserir e Ver dados)) da loja:
create user 'vendedor_01'@'192.168.10.%';

			-- Definindo a senha do VENDEDOR
set password for 'vendedor_01'@'192.168.10.%' = password ('V3nd3dor@2024!');

			-- Definindo validade da senha (NUNCA)
alter user 'vendedor_01'@'192.168.10.%' password expire never;

			-- Definindo permissões do VENDEDOR(Inserir e VER)
grant insert, select on loja.*to 'vendedor_01'@'192.168.10.%';

-- ----------------------------------------------------------------------------------
			-- Criando usuário ESTAGIARIO(acesso minimo( Ver dados)) da loja:
create user 'estagiario_ti'@'localhost';

			-- Definindo a senha do ESTAGIARIO
set password for 'estagiario_ti'@'localhost' = password ('Est4gi@2024!');

			-- Definindo validade da senha (30 dias)
alter user 'vendedor_01'@'192.168.10.%' password expire interval 30 day;

			-- Definindo permissões do ESTAGIARIO (VER)
grant select on loja.* to 'estagiario_ti'@'localhost';

-- ----------------------------------------------------------------------------------
			-- Criando usuário BACKUP(apenas para Backup) da loja:
create user 'backup_user'@'%';

			-- Definindo a senha do BACKUP
set password for 'backup_user'@'%' = password ('Backup@2024!');

			-- Definindo validade da senha (365 dias)
alter user 'backup_user'@'%' password expire interval 365 day;

			-- Definindo permissões do BACKUP (PROCESS, LOCK TABLES, SELECT)
grant process, select, lock tables on *.* to 'backup_user'@'%';

-- ------------------------- VERIFICAÇÃO DE USUARIOS CRIADOS -- -------------------------------------------------------------
SELECT USER , HOST FROM MySql.user;
-- ----------------------------------------------------------------------------------


-- ------------------------- TABELA DE CLIENTES COM CRIPTOGRAFIA -- -------------------------------------------------------------
			-- Criando a tabela:
create table clientes (
	ID int primary key auto_increment,
    Nome_completo varchar (200) not null,
    Email varchar(200),
    Cpf_Criptografado varbinary(255),
    Cpf_visivel varchar(14),
    data_nascimento date,
    data_cadastro timestamp default current_timestamp
);

			-- Criar chave secreta:
set @chave = '(MinhaChaveSecreta123!)';

			-- Inserir 5 clientes (2 CRIPTOGRAFADOS, 3 NÃO)
-- 2 CRIPTO:
insert into clientes (Nome_completo, Email, Cpf_Criptografado, Cpf_visivel, data_nascimento) 
values ('Vinicius Gomes', 'viniteste@teste.com', aes_encrypt('111.123.345-98', @chave), NULL , '2007-11-18'),
('Guilherme Guimaraes', 'guilerme@teste.com', aes_encrypt('123.987.789-99', @chave), NULL , '1988-06-22');

select * from clientes;

-- 3 DESCRIPTO:
insert into clientes (Nome_completo, Email, Cpf_Criptografado, Cpf_visivel, data_nascimento)
values ('Lukas Versan', 'lukas@teste.com', NULL, '542.937.750-30', '1971-12-31'),
('Miguel Arcanjo', 'miguel@teste.com', NULL, '281.809.990-09', '1996-11-24'),
('Ewerton Mationi', 'ewertin@teste.com', NULL, '396.815.430-41', '1989-07-04');

select * from clientes;

-- ------------------------- TESTE DE SEGURANÇA -- -------------------------------------------------------------
			-- CONSULTA NORMAL ( MOSTRA O PROBLEMA) - Consulta que mostra o CPF:
select Nome_completo, Cpf_visivel from clientes;

			-- CONSULTA SEGURA ( MOSTRA A SOLOUÇÃO) - CPF criptografado:
select Nome_completo, Cpf_Criptografado from clientes;

			-- DESCRIPTOGRAFAR (APENAS COM A CHAVE):
select Nome_completo, cast(aes_decrypt(Cpf_Criptografado, @chave) as char) cpf_descriptografado from clientes where Cpf_Criptografado is not null;




















