drop table filme;

create temporary table filme (
id serial primary key,
nome varchar(255) not null,
classificacao varchar(255) check (classificacao in ('LIVRE', '12_ANOS')));

create type classificacao as ENUM ('LIVRE', '12_ANOS');

create temporary table filme (
id serial primary key,
nome varchar(255) not null,
classificacao classificacao);

insert into filme (nome, classificacao) values ('Tron','12_ANOS');

select * from filme;

