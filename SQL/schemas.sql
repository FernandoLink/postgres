create schema academico;

drop table aluno, categoria, curso, aluno_curso;


CREATE TABLE if not exists academico.aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

insert into academico.aluno (primeiro_nome, ultimo_nome, data_nascimento) 
values ('Fernando','Link','1970-04-22'),
('Henrique','Link','2007-10-15'),
('Luiza','Link','2005-03-03'),
('Valéria','Link','1976-02-07');

select * from academico.aluno;

------------------------------------------------------------------------------------------------------------

CREATE TABLE academico.categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

insert into academico.categoria (nome) values ('Front-end'), ('Programação'), ('Banco de Dados'), ('Data Science');

select * from academico.categoria;

------------------------------------------------------------------------------------------------------------

drop table curso;
CREATE TABLE academico.curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);

INSERT INTO academico.curso (nome, categoria_id) VALUES
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
CREATE TABLE academico.aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO academico.aluno_curso VALUES (1,4), (1,11), (2,1), (2,2), (3,4), (3,3),(4,4),(4,6),(4,5);

select * from academico.aluno_curso;

------------------------------------------------------------------------------------------------------------