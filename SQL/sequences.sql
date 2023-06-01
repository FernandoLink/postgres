create sequence eu_criei;

select currval('eu_criei');
select nextval('eu_criei');

drop table auto;

create temporary table auto (
   id integer primary key default nextval('eu_criei'),
	nome varchar(30) not null
);

insert into auto (nome) values ('Fernando Link');
insert into auto (id, nome) values (2,'Valeria Link');
insert into auto (nome) values ('Fernando Link');
insert into auto (id, nome) values (4,'Valeria Link');

select * from auto;