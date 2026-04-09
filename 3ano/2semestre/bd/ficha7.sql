-- Exercicio 1

create database if not exists fabrica;

Use fabrica;

-- exercicio 2

create table Familia(
	Id Int auto_increment,
    Designacao varchar(75) Not null,
    primary key(Id)
);
    
-- Drop Table Familia

-- Tabela Operaçoes

create table operacoes(
	Id Int auto_increment,
    Designacao varchar(75) Not null,
    custohora decimal(8,2) Not null,
    primary key(Id),
    constraint chk_custohora_positivo check (custohora>0)
);

-- Tabela tecnicos

create table tecnicos(
	Id Int auto_increment,
    nome varchar(75) ,
    funcao varchar(100) not null,
    curriculo text,
    responsavel Int,
    primary key(Id),
    constraint fk_tec_responsavel
		Foreign key (responsavel) references tecnicos(Id)
);

-- Tabela tecnicos operaçoes

create table tecnicos_operacoes(
	Tecnico Int,
    Operacao Int,
    primary key(Tecnico,Operacao),
    foreign key (Tecnico)references tecnicos(Id),
    foreign key (Operacao)references operacoes(Id)
);

-- adicionar o campo nif a tabrls yrvnicos

alter table tecnicos
	add column nif varchar(9);

-- exercicio 4

alter table tecnicos
	modify column nome varchar(150);
    
-- ex6

alter table tecnicos
	drop column curriculo ;
    
-- insert na tabea familia

insert into familia(designacao) value('electonica'); 



