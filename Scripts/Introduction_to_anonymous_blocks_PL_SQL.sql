BEGIN 
   -- Inicia o bloco PL/SQL. O bloco começa com a palavra-chave BEGIN e é o ponto de entrada para o código executável. 
 
   dbms_output.put_line('hello world'); 
   -- dbms_output.put_line é um procedimento da package DBMS_OUTPUT que exibe uma linha de texto na saída padrão (geralmente a janela de saída do SQL*Plus ou de uma ferramenta de desenvolvimento PL/SQL). 
   -- Aqui, a string 'hello world' é exibida. 
 
END; 
-- Marca o fim do bloco PL/SQL. Todo código executável deve estar entre BEGIN e END. 
/

DECLARE 
    l_today DATE := SYSDATE;  
    -- Declara uma variável chamada l_today do tipo DATE e a inicializa com a data e hora atuais do sistema usando SYSDATE. 
 
BEGIN 
    dbms_output.put_line( 
        'today is ' || TO_CHAR(l_today, 'Day') 
        -- Concatena a string 'today is ' com a representação formatada da data armazenada em l_today. 
        -- TO_CHAR(l_today, 'Day') converte a data em uma string que mostra o nome completo do dia da semana (ex: 'Monday'). 
    ); 
    -- Exibe a mensagem concatenada na saída padrão. A saída é visível na janela de saída do SQL*Plus ou em ferramentas PL/SQL. 
 
EXCEPTION 
    WHEN OTHERS THEN  
    -- Inicia a seção de tratamento de exceções. O bloco EXCEPTION captura e trata erros que ocorrem no bloco BEGIN. 
 
        dbms_output.put_line(SQLERRM); 
        -- Exibe a mensagem de erro associada à exceção que ocorreu. SQLERRM retorna a mensagem de erro mais recente. 
        -- Isso ajuda a identificar e diagnosticar problemas que possam ter ocorrido durante a execução do bloco BEGIN. 
 
END; 
-- Marca o fim do bloco PL/SQL. Todo código executável deve estar entre BEGIN e END. 
 
/

DECLARE 
    l_today DATE := SYSDATE; 
    -- Declara uma variável chamada l_today do tipo DATE e a inicializa com a data e hora atuais do sistema usando SYSDATE. 
 
BEGIN 
    IF TO_CHAR(l_today, 'D') < 4 THEN 
    -- Verifica se o dia da semana (usando o formato 'D' para número do dia da semana) é menor que 4. 
    -- Isso corresponderia aos dias de segunda a quarta-feira, considerando que 'D' retorna 1 para segunda-feira e 7 para domingo. 
     
        dbms_output.put_line( 
            'Have a wonderful week'); 
        -- Se a condição for verdadeira (segunda a quarta-feira), exibe a mensagem 'Have a wonderful week'. 
 
    ELSE 
        dbms_output.put_line( 
            'Enjoy the rest of the week'); 
        -- Se a condição for falsa (quinta-feira a domingo), exibe a mensagem 'Enjoy the rest of the week'. 
         
    END IF; 
    -- Finaliza o bloco IF-ELSE. 
 
    dbms_output.put_line('today is ' || 
        TO_CHAR(l_today, 'Day') || 
        ' day ' || TO_CHAR(l_today, 'D') || 
        ' of the week.'); 
    -- Exibe uma mensagem que inclui: 
    -- 'today is ' seguido pelo nome completo do dia da semana (ex: 'Monday'), 
    -- e a numeração do dia da semana (ex: '1' para segunda-feira), 
    -- e a string ' day ' para concatenar com a numeração do dia e ' of the week.'. 
     
END; 
-- Marca o fim do bloco PL/SQL. Todo o código executável deve estar entre BEGIN e END. 
 
/

DECLARE 
  howmany     INTEGER;  -- Declara uma variável 'howmany' do tipo INTEGER para armazenar o número de tabelas. 
  num_tables  INTEGER;  -- Declara uma variável 'num_tables' do tipo INTEGER para armazenar o resultado final. 
BEGIN 
  -- Início do bloco PL/SQL para processamento. 
 
  -- Executa uma consulta para contar o número total de tabelas no schema do usuário. 
  -- O resultado é armazenado na variável 'howmany'. 
  SELECT COUNT(*) INTO howmany 
  FROM USER_OBJECTS 
  WHERE OBJECT_TYPE = 'TABLE'; -- Filtra para contar apenas os objetos do tipo 'TABLE'. 
 
  -- Atribui o valor da variável 'howmany' à variável 'num_tables'. 
  num_tables := howmany;       -- Armazena o número de tabelas na variável 'num_tables'. 
 
  -- Exibe o número de tabelas formatado com separadores de milhar. 
  -- 'to_char' é utilizado para formatar o número com separadores de milhar (por exemplo, '1,000' para mil). 
  dbms_output.put_line ( 
    to_char(num_tables, '999G999G990') || ' tables' 
  ); -- Imprime a mensagem com o número total de tabelas. 
   
END; 
-- Fim do bloco PL/SQL. Todo o código executável deve estar entre BEGIN e END. 
 
/

DECLARE 
  l_table_count INTEGER := 0;  -- Declara uma variável 'l_table_count' do tipo INTEGER e a inicializa com 0. 
  -- Esta variável será usada para contar o número de tabelas no schema do usuário. 
BEGIN 
  -- Início do bloco PL/SQL para processamento. 
 
  -- Inicia um loop que percorre todas as tabelas no schema do usuário. 
  FOR c1 IN ( 
    SELECT table_name 
    FROM USER_TABLES 
    ORDER BY 1 
  ) LOOP 
    -- Para cada tabela encontrada, incrementa a contagem de tabelas. 
    l_table_count := l_table_count + 1; 
 
    -- Exibe o nome da tabela atual. 
    dbms_output.put_line(c1.table_name); 
  END LOOP; 
  -- Fim do loop que percorre todas as tabelas. 
 
  -- Verifica se a contagem de tabelas é igual a 0. 
  IF l_table_count = 0 THEN 
    -- Se não houver tabelas, exibe uma mensagem informando que o schema está vazio. 
    dbms_output.put_line('You have no tables in your schema'); 
  END IF; 
  -- Fim do bloco IF. 
 
END; 
-- Fim do bloco PL/SQL. Todo o código executável deve estar entre BEGIN e END. 

/

CREATE OR REPLACE PACKAGE pkg AUTHID DEFINER AS 
  table_row_count INTEGER;  -- Declara uma variável pública 'table_row_count' para armazenar o número de linhas de uma tabela. 
END; 
/

DECLARE 
  l_table_count integer := 0; 
  l_sql         varchar2(32767); 
BEGIN 
  for c1 in ( 
  SELECT table_name 
  FROM USER_TABLES 
  order by 1) loop 
      l_table_count := l_table_count + 1; 
      l_sql := 'begin select count(*) into pkg.table_row_count from "'||c1.table_name||'"; end;'; 
      execute immediate l_sql; 
      dbms_output.put_line(c1.table_name||' - '||to_char(pkg.table_row_count,'999G999G990')||' rows'); 
  end loop; 
  if l_table_count = 0 then 
     dbms_output.put_line('You have no tables in your schema'); 
  end if; 
END; 
/

