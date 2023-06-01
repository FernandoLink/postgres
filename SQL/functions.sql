
select (primeiro_nome || ' ' || ultimo_nome) as "Nome Completo" from aluno;

select concat('Fernando', ' ','Link', null);

select upper('Fernando Link');
select lower('Fernando Link');

---------------------------------------------------------------------------------------------

select (primeiro_nome || ' ' || ultimo_nome) as "Nome Completo",
NOW()::DATE, NOW()::TIME,
        extract(year from AGE(data_nascimento)) as Idade 
       from aluno; 
       
---------------------------------------------------------------------------------------------

select pi();
select @ -9123848.238484;
select random();

---------------------------------------------------------------------------------------------

select to_char(now(), 'DD/MONTH/YYYY HH24:MM:SS BC');
select TO_CHAR(128.3::real, '999D99');

---------------------------------------------------------------------------------------------


      