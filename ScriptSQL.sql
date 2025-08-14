create database bdolimpico; 
use bdolimpico; 

create table modalidades( 

codModalidade int primary key auto_increment, 

nomeModalidade varchar(50) 

); 

create table provas( 

codProva int primary key auto_increment, 
nomeProva varchar(100), 
codModalidade int,
foreign key(codModalidade) references modalidades(codModalidade)

); 

select * from modalidades where codModalidade = 1;
select * from provas where nomeProva = 'Salto Triplo Masculino';


CREATE TABLE estados ( 

  codEstado int primary key auto_increment, 

  nomeEstado varchar(255) 

); 

create table cidades( 

codCidade int primary key auto_increment, 

nomeCidade varchar(255) NOT NULL, 

codEstado int 

); 

CREATE TABLE edicao (
  codedicao int primary key auto_increment,
  ano int,
  sede varchar(30)
);

CREATE TABLE atletas (
  codAtleta int primary key auto_increment,
  nomeAtleta varchar(255),
  dataNascimento varchar(20),
  sexo char(1),
  altura decimal(5,2) DEFAULT NULL,
  peso decimal(5,2) DEFAULT NULL,
  codCidade int,
  foreign key(codCidade) references cidades(codCidade)
);


select * from atletas;


select * from Edicao;

select * from cidades;
insert into cidades(nomeCidade,codEstado) values
('Rio de Janeiro',43),
('Brasilia',17);
select * from provas;


Insert into resultadosatletas(codAtleta,codProva,edicao,resultado,medalha) values
(13,115,21,'1','OURO'),
(13,115,22,'1','OURO');





CREATE TABLE resultadosatletas (
  codAtletaRes int primary key auto_increment,
  codAtleta int,
  codProva int,
  edicao int,
  resultado varchar(255) DEFAULT NULL,
  medalha varchar(255) DEFAULT NULL,
  foreign key(codAtleta) references atletas(codAtleta),
  foreign key (codProva) references provas(codProva),
  foreign key(edicao) references edicao(codedicao)
);

select * from atletas;





Insert into resultadosatletas(codAtleta,codProva,edicao,resultado,medalha) values
(3,109,24,"Eliminada na primeira fase",null),
(3,105,24,"Eliminada na primeira fase",null),
(3,113,25,"7",null),
(3,102,25,"Eliminada na primeira fase",null),
(3,110,25,"Eliminada na primeira fase",null);

select * from modalidades;
select * from provas;
select * from resultadosatletas;
select * from provas;






Insert into resultadosatletas(codAtleta,codProva,edicao,resultado,medalha) values
(8,115,17,"4",null),
(8,115,18,"3","BRONZE"),
(8,115,19,"3","BRONZE"),
(8,115,20,"4",null),
(8,115,21,"1","OURO");

select * from atletas;

Insert into resultadosatletas(codAtleta,codProva,edicao,resultado,medalha) values
(1,60,6,"8",null),
(1,60,7,"1","OURO"),
(1,60,8,"1","OURO"),
(1,60,9,"14",null);



SELECT distinct
    a.nomeAtleta, 
    a.dataNascimento, 
    c.nomeCidade AS cidadeNascimento, 
    e.nomeEstado AS estadoNascimento, 
    m.nomeModalidade, 
    p.nomeProva, 
    ra.resultado, 
    ra.medalha, 
    ed.ano AS anoEdicao, 
    ed.sede 
FROM resultadosatletas ra 
INNER JOIN atletas a ON ra.codAtleta = a.codAtleta 
INNER JOIN cidades c ON a.codCidade = c.codCidade 
INNER JOIN estados e ON c.codEstado = e.codEstado 
INNER JOIN provas p ON ra.codProva = p.codProva 
INNER JOIN modalidades m ON p.codModalidade = m.codModalidade 
INNER JOIN edicao ed ON ra.edicao = ed.codedicao; 


Insert into resultadosatletas(codAtleta,codProva,edicao,resultado,medalha) values
(9,132,23,"Não se classificou para a final",null),
(9,126,23,"11",null),
(9,124,23,"8",null),
(9,134,23,"Não se classificou para a final",null),
(9,121,23,"Não se classificou para a final",null),
(9,121,24,"Não se classificou para a final",null),
(9,130,24,"1","OURO"),
(9,126,24,"2","PRATA"),
(9,132,24,"5",null),
(9,124,25,"3","BRONZE"),
(9,128,25,"2","PRATA"),
(9,132,25,"1","OURO"),
(9,130,25,"2","PRATA"),
(9,134,25,"4",null);


SELECT DISTINCT a.codAtleta, a.nomeAtleta, a.dataNascimento, a.sexo,  
a.codCidade, m.nomeModalidade 
FROM resultadosatletas r
Join provas p on p.codProva = r.codProva 
JOIN atletas a ON a.codAtleta = r.codAtleta 
JOIN modalidades m ON m.codModalidade = p.codModalidade 
WHERE r.edicao = 17;