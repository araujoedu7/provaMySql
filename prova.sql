create DATABASE Universidade;
use universidade;
create table Alunos(
MAT int not null primary key,
nome varchar(60) not null,
endereco varchar(40) not null,
cidade varchar(30) not null
);

create table Disciplinas(
COD_DISC varchar (10) not null primary key,
nome_disc varchar(30) not null,
carga_hor smallint not null
);

create table Professores (
COD_PROF int not null primary key,
nome varchar(60) not null,
endereco varchar(40) not null,
cidade varchar(30) not null
);

create table Turma (

COD_DISC varchar (10) not null ,
foreign key (COD_DISC) references Disciplinas (COD_DISC),

COD_TURMA smallint not null,

COD_PROF int not null,
foreign key (COD_PROF) references Professores (COD_PROF),

ano smallint not null ,
horario smallint not null,
CONSTRAINT pk_CODSano primary key (COD_DISC, COD_TURMA, COD_PROF, ano)
);

create table Historico (

MAT int,
COD_DISC varchar(10),
COD_TURMA smallint,
COD_PROF int,
ano smallint,

frequencia smallint not null,
nota smallint not null,
horario smallint not null
);

ALTER TABLE historico ADD CONSTRAINT ano_fk FOREIGN KEY (COD_DISC, COD_TURMA, COD_PROF, ano) REFERENCES Turma (COD_DISC, COD_TURMA, COD_PROF, ano);
alter table historico add constraint mat_fk foreign key (MAT) references Alunos (MAT);


desc Historico;

insert into Alunos values(2015010101, "JOSE DE ALENCAR", "RUA DAS ALMAS", "NATAL");
insert into Alunos values(2015010102, "JOÃO JOSÉ", "AVENIDA RUY CARNEIRO", "JOÃO PESSOA");
insert into Alunos values(2015010103, "MARIA JOAQUINA", "RUA CARROSSEL", "RECIFE");
insert into Alunos values(2015010104, "MARIA DAS DORES", "RUA DAS LADEIRAS", "FORTALEZA");
insert into Alunos values(2015010105, "JOSUÉ CLAUDINO DOS SANTOS", "CENTRO", "NATAL");
insert into Alunos values(2015010106, "JOSUÉLISSON CLAUDINO DOS SANTOS", "CENTRO", "NATAL");


insert into Disciplinas values("BD", "BANCO DE DADOS", 100);
insert into Disciplinas values("POO", "PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS", 100);
insert into Disciplinas values("WEB", "AUTORIA WEB", 50);
insert into Disciplinas values("ENG", "ENGENHARIA DE SOFTWARE", 80);


insert into Professores values(212131, "NICKERSON FERREIRA", "RUA MANAÍRA", "JOÃO PESSOA");
insert into Professores values(122135, "ADORILSON BEZERRA", "AVENIDA SALGADO FILHO", "NATAL");
insert into Professores values(192011, "DIEGO OLIVEIRA", "AVENIDA ROBERTO FREIRE", "NATAL");


alter table historico modify horario varchar(10);

insert into Turma values("BD", 1, 212131, 2015, "11H-12H");
insert into Turma values("BD", 2, 212131, 2015, "13H-14H");
insert into Turma values("POO", 1, 192011, 2015, "08H-09H");
insert into Turma values("WEB", 1, 192011, 2016, "07H-09H");
insert into Turma values("ENG", 1, 122135, 2015, "10H-11H");


insert into Historico values(2015010101, "BD", 1, 212131, 2015, 90, 10, "11H-12H");
insert into Historico values(2015010102, "POO", 1, 192011, 2015, 90, 10, "08H-09H");

desc historico;

















