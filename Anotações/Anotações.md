# Introduction to SQL

### **Módulo 1: Criando Tabelas**
- **Definição de Tabelas**: Unidades básicas de armazenamento de dados, definidas por um nome e um conjunto de colunas com nome, tipo de dados e largura (ou precisão e escala para números).
- **Integridade Referencial**: Relacionamentos entre tabelas são definidos com chaves estrangeiras.

### **Módulo 2: Criando Triggers**
- **Definição**: Triggers são procedimentos armazenados que são executados automaticamente em resposta a eventos específicos (INSERT, UPDATE, DELETE).
- **Usos Comuns**: Automatizar a geração de valores para chaves primárias e executar lógica adicional durante eventos DML.

### **Módulo 3: Inserindo Dados**
- **Inserção em Tabelas**: Primeiro insira dados na tabela pai antes de inserir dados na tabela filha, especialmente em tabelas com relacionamentos de chave estrangeira.

### **Módulo 4: Indexando Colunas**
- **Razões para Indexar**: Forçar valores únicos, melhorar desempenho de consultas e prevenir bloqueios de registros.
- **Tipos de Índices**: Índices para chaves primárias, únicas, e colunas frequentemente pesquisadas.

### **Módulo 5: Consultando Dados**
- **Consultas Básicas**: Utilizar SELECT para consultar dados em uma única tabela.
- **Joins**: Consultar dados relacionados entre tabelas usando junções.

### **Módulo 6: Adicionando Colunas**
- **Alteração de Estrutura**: Adicionar colunas a uma tabela existente usando ALTER TABLE.

### **Módulo 7: Consultando o Dicionário de Dados**
- **Consulta de Metadados**: Acessar informações sobre tabelas e colunas através das tabelas de dicionário de dados.

### **Módulo 8: Atualizando Dados**
- **Atualização de Registros**: Modificar dados existentes em uma tabela, com a opção de atualizar todos os registros ou apenas registros específicos.

### **Módulo 9: Consultas Agregadas**
- **Funções Agregadas**: Utilizar funções como COUNT, SUM, MIN e MAX para calcular estatísticas e sumarizar dados.

### **Módulo 10: Comprimindo Dados**
- **Objetivo da Compressão**: Economizar espaço em disco e reduzir o uso de memória, com impacto potencial na performance do processamento de dados.

### **Módulo 11: Deletando Dados**
- **Exclusão de Registros**: Remover um ou mais registros de uma tabela.

### **Módulo 12: Excluindo Tabelas**
- **Remoção de Tabelas**: Excluir tabelas e todos os seus sub-objetos, como índices e triggers, com a opção de remover restrições associadas.

### **Módulo 13: Recuperando Tabelas Excluídas**
- **Recuperação de Tabelas**: Usar a lixeira (Recycle Bin) para restaurar tabelas excluídas, se a configuração permitir.

Essas anotações cobrem os conceitos principais e procedimentos descritos no tutorial sobre criação e gerenciamento de tabelas em Oracle Database.
