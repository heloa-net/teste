CREATE TABLE tb_customer (
id_customer int primary key,
nm_customer varchar(255),
cpf_cnpj numeric);

CREATE TABLE dm_address_type (
cd_address_type char(1) primary key,
ds_address_type varchar(255));

CREATE TABLE tb_customer_address (
id_customer int references tb_customer(id_customer),
cd_address_type char(1) references dm_address_type(cd_address_type),
street varchar(255),
lot int,
a_references varchar(255), // modificado para não confundir com a keyword references
zip_code varchar(255));

              List of relations
 Schema |        Name         | Type  | Owner 
--------+---------------------+-------+-------
 public | dm_address_type     | table | lola
 public | tb_customer         | table | lola
 public | tb_customer_address | table | lola

INSERT INTO dm_address_type (cd_address_type, ds_address_type) VALUES 
('R', 'Residencial'), ('C', 'Comercial'), ('O', 'Outros');

INSERT INTO tb_customer (id_customer, nm_customer, cpf_cnpj) VALUES (1, 'Joãozinho Silva', 88877766655); 

INSERT INTO tb_customer_address (id_customer, cd_address_type, street, lot, zip_code) VALUES (1, 'R', 'Rua das Flores', 1, '01234-567');
INSERT INTO tb_customer_address (id_customer, cd_address_type, street, lot, a_references, zip_code) VALUES (1, 'C', 'Rua das Pedras', 100, 'Conjunto 200', '01234-567');

SELECT * FROM dm_address_type;
 cd_address_type | ds_address_type 
-----------------+-----------------
 R               | Residencial
 C               | Comercial
 O               | Outros

# QUESTÃO 2

SELECT * FROM tb_customer;
 id_customer |   nm_customer   |  cpf_cnpj   
-------------+-----------------+-------------
           1 | Joãozinho Silva | 88877766655

SELECT * FROM tb_customer_address;
 id_customer | cd_address_type |     street     | lot | a_references | zip_code  
-------------+-----------------+----------------+-----+--------------+-----------
           1 | R               | Rua das Flores |   1 |              | 01234-567
           1 | C               | Rua das Pedras | 100 | Conjunto 200 | 01234-567


#QUESTÃO 3

INSERT INTO tb_customer_address (id_customer, cd_address_type, street, lot, a_references, zip_code) VALUES (1, 'C', 'Rua das Pedras', 100, 'Conjunto 200', '01234-567');

SELECT * FROM tb_customer_address; 
 id_customer | cd_address_type |     street     | lot | a_references | zip_code  
-------------+-----------------+----------------+-----+--------------+-----------
           1 | R               | Rua das Flores |   1 |              | 01234-567
           1 | C               | Rua das Pedras | 100 | Conjunto 200 | 01234-567
           1 | C               | Rua das Pedras | 100 | Conjunto 200 | 01234-567


#QUESTÃO 4

SELECT id_customer FROM tb_customer WHERE cpf_cnpj = 88877766655; // Substituir pelo CPF do cliente que deve ser removido
DELETE FROM tb_customer_address WHERE id_customer = 1; // Substituir pelo id encontrado
DELETE FROM tb_customer WHERE id_customer = 1;

SELECT * FROM tb_customer_address; id_customer | cd_address_type | street | lot | a_references | zip_code 
-------------+-----------------+--------+-----+--------------+----------
(0 rows)

SELECT * FROM tb_customer;
 id_customer | nm_customer | cpf_cnpj 
-------------+-------------+----------
(0 rows)
