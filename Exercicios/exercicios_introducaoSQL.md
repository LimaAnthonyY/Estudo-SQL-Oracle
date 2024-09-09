# **Exercícios SQL**

#### **1. Criação de Tabelas**
1. **Crie uma tabela chamada `CUSTOMERS` com as seguintes colunas:**
   - `customer_id` (número inteiro, chave primária)
   - `first_name` (VARCHAR2 de 50 caracteres)
   - `last_name` (VARCHAR2 de 50 caracteres)
   - `email` (VARCHAR2 de 100 caracteres, único)
   - `phone` (VARCHAR2 de 15 caracteres)

2. **Crie uma tabela chamada `ORDERS` com as seguintes colunas:**
   - `order_id` (número inteiro, chave primária)
   - `customer_id` (número inteiro, chave estrangeira referenciando `CUSTOMERS`)
   - `order_date` (data)
   - `total_amount` (número com 2 casas decimais)

#### **2. Inserção de Dados**
3. **Insira 5 registros fictícios na tabela `CUSTOMERS`.**
4. **Insira 3 registros fictícios na tabela `ORDERS` associando-os a clientes existentes.**

#### **3. Consulta Básica**
5. **Selecione todos os registros da tabela `CUSTOMERS`.**
6. **Selecione `first_name` e `last_name` dos clientes cujo `last_name` seja "Smith".**

#### **4. Atualização de Dados**
7. **Atualize o `phone` do cliente com `customer_id` igual a 1 para um novo número.**
8. **Aumente o `total_amount` de todas as ordens em 10% para clientes cujo `first_name` seja "John".**

#### **5. Exclusão de Dados**
9. **Deletar todos os registros da tabela `ORDERS` onde `total_amount` é menor que 50.**
10. **Deletar o cliente com `customer_id` igual a 3 e todas as ordens associadas a ele.**

#### **6. Consultas Avançadas**
11. **Selecione todos os clientes que fizeram pedidos (`ORDERS`), incluindo o `order_id` e `order_date`.**
12. **Calcule o valor total de todas as ordens feitas por cada cliente e mostre o `customer_id`, `first_name`, `last_name` e `total_spent`.**

#### **7. Joins e Agregações**
13. **Liste todos os clientes junto com o total de suas ordens. Use um `JOIN` entre `CUSTOMERS` e `ORDERS`.**
14. **Encontre o cliente que fez o maior pedido e exiba `first_name`, `last_name` e `total_amount` do pedido.**

#### **8. Criação de Índices e Constraints**
15. **Adicione um índice único na coluna `email` da tabela `CUSTOMERS`.**
16. **Adicione uma restrição para garantir que o `total_amount` na tabela `ORDERS` não seja negativo.**

#### **9. Consultas com Funções Agregadas**
17. **Encontre o número total de pedidos (`ORDERS`) feitos por cada cliente.**
18. **Calcule a média de `total_amount` dos pedidos na tabela `ORDERS`.**

#### **10. Modificação de Tabelas**
19. **Adicione uma coluna `status` à tabela `ORDERS` para armazenar o status do pedido (VARCHAR2 de 20 caracteres).**
20. **Renomeie a coluna `phone` da tabela `CUSTOMERS` para `contact_number`.**

#### **11. Manipulação de Dados**
21. **Utilize uma subconsulta para encontrar todos os clientes que têm mais de uma ordem registrada.**
22. **Crie uma view chamada `CustomerOrderSummary` que mostre o `customer_id`, `first_name`, `last_name` e a soma dos `total_amount` das ordens.**

#### **12. Backup e Recuperação**
23. **Faça um backup da tabela `ORDERS` para um novo nome de tabela chamado `ORDERS_BACKUP`.**
24. **Recupere a tabela `ORDERS` do backup.**
