/** Criar base de dados: empresa
create database empresa;
use empresa;
*/
drop table if exists DEPARTAMENTO, EMPREGADO, PROJETO, DEPENDENTE, DEPTO_LOCALIZACOES, TRABALHA_EM;


create table DEPARTAMENTO (
	DNUMERO int not null auto_increment,
    DNOME varchar(65),
    GERDATAINICIO varchar(10),
    GERSSN int,
    primary key(DNUMERO)
);

create table EMPREGADO (
	SSN int not null,
	PNOME varchar(65),
    MINICIAL varchar(65),
    UNOME varchar(65),
    DATANASC varchar(10),
    ENDERECO varchar(255),
    SEXO varchar(65),
    SALARIO float,
    DNUMERO int,	-- Numero de departamento
    SUPERSSN int,
    primary key(SSN)
);

create table DEPENDENTE(
	NOME_DEPENDENTE varchar(65),
    ESSN int,
    SEXO varchar(65),
    DATANASC varchar(65),
    PARENTESCO VARCHAR(65),
    primary key(NOME_DEPENDENTE, ESSN)
);

create table PROJETO(
	PNUMERO int,
    PJNOME varchar(65),
    PLOCALIZACAO varchar(65),
    DNUMERO int,
    primary key (PNUMERO)
);

create table DEPTO_LOCALIZACOES(
	DLOCALIZACAO varchar(65),
    DNUMERO int,
    primary key(DNUMERO, DLOCALIZACAO)
);

create table TRABALHA_EM(
	ESSN int,
    PNUMERO int,
    HORAS int,
    primary key(ESSN, PNUMERO)
);

alter table DEPARTAMENTO add constraint DEPTO_EMP foreign key(GERSSN) references EMPREGADO(SSN)
	on delete cascade on update cascade;
alter table EMPREGADO add constraint EMP_DEPTO foreign key(DNUMERO) references DEPARTAMENTO(DNUMERO)
	on delete cascade on update cascade;
-- alter table EMPREGADO add constraint EMP_EMP foreign key(SUPERSSN) references EMPREGADO(SUPERSSN);
alter table DEPENDENTE add constraint DEP_EMP foreign key(ESSN) references EMPREGADO(SSN)
	on delete cascade on update cascade;
alter table PROJETO add constraint PROJ_DEPTO foreign key(DNUMERO) references DEPARTAMENTO(DNUMERO)
	on delete cascade on update cascade;
alter table DEPTO_LOCALIZACOES add constraint DEPTOLOC_DEPTO foreign key(DNUMERO) references DEPARTAMENTO(DNUMERO)
	on delete cascade on update cascade;
alter table TRABALHA_EM add constraint TRAB_EMP foreign key(ESSN) references EMPREGADO(SSN)
	on delete cascade on update cascade;
alter table TRABALHA_EM add constraint TRAB_PROJ foreign key(PNUMERO) references PROJETO(PNUMERO)
	on delete cascade on update cascade;

show tables;
select * from empregado;

