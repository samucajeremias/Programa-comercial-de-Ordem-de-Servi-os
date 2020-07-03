create database dbinfox;

use dbinfox;

-- cria tabela de usuarios
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

describe tbusuarios;
-- a linha abaixo insere dados na tabela
-- create
-- insere dados
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(1, 'Samuel Ribeiro', '9999-9999', 'samucajeremias', 'samu27ca');

-- seleciona tabela
select * from tbusuarios;

-- insere dados
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(2, 'Ramon Ribeiro', '9999-9999', 'ramonrib2', '12345');
insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Ozanan Ribeiro', '9999-9999', 'ozananrib1', '123456');

-- a linha abaixo modifica dados na tabela (CRUD)
update tbusuarios set login='admin' where iduser =2;
update tbusuarios set login='ramonribeiro3' where iduser =2;
update tbusuarios set login='admin' where iduser =1;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- deletar usuario ozanan
delete from tbusuarios where iduser=3; 

select * from tbusuarios;

-- cria tabela de clientes
create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(50) not null, 
fonecli varchar(50) not null,
emailcli varchar(50)
);

drop table tbclientes;
-- exibe tabela clientes
describe tbclientes;

select * from tbclientes;

insert into tbclientes(nomecli, endcli, fonecli, emailcli)
values('Rosalia Aparecida', 'Professora Isis', '8888-8888', 'rosalia@gmail.com');
insert into tbclientes(nomecli, endcli, fonecli, emailcli)
values('Victor Hugo', 'Professora Isis', '8888-8888', 'vh@gmail.com');
select * from tbclientes;

delete from tbclientes where nomecli ='Victor Hugo';
delete from tbclientes where idcli =2;

select *from tbclientes where nomecli like 's%';



-- cria tabela de OPerações de Sistema
-- foreign key = chave estrangeria para relacionamentos de tabelas. No caso, relaciona tabela cliente com tabela OS.
create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null, 
servico varchar(150), 
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

delete from tbos where idcli=2;

select * from tbos;

describe tbos;

insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values('notebook', 'placa mae com defeito','trocar placa', 'Samuel', 87.50, 2);

-- o codigo abaixo traz informacoes de duas tabelas
-- faz a juncao das duas tabelas onde os id's do cliente sao iguais 
-- select = seleciona, as = como, from = de, on = na
-- O e C são variáveis criadas para receber dados da tabela OS e Cliente, mas poderiam ser outros nomes das variaveis

select 
O.os, equipamento, defeito, servico, valor, 
C.nomecli, fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);

insert into tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Ozanan', '9999-9999', 'zanan', 'zanan');

-- para adicionar um campo na tabela tbusuarios
select * from tbusuarios;

alter table tbusuarios add column perfil varchar(20) not null;

describe tbusuarios;

-- a linha abaixo remove uma colouna de uma tabela
alter table tbusuarios drop column perfil;

-- adiciona perfil admin nos id's 1,2 e  perfil user no id 3
update tbusuarios set perfil='admin' where iduser=1;
update tbusuarios set perfil='admin' where iduser=2;
update tbusuarios set perfil='user' where iduser=3;

select idcli,nomecli,fonecli from tbclientes where nomecli like 'sa%';

-- a linha abaixo cria um apelido aos campos da tabela
select idcli as Id, nomecli as Nome, fonecli as Telefone from tbclientes where nomecli like 'sa%';

-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição optimize
alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;

describe tbos;

select * from tbos;

-- a instrução abaixo seleciona e ordena por nome todos os clientes cadastrados 
select *from tbclientes order by nomecli;