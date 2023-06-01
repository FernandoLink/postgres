select NOW();

create database link;

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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

drop table curso;
create table curso (
id integer primary key,
nome varchar(255) not null
);

insert into curso (id, nome) values (2, 'oracle');
select * from curso;

drop table aluno;

create table aluno (
id serial primary key,
nome varchar(255) not null
);
insert into aluno (nome) values ('Luiza Link');
select * from aluno;

create table aluno_curso (
aluno_id integer not null,
curso_id integer not null,
primary key (aluno_id, curso_id),
foreign key (aluno_id)
references aluno (id)
on delete cascade
on update cascade,
foreign key (curso_id)
references curso (id)
on delete restrict
on update restrict)
;
insert into aluno_curso (aluno_id, curso_id) values (5, 2);

select * from aluno;
select * from curso;
select * from aluno_curso;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select aluno.nome as "Nome do Aluno", curso.nome as "nome do Curso" from aluno 
inner join aluno_curso on aluno_curso.aluno_id = aluno.id
inner join curso on curso.id = aluno_curso.curso_id;

insert into aluno (nome) values ('Gabriel');
insert into curso (id, nome) values (3,'Redes');

select aluno.nome as "Nome do Aluno", curso.nome as "nome do Curso" from aluno 
left join aluno_curso on aluno_curso.aluno_id = aluno.id
left join curso on curso.id = aluno_curso.curso_id;

select aluno.nome as "Nome do Aluno", curso.nome as "nome do Curso" from aluno 
right join aluno_curso on aluno_curso.aluno_id = aluno.id
right join curso on curso.id = aluno_curso.curso_id;

select aluno.nome as "Nome do Aluno", curso.nome as "nome do Curso" from aluno 
full join aluno_curso on aluno_curso.aluno_id = aluno.id
full join curso on curso.id = aluno_curso.curso_id;

select aluno.nome as "Nome do Aluno",
curso.nome as "Nome do Curso"
from aluno cross join curso;

insert into aluno (nome) values ('João');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

SELECT * FROM funcionarios ORDER BY nome;
SELECT * FROM funcionarios ORDER BY 3, 4, 2;
SELECT * FROM funcionarios ORDER BY 4 DESC, nome DESC, 2;
   

SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
    ORDER BY curso.nome, aluno.nome;


SELECT * FROM funcionarios ORDER BY id LIMIT 5 OFFSET 2;

SELECT COUNT (id),SUM(id),MAX(id),MIN(id),ROUND(AVG(id),2) FROM funcionarios;

SELECT DISTINCT nome, sobrenome FROM funcionarios ORDER BY nome;
SELECT nome, sobrenome, count(*) FROM funcionarios group by 1, sobrenome ORDER BY nome;


SELECT curso.nome,
        COUNT(aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY 1
    ORDER BY 1;
    
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

   
select * from aluno;
select * from aluno_curso;
select * from curso;

SELECT curso.nome,
COUNT(ALUNO.ID)
FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
    group by 1
    having COUNT(ALUNO.ID) = 0;
    
   SELECT nome,
       COUNT(id)
    FROM funcionarios
    GROUP BY nome
    HAVING COUNT(id) > 1;