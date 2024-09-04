create table DEPARTMENTS (   -- Início da definição da tabela  
  deptno        number,  -- Coluna para o número do departamento (tipo numérico)  
  name          varchar2(50) not null,  -- Coluna para o nome do departamento (máx. 50 caracteres), não pode ser nula   
  location      varchar2(50),  -- Coluna para a localização do departamento (máx. 50 caracteres), pode ser nula   
  constraint pk_departments primary key (deptno)  -- Definir a coluna deptno como chave primária, garantindo unicidade e não nulidade   
);

create table EMPLOYEES (    
  empno             number,  -- Coluna para o número do empregado (tipo numérico)    
  name              varchar2(50) not null,  -- Coluna para o nome do empregado (máx. 50 caracteres), não pode ser nula    
  job               varchar2(50),  -- Coluna para o cargo do empregado (máx. 50 caracteres), pode ser nula    
  manager           number,  -- Coluna para o número do gerente do empregado (tipo numérico), pode ser nula    
  hiredate          date,  -- Coluna para a data de contratação do empregado    
  salary            number(7,2),  -- Coluna para o salário do empregado, com até 7 dígitos no total e 2 casas decimais    
  commission        number(7,2),  -- Coluna para a comissão do empregado, com até 7 dígitos no total e 2 casas decimais    
  deptno            number,  -- Coluna para o número do departamento do empregado (tipo numérico), pode ser nula    
  constraint pk_employees primary key (empno),  -- Definir a coluna empno como chave primária, garantindo unicidade e não nulidade    
  constraint fk_employees_deptno foreign key (deptno)  -- Definir a coluna deptno como chave estrangeira    
      references DEPARTMENTS (deptno)  -- Referenciar a coluna deptno na tabela DEPARTMENTS  
);

create or replace trigger DEPARTMENTS_BIU 
    before insert or update on DEPARTMENTS  -- Este trigger é acionado antes de uma operação de INSERT ou UPDATE na tabela DEPARTMENTS 
    for each row  -- O trigger será aplicado a cada linha afetada pela operação 
begin 
    -- Verificar se a operação é um INSERT e se o valor de deptno é nulo 
    if inserting and :new.deptno is null then 
        -- Gerar um novo valor para deptno usando sys_guid() e converter para um número 
        -- Note que sys_guid() gera um valor único em formato hexadecimal. A conversão direta pode não ser prática, 
        -- então estamos usando apenas uma parte do GUID para criar um número. 
        :new.deptno := to_number(substr(sys_guid(), 1, 15), 'XXXXXXXXXXXXXXX');  -- Extrai uma substring do GUID e converte em número 
    end if; 
end; 

/

create or replace trigger EMPLOYEES_BIU  
    before insert or update on EMPLOYEES  -- Este trigger é acionado antes de uma operação de INSERT ou UPDATE na tabela EMPLOYEES  
    for each row  -- O trigger é aplicado a cada linha afetada pela operação  
begin  
    -- Verificar se a operação é um INSERT e se o valor de empno é nulo  
    if inserting and :new.empno is null then  
        -- Gerar um novo valor para empno usando sys_guid() e converter para número  
        :new.empno := to_number(sys_guid(),   
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');  -- sys_guid() gera um valor único, que é convertido em número  
    end if;  
end; 
/

insert into departments (name, location) values  
   ('Finance', 'New York' -- Inserir um departamento chamado 'Finance' localizado em 'New York'  
);

insert into departments (name, location) values  
   ('Development', 'San Jose' -- Inserir um departamento chamado 'Development' localizado em 'San Jose'  
);

select *  -- Seleciona todas as colunas da tabela 
from departments -- Especifica a tabela 'departments' da qual os dados serão recuperados ;

insert into EMPLOYEES  
   (name, job, salary, deptno)  
   values 
   ('Sam Smith',  -- Nome do empregado 
    'Programmer',  -- Cargo do empregado 
    5000,  -- Salário do empregado 
    (select deptno  -- Subconsulta para obter o deptno baseado no nome do departamento 
     from departments  
     where name = 'Development'))  -- Nome do departamento utilizado para encontrar o deptno ;

insert into EMPLOYEES  
   (name, job, salary, deptno)  
   values 
   ('Mara Martin',  -- Nome do empregado 
    'Analyst',  -- Cargo do empregado 
    6000,  -- Salário do empregado 
    (select deptno  -- Subconsulta para obter o deptno baseado no nome do departamento 
     from departments  
     where name = 'Finance'))  -- Nome do departamento utilizado para encontrar o deptno ;

insert into EMPLOYEES  
   (name, job, salary, deptno)  
   values 
   ('Yun Yates',  -- Nome do empregado 
    'Analyst',  -- Cargo do empregado 
    5500,  -- Salário do empregado 
    (select deptno  -- Subconsulta para obter o deptno baseado no nome do departamento 
     from departments  
     where name = 'Development'))  -- Nome do departamento utilizado para encontrar o deptno ;

select table_name "Table",  -- Nome da tabela 
       index_name "Index",  -- Nome do índice 
       column_name "Column",  -- Nome da coluna no índice 
       column_position "Position"  -- Posição da coluna no índice 
from  user_ind_columns  -- Visualizar colunas dos índices do usuário 
where table_name = 'EMPLOYEES'  -- Filtro para a tabela EMPLOYEES 
   or table_name = 'DEPARTMENTS'  -- Filtro para a tabela DEPARTMENTS 
order by table_name,  -- Ordenar pelo nome da tabela 
         column_name,  -- Ordenar pelo nome da coluna 
         column_position -- Ordenar pela posição da coluna no índice ;

create index employee_dept_no_fk_idx  -- Nome do índice 
on employees (deptno)  -- Tabela e coluna para o índice ;

create unique index employee_ename_idx  -- Nome do índice 
on employees (name)  -- Tabela e coluna para o índice ;

select *  -- Seleciona todas as colunas da tabela 
from departments  -- Especifica a tabela 'departments' da qual os dados serão recuperados ;

select *  -- Seleciona todas as colunas da tabela 
from departments  -- Especifica a tabela 'departments' da qual os dados serão recuperados ;

select e.name employee,  -- Nome do empregado 
       d.name department,  -- Nome do departamento 
       e.job,  -- Cargo do empregado 
       d.location  -- Localização do departamento 
from departments d, employees e  -- Especificar as tabelas para a junção 
where d.deptno = e.deptno(+)  -- Junção externa à esquerda entre departamentos e empregados 
order by e.name  -- Ordenar os resultados pelo nome do empregado ;

select e.name employee,  -- Nome do empregado 
       (select name  -- Subconsulta para obter o nome do departamento 
        from departments d  
        where d.deptno = e.deptno) department,  -- Nome do departamento 
       e.job  -- Cargo do empregado 
from employees e  -- Tabela dos empregados 
order by e.name  -- Ordenar os resultados pelo nome do empregado ;

alter table EMPLOYEES  -- Inicia a alteração da tabela EMPLOYEES 
add country_code varchar2(2)  -- Adiciona uma coluna chamada country_code do tipo VARCHAR2 com comprimento 2 ;

select table_name,  -- Nome da tabela 
       tablespace_name,  -- Nome do tablespace onde a tabela está armazenada 
       status  -- Status da tabela 
from user_tables  -- Visualizar tabelas do usuário 
where table_name = 'EMPLOYEES'  -- Filtro para a tabela EMPLOYEES ;

select column_id,  -- Identificador da coluna 
       column_name,  -- Nome da coluna 
       data_type  -- Tipo de dado da coluna 
from user_tab_columns  -- Visualizar colunas das tabelas do usuário 
where table_name = 'EMPLOYEES'  -- Filtro para a tabela EMPLOYEES 
order by column_id  -- Ordenar os resultados pelo identificador da coluna ;

update employees  -- Tabela a ser atualizada 
set country_code = 'US'  -- Novo valor para a coluna country_code ;

update employees  -- Tabela a ser atualizada 
set commission = 2000  -- Novo valor para a coluna commission 
where name = 'Sam Smith'  -- Condição para selecionar o empregado específico ;

select name,  -- Nome do empregado 
       country_code,  -- Código do país do empregado 
       salary,  -- Salário do empregado 
       commission  -- Comissão do empregado 
from employees  -- Tabela dos empregados 
order by name  -- Ordenar os resultados pelo nome do empregado ;

select  
      count(*) employee_count,  -- Contar o número total de empregados 
      sum(salary) total_salary,  -- Somar todos os salários dos empregados 
      sum(commission) total_commission,  -- Somar todas as comissões dos empregados 
      min(salary + nvl(commission,0)) min_compensation,  -- Menor valor de compensação (salário + comissão, considerando comissão como 0 se nula) 
      max(salary + nvl(commission,0)) max_compensation  -- Maior valor de compensação (salário + comissão, considerando comissão como 0 se nula) 
from employees  -- Fonte dos dados ;

alter table EMPLOYEES compress for oltp  -- Compressão para OLTP ;

alter table DEPARTMENTS compress for oltp  -- Compressão para OLTP ;

DELETE FROM employees  -- Especifica a tabela da qual os registros serão excluídos 
WHERE name = 'Sam Smith' -- Define a condição para a exclusão: somente os registros onde o valor da coluna "name" é exatamente 'Sam Smith' serão removidos. ;

select object_name,               -- Nome do objeto na lixeira 
       original_name,             -- Nome original do objeto antes de ir para a lixeira 
       type,                      -- Tipo do objeto (por exemplo, tabela, índice) 
       can_undrop,                -- Indica se o objeto pode ser recuperado da lixeira 
       can_purge                  -- Indica se o objeto pode ser excluído permanentemente 
from recyclebin                -- Consulta a tabela de lixeira do banco de dados ;

flashback table DEPARTMENTS to before drop -- Restaura a tabela DEPARTMENTS 


select object_name,               -- Nome do objeto na lixeira 
       original_name,             -- Nome original do objeto antes de ir para a lixeira 
       type,                      -- Tipo do objeto (por exemplo, tabela, índice) 
       can_undrop,                -- Indica se o objeto pode ser recuperado da lixeira 
       can_purge                  -- Indica se o objeto pode ser excluído permanentemente 
from recyclebin                -- Consulta a tabela de lixeira do banco de dados ;

flashback table EMPLOYEES to before drop -- Restaura a tabela EMPLOYEES
;


select count(*) departments              -- Conta o total de registros na tabela DEPARTMENTS 
from departments                       -- Da tabela DEPARTMENTS ;

select count(*) employees               -- Conta o total de registros na tabela EMPLOYEES 
from employees                        -- Da tabela EMPLOYEES ;

