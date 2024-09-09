
# Soluções

### Módulo 1: Blocos Anônimos

**Solução para o Exercício 1:**
```plsql
DECLARE
    l_data DATE := SYSDATE;
BEGIN
    dbms_output.put_line('Data atual: ' || TO_CHAR(l_data, 'dd/mm/yyyy'));
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Erro: ' || SQLERRM);
END;
/
```

**Solução para o Exercício 2:**
```plsql
DECLARE
    l_nome VARCHAR2(50) := 'PL/SQL';
BEGIN
    dbms_output.put_line('Comprimento do nome: ' || LENGTH(l_nome));
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Erro: ' || SQLERRM);
END;
/
```

### Módulo 2: Lógica Condicional

**Solução para o Exercício 3:**
```plsql
DECLARE
    l_dia DATE := SYSDATE;
BEGIN
    IF TO_CHAR(l_dia, 'D') IN ('1', '2') THEN
        dbms_output.put_line('Início da semana');
    ELSE
        dbms_output.put_line('Meio ou fim da semana');
    END IF;
    dbms_output.put_line('Hoje é ' || TO_CHAR(l_dia, 'Day'));
END;
/
```

**Solução para o Exercício 4:**
```plsql
DECLARE
    l_valor NUMBER := 75;
BEGIN
    IF l_valor >= 50 THEN
        dbms_output.put_line('Valor alto');
    ELSE
        dbms_output.put_line('Valor baixo');
    END IF;
    dbms_output.put_line('Valor: ' || l_valor);
END;
/
```

### Módulo 3: SQL Estático

**Solução para o Exercício 5:**
```plsql
DECLARE
    l_num_colunas INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO l_num_colunas
    FROM USER_TAB_COLUMNS;
    
    dbms_output.put_line('Número de colunas: ' || l_num_colunas);
END;
/
```

**Solução para o Exercício 6:**
```plsql
DECLARE
    l_contador INTEGER := 0;
BEGIN
    FOR c1 IN (
    SELECT table_name
    FROM USER_TABLES
    ORDER BY table_name) LOOP
        l_contador := l_contador + 1;
        dbms_output.put_line(c1.table_name);
    END LOOP;
    
    IF l_contador = 0 THEN
        dbms_output.put_line('Você não tem tabelas na sua schema');
    ELSE
        dbms_output.put_line('Número de tabelas: ' || l_contador);
    END IF;
END;
/
```

### Módulo 4: SQL Dinâmico

**Solução para o Exercício 7:**
```plsql
DECLARE
    l_num_linhas INTEGER;
    l_sql VARCHAR2(32767);
BEGIN
    l_sql := 'SELECT COUNT(*) FROM USER_TABLES';
    EXECUTE IMMEDIATE l_sql INTO l_num_linhas;
    
    dbms_output.put_line('Número de linhas: ' || l_num_linhas);
END;
/
```

**Solução para o Exercício 8:**
```plsql
CREATE OR REPLACE PACKAGE pkg AS
    row_count INTEGER;
END;
/

DECLARE
    l_sql VARCHAR2(32767);
BEGIN
    FOR c1 IN (
    SELECT table_name
    FROM USER_TABLES
    ORDER BY table_name) LOOP
        l_sql := 'BEGIN SELECT COUNT(*) INTO pkg.row_count FROM "' || c1.table_name || '"; END;';
        EXECUTE IMMEDIATE l_sql;
        dbms_output.put_line(c1.table_name || ' - ' || pkg.row_count || ' linhas');
    END LOOP;
END;
/
```
