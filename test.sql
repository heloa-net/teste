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

test=# \d
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

test=# SELECT * FROM dm_address_type;
 cd_address_type | ds_address_type 
-----------------+-----------------
 R               | Residencial
 C               | Comercial
 O               | Outros

test=# SELECT * FROM tb_customer;
 id_customer |   nm_customer   |  cpf_cnpj   
-------------+-----------------+-------------
           1 | Joãozinho Silva | 88877766655

test=# SELECT * FROM tb_customer_address;
 id_customer | cd_address_type |     street     | lot | a_references | zip_code  
-------------+-----------------+----------------+-----+--------------+-----------
           1 | R               | Rua das Flores |   1 |              | 01234-567
           1 | C               | Rua das Pedras | 100 | Conjunto 200 | 01234-567

test=# INSERT INTO tb_customer_address (id_customer, cd_address_type, street, lot, a_references, zip_code) VALUES (1, 'C', 'Rua das Pedras', 100, 'Conjunto 200', '01234-567');
INSERT 0 1
test=# SELECT * FROM tb_customer_address; id_customer | cd_address_type |     street     | lot | a_references | zip_code  
-------------+-----------------+----------------+-----+--------------+-----------
           1 | R               | Rua das Flores |   1 |              | 01234-567
           1 | C               | Rua das Pedras | 100 | Conjunto 200 | 01234-567
           1 | C               | Rua das Pedras | 100 | Conjunto 200 | 01234-567

#PFK não limita a quantidade de endereços por não ser um identificador único, logo, podem ser #cadastrados para o mesmo cliente quantos endereços o tamanho da tabela admitir.


DELETE FROM tb_customer a
LEFT JOIN tb_customer_address b, b.id_customer = a.id_customer
WHERE a.cpf_cnpj = 88877766655;

SELECT id_customer FROM tb_customer 88877766655;
DELETE FROM tb_customer_address WHERE id_customer = 1;
DELETE FROM tb_customer WHERE id_customer = 1;

test=# SELECT * FROM tb_customer_address; id_customer | cd_address_type | street | lot | a_references | zip_code 
-------------+-----------------+--------+-----+--------------+----------
(0 rows)

test=# SELECT * FROM tb_customer;
 id_customer | nm_customer | cpf_cnpj 
-------------+-------------+----------
(0 rows)
