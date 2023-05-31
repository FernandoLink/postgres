select NOW();

create database LINK;

drop database link;

select DATNAME from PG_DATABASE;

create table aluno (
    id SERIAL,
    nome VARCHAR(255),
    cpf CHAR(11),
    observacao TEXT,
    idade INTEGER,
    dinheiro NUMERIC(10,2),
    altura REAL,
    ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em timestamp
);

drop table aluno;

insert into ALUNO (nome, cpf, observacao, idade, dinheiro, altura, ativo, data_nascimento, hora_aula, matriculado_em) 
values ('Fernando Link', '81628927968','Eu sou foda pra caralho para véio de frescura e se coça',53,200000.00,1.81,true, '1970-04-22', '17:45:00', '2023-05-30 21:49:32');


update aluno set observacao = 'O segredo está na regularidade' where id = 1;

delete from aluno where id = 2;

select * from aluno;
select nome as "NOME do ALUNO", cpf as "CPF do ALUNO" from aluno;
select * from aluno where nome like '%er_%i%';
select * from aluno where nome not like '%er_%i%';
select * from aluno where nome != 'Fernando Link';
select * from aluno where nome <> 'Fernando Link';
select * from aluno where nome = 'Fernando Link';
select * from aluno where nome is null;
select * from aluno where nome is not null;
select * from aluno where idade >= 50;
select * from aluno where idade <= 53;
select * from aluno where idade >= 50;
select * from aluno where idade > 52;
select * from aluno where idade < 54;
select * from aluno where idade between 10 and 53;
select * from aluno where idade between 53 and 54;
select * from aluno where ativo = true; 
select * from aluno where ativo != false;
select * from aluno where nome = 'Fernando Link' and idade is not null;
select * from aluno where nome = 'Fernando Link' or ativo = true;








