------------------------------------------------------------------------------------------------------------

CREATE DATABASE link;

------------------------------------------------------------------------------------------------------------

DROP TABLE aluno;
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) 
values ('Fernando','Link','1970-04-22'),
('Henrique','Link','2007-10-15'),
('Luiza','Link','2005-03-03'),
('Valéria','Link','1976-02-07');

select * from aluno;

------------------------------------------------------------------------------------------------------------

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

insert into categoria (nome) values ('Front-end'), ('Programação'), ('Banco de Dados'), ('Data Science');

select * from categoria;

------------------------------------------------------------------------------------------------------------

drop table curso;
CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

INSERT INTO curso (nome, categoria_id) VALUES
    ('HTML',1),
    ('CSS',1),
    ('JS',1),
    ('PHP',2),
    ('Java',2),
    ('C++',2),
    ('PostgreSQL',3),
    ('MySQL',3),
    ('Oracle',3),
    ('SQL Server',3),
    ('SQLite',3),
    ('Pandas',4),
    ('Machine Learning',4),
    ('Power BI',4);

select * from curso;

------------------------------------------------------------------------------------------------------------
drop table aluno_curso;
CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno_curso VALUES (1,4), (1,11), (2,1), (2,2), (3,4), (3,3),(4,4),(4,6),(4,5);

select * from aluno_curso;

------------------------------------------------------------------------------------------------------------

drop table a;
CREATE TEMPORARY TABLE a (
coluna1 varchar(255) NOT NULL CHECK (coluna1 <> ''),
coluna2 varchar(255) not null,
unique(coluna1, coluna2)
)

insert into a values ('Fernando Link','Fernando Link');

alter table a rename to teste;

alter table teste rename coluna1 to primeira_coluna;

select * from teste;