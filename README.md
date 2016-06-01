# teste

Teste Java nos arquivos do repositório
<br>Teste SQL - respostas abaixo

**Teste SQL**

1. tb_customer: chave primária id_customer
   dm_address_type: chave primária cd_address_type

2. INSERT INTO tb_customer (id_customer, nm_customer, cpf_cnpj) VALUES (1, 'Joãozinho Silva', 88877766655);
   INSERT INTO tb_customer_address (id_customer, cd_address_type, street, lot, zip_code) VALUES (1, R, 'Rua das Flores', 1, 'CEP:01234-567');
   INSERT INTO tb_customer_address (id_customer, cd_address_type, street, lot, references, zip_code) VALUES (1, C, 'Rua das Pedras', 100, 'Conjunto 200', 'CEP:01234-567');

3. Três endereços. Um residencial, um comercial e um 'outros'.

4. SELECT id_customer FROM tb_customer WHERE cpf_cnpj = (CPF do cliente a ser removido);
   DELETE FROM tb_customer_address WHERE id_customer = (id obtido acima);
   DELETE FROM tb_customer WHERE id_customer = (id obtido acima);
