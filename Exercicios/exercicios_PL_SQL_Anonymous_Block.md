# Exercícios

### Módulo 1: Blocos Anônimos

**Exercício 1:**
Escreva um bloco anônimo que declare uma variável `l_data` e atribua a data atual (`SYSDATE`). Em seguida, exiba a data atual formatada como 'dd/mm/yyyy'. Adicione um tratamento de exceção que exiba uma mensagem de erro caso ocorra alguma exceção.

**Exercício 2:**
Crie um bloco anônimo que declare uma variável `l_nome` do tipo `VARCHAR2` e atribua o valor 'PL/SQL'. Em seguida, exiba o comprimento da string armazenada na variável `l_nome`. Se ocorrer alguma exceção, exiba a mensagem de erro.

### Módulo 2: Lógica Condicional

**Exercício 3:**
Escreva um bloco anônimo que declare uma variável `l_dia` e atribua a data atual (`SYSDATE`). Se o dia da semana for segunda-feira (1) ou terça-feira (2), exiba "Início da semana". Caso contrário, exiba "Meio ou fim da semana". Adicione uma linha para exibir o nome completo do dia da semana.

**Exercício 4:**
Crie um bloco anônimo que declare uma variável `l_valor` e atribua o valor 75. Se `l_valor` for maior ou igual a 50, exiba "Valor alto". Caso contrário, exiba "Valor baixo". Adicione uma linha que exiba o valor da variável.

### Módulo 3: SQL Estático

**Exercício 5:**
Escreva um bloco anônimo que utilize `SELECT INTO` para contar o número de colunas na tabela `USER_TAB_COLUMNS` e exiba esse número.

**Exercício 6:**
Crie um bloco anônimo que utilize um cursor FOR LOOP para listar todos os nomes de tabelas na sua schema `USER_TABLES`. Adicione uma contagem das tabelas e exiba a mensagem apropriada se não houver tabelas.

### Módulo 4: SQL Dinâmico

**Exercício 7:**
Escreva um bloco anônimo que declare uma variável `l_sql` e construa uma consulta dinâmica para contar o número de linhas na tabela `USER_TABLES`. Execute a consulta dinâmica e exiba o resultado.

**Exercício 8:**
Crie um bloco anônimo que utilize um cursor FOR LOOP para iterar sobre todas as tabelas na sua schema e construa uma consulta dinâmica para contar o número de linhas em cada tabela. Exiba o nome da tabela e o número de linhas.
