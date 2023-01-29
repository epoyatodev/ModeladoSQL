create schema practica authorization bxoazbxn;


create table if not exists practica.modelo(
	id varchar(10) not null,
	nombre varchar(50) not null,
	constraint modelo_PK primary key(id)
);

insert into practica.modelo(id, nombre) values
('001', 'S40'),
('002', 'Leon'),
('003', 'Clio'),
('004', 'Ibiza');

create table if not exists practica.marca(
	id varchar(10) not null,
	idModelo varchar(10) not null,
	nombre varchar(50) not null,
	constraint marca_PK primary key(id)

	
);

alter table  practica.marca add constraint marca_modelo_FK foreign key(idModelo) references
practica.modelo(id) on delete cascade;

insert into practica.marca(id, idModelo, nombre) values
('001', '001', 'Volvo'),
('002', '002', 'Seat'),
('003', '003', 'Renault'),
('004', '004', 'Seat');



create table if not exists practica.grupo_empresarial(
	id varchar(10) not null,
	idMarca varchar(10) not null,
	nombre varchar(50) not null,
	constraint grupo_empresarial_PK primary key(id)

);

alter table  practica.grupo_empresarial add constraint grupo_empresarial_marca_FK foreign key(idMarca) references
practica.marca(id) on delete cascade;

insert into practica.grupo_empresarial(id, idMarca, nombre) values
('001', '001', 'Geely'),
('002', '002', 'Grupo Volkswagen'),
('003', '003', 'Alianza'),
('004', '004', 'Grupo Volkswagen');



create table if not exists practica.color(
	id varchar(10) not null,
	nombre varchar(50) not null,
	constraint color_PK primary key(id)
);

insert into practica.color(id, nombre) values
('001', 'Verde'),
('002', 'Rojo'),
('003', 'Azul'),
('004', 'Negro'),
('005', 'Blanco');


create table if not exists practica.aseguradora(
	id varchar(10) not null,
	nombre varchar(50) not null,
	constraint aseguradora_PK primary key(id)
);

insert into practica.aseguradora(id, nombre) values
('001', 'Allianz'),
('002', 'Maphre'),
('003', 'Axa'),
('004', 'Pelayo');


create table if not exists practica.coche(
	id varchar(10) not null,
	idMarca varchar(10) not null,
	idColor varchar(10) not null,
	idAseguradora varchar(10) not null,
	matricula varchar(50) not null,
	kilometros int not null,
	numPoliza varchar(50) not null,
	fechaCompra date not null,
	constraint coche_PK primary key(id)
);

alter table  practica.coche add constraint coche_marca_FK foreign key(idMarca) references
practica.marca(id) on delete cascade;

alter table  practica.coche add constraint coche_color_FK foreign key(idColor) references
practica.color(id) on delete cascade;

alter table  practica.coche add constraint coche_aseguradora_FK foreign key(idAseguradora) references
practica.aseguradora(id) on delete cascade;

insert into practica.coche(id, idMarca, idColor, idAseguradora, matricula, kilometros, numPoliza, fechaCompra)
values 
('001', '001', '001', '001','0251-FNB', 100000, '2431342356689545464FG', '2018-06-01'),
('002', '002', '002', '002','3780-JFE', 20000, '4567798346534674534DDE', '2019-10-20'),
('003', '003', '003', '003','1353-LLD', 5000, '52873909237649092243345LFG', '2020-09-11'),
('004', '004', '005', '001','8609-KTT', 2000, '12311112456754345346TRD', '2019-12-15');


create table if not exists practica.revision(
	id varchar(10) not null,
	kilometros int not null,
	fecha date not null,
	importe varchar(50) not null,
	constraint revision_PK primary key(id)
);

insert into practica.revision(id,kilometros,fecha,importe) values
('001', 180000, '2019-06-01', '150€'),
('002', 40000, '2019-06-01', '150€'),
('003', 10000, '2019-06-01', '150€'),
('004', 7000, '2019-06-01', '150€');

create table if not exists practica.coche_has_revision(
	idCoche varchar(10) not null,
	idRevision varchar(10) not null
);

alter table practica.coche_has_revision add constraint coche_FK foreign key(idCoche) references
practica.coche(id) on delete cascade;

alter table practica.coche_has_revision add constraint revision_FK foreign key(idRevision) references
practica.revision(id) on delete cascade;

insert into practica.coche_has_revision(idCoche, idRevision) values
('001', '001'),
('002', '002'),
('003', '003'),
('004', '004');