--------CREACION DE BASE --------------------

create database BD_LifeBank;




create table rol
(
id_rol int not null,
nombre_rol varchar(30) null ,
descripcion_rol varchar(30)  null,
estado varchar(2) null,
fecha_creacion date not null,
constraint pk_id_rol primary key(id_rol)
);

create table rol_x_usuario(
id_rolUsuario int not null,
cod_usuarioRol varchar(20) null,
nombre_usuario varchar(20) null,
estado varchar(5) null,
id_rol int not null,
constraint pk_id_rolUsuario primary key(id_rolUsuario)
);


create table usuario 
(
id_usuario int not null,
cod_usuario varchar(20) null,
usuario varchar(20) null,
contra varchar(20) null,
estado varchar(5) null,
fecha_creacion Date null,
id_rolUsuario int not null,
constraint pk_id_usuario primary key  (id_usuario)
);


create table clienteUsuario
(
id_cliente int not null,
numero_cliente varchar(20) null,
numero_identificacion varchar(9) null,
nombre_cliente varchar(20) null,
apellido_cliente varchar(20) null, 
telefono NUMERIC(8) null,
direccion varchar(20) null,
fecha_nacimiento date null,
fecha_creacion date null,
nacionalidad varchar(20) null,
id_usuario int not null,
constraint pk_id_cliente primary key(id_cliente)
);


create table cuenta
(
id_cuenta int not null,
numero_cliente varchar(20) not null,
numero_cuenta varchar(25)not null,
estado_cuenta varchar(25)not null,
fecha_creacion varchar(25)not null,
fecha_ini_perido Date null,
fecha_fin_perido Date null,
tipo_cuenta varchar(25) not null,
id_cliente int not null,
constraint pk_id_cuenta primary key(id_cuenta)
);




create table cuenta_servicio
(
id_cat_servicio int not null,
cod_servicio varchar(25) null,
tipo_servicio varchar(25)	null,
estado_servicio varchar(25) null,
fecha_creacion varchar(25) null,
id_cuenta int not null,
id_prestamo int not null,
id_tarjeta int not null,
Id_prestaBancario int not null,
constraint pk_id_cat_servicio primary key(id_cat_servicio)
);




create table prestamo(
id_prestamo int not null,
cod_prestamos varchar(10) null,
fecha_prestamo date null,
fecha_devuelta date null,
fecha_creacion date null,
monto numeric(5) null,
descripcion varchar(50)null,
id_cat_servicio int not null,
constraint pk_id_prestamo primary key(id_prestamo)
);


create table tarjeta
(
id_tarjeta int not null,
cod_tarjeta varchar(20) null,
tipo_tarjeta varchar(10) null,
monto numeric(5)null,
fecha_pago date null,
tipo_pago varchar(20)null,
fecha_transaccion date not null,
id_cat_servicio int not null,
constraint pk_id_tarjeta primary key(id_tarjeta)
);

create table MovimientosCuenta(
    IdMovimientosCuenta int primary key ,
    IdCuenta int,
    monto numeric,
    descripcion varchar(50),
    fechaMovimeitno date,
    tipo int,
    cuenta_destino int
);

alter table bd_lifebank.public.cuenta add column montoACtual numeric(9,2);




ALTER TABLE rol_x_usuario
ADD CONSTRAINT fk_rol_usuario FOREIGN KEY(id_rol)
REFERENCES rol (id_rol)
on delete restrict on update restrict;



ALTER TABLE usuario
ADD CONSTRAINT fk_usuario FOREIGN KEY(id_rolUsuario)
REFERENCES rol_x_usuario  (id_rolUsuario)
on delete restrict on update restrict;	


ALTER TABLE clienteUsuario
ADD CONSTRAINT fk_cliente FOREIGN KEY(id_usuario)
REFERENCES usuario (id_usuario)
on delete restrict on update restrict;	



ALTER TABLE cuenta
ADD CONSTRAINT fk_cliente FOREIGN KEY(id_cliente)
REFERENCES clienteUsuario (id_cliente)
on delete restrict on update restrict;	


ALTER TABLE cuenta_servicio
ADD CONSTRAINT fk_cat_servicio FOREIGN KEY(id_cuenta)
REFERENCES cuenta (id_cuenta)
on delete restrict on update restrict;	

ALTER TABLE cuenta_servicio
ADD CONSTRAINT fk_id_prestamo FOREIGN KEY(id_prestamo)
REFERENCES prestamo (id_prestamo)
on delete restrict on update restrict;

ALTER TABLE cuenta_servicio
ADD CONSTRAINT fk_id_pago_tarjeta FOREIGN KEY(id_tarjeta)
REFERENCES tarjeta (id_tarjeta)
on delete restrict on update restrict;







-------------------------------------------------------
-------------------------------------------------------
--INSERT 
-------------------------------------------------------
-------------------------------------------------------

insert into rol values (1,'admin','administrador','A','12-05-2019');
insert into rol values (2,'usuario','usuario cliente','A','12-05-2019');
insert into rol values (3,'emp','empleado','A','12-05-2019');

insert into rol_x_usuario values (1,'001','javier','A',1);
insert into rol_x_usuario values (2,'002','aldair','A',2);
insert into rol_x_usuario values (3,'003','admin1','A',1);
insert into rol_x_usuario values (4,'004','usuario1','A',2);

insert into usuario values (1,'001','javier','javierLM','A','12-05-2019',1);
insert into usuario values (2,'002','admin','admin1234','A','12-05-2019',1);
insert into usuario values (3,'003','carlos','carlos1234','A','12-05-2019',2);
insert into usuario values (4,'004','fernando','A20110688','A','12-05-2019',2);
insert into usuario values (5,'005','ricardo','AVLM2019','A','12-05-2019',2);
insert into usuario values (6,'006','jose','test1','A','12-05-2019',2);
insert into usuario values (7,'007','antonieta','fortren','A','12-05-2019',2);
insert into usuario values (8,'008','fircas','1234','A','12-05-2019',2);
insert into usuario values (9,'009','JEscobar','12345','A','12-05-2019',2);
insert into usuario values (10,'010','trif','12346','A','12-05-2019',2);


insert into clienteUsuario values (1,'001','051941411','javier','escobar','77394705','mejicanos','09-06-1995','12-05-2019','salvador',1);
insert into clienteUsuario values (2,'002','051941412','aldair','morales','77394701','mejicanos','09-01-1995','12-05-2019','salvador',2);
insert into clienteUsuario values (3,'003','051941413','fernando','recino','77394702','mejicanos','09-02-1995','12-05-2019','salvador',3);
insert into clienteUsuario values (4,'004','051941414','luis','quintanilla','77394703','mejicanos','09-03-1995','12-05-2019','salvador',4);
insert into clienteUsuario values (5,'005','051941415','monica','cuellar','77394704','mejicanos','09-04-1995','12-05-2019','salvador',5);
insert into clienteUsuario values (6,'006','051941416','gabriela','rugamas','77394710','mejicanos','09-05-1995','12-05-2019','salvador',6);
insert into clienteUsuario values (7,'007','051941417','claudia','escobar','77394706','mejicanos','09-06-1995','12-05-2019','salvador',7);
insert into clienteUsuario values (8,'008','051941418','carlos','bernal','77394707','mejicanos','09-07-1995','12-05-2019','salvador',8);
insert into clienteUsuario values (9,'009','051941419','omar','garcia','77394708','mejicanos','09-08-1995','12-05-2019','salvador',9);
insert into clienteUsuario values (10,'010','051941420','sara','zetino','77394719','mejicanos','09-09-1995','12-05-2019','salvador',10);


insert into cuenta values(1,'001','001','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',1);
insert into cuenta values(2,'002','002','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',2);
insert into cuenta values(3,'003','003','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',3);
insert into cuenta values(4,'004','004','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',4);
insert into cuenta values(5,'005','005','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',5);
insert into cuenta values(6,'006','006','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',6);
insert into cuenta values(7,'007','007','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',7);
insert into cuenta values(8,'008','008','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',8);
insert into cuenta values(9,'009','009','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',9);
insert into cuenta values(10,'010','010','A','12-05-2019','12-05-2019','13-05-2020','cuentaAhorro',10);

insert into cuenta_servicio values(1,'001','tranferencia','A','12-05-2019',1,1,1,null);
insert into cuenta_servicio values(2,'002','tranferencia','A','12-05-2019',1,2,2,null);
insert into cuenta_servicio values(3,'003','prestamo','A','12-05-2019',2,2,2,null);
insert into cuenta_servicio values(4,'004','prestamo','A','12-05-2019',3,3,3,null);
insert into cuenta_servicio values(5,'005','pagoTarjeta','A','12-05-2019',4,4,4,null);
insert into cuenta_servicio values(6,'006','pagoTarjeta','A','12-05-2019',5,5,5,null);
insert into cuenta_servicio values(7,'007','prestamo','A','12-05-2019',6,6,6,null);
insert into cuenta_servicio values(8,'008','tranferencia','A','12-05-2019',1,3,3,null);
insert into cuenta_servicio values(9,'009','tranferencia','A','12-05-2019',2,4,3,null);
insert into cuenta_servicio values(10,'010','tranferencia','A','12-05-2019',3,2,1,null);
insert into cuenta_servicio values(11,'011','tranferencia','A','12-05-2019',2,2,4,null);

insert into prestamo values(1,'001','11-05-2019','13-05-2019','12-05-2019',100,'prestaBancario',1)
insert into prestamo values(2,'002','11-05-2019','13-05-2019','12-05-2019',50,'prestamo',1)
insert into prestamo values(3,'003','11-05-2019','13-05-2019','12-05-2019',10,'prestamo',1)
insert into prestamo values(4,'004','11-05-2019','13-05-2019','12-05-2019',700,'prestamo',1)
insert into prestamo values(5,'005','11-05-2019','13-05-2019','12-05-2019',80,'prestamo',1)
insert into prestamo values(6,'006','11-05-2019','13-05-2019','12-05-2019',90,'prestamo',1)
insert into prestamo values(7,'007','11-05-2019','13-05-2019','12-05-2019',180,'prestamo',1)
insert into prestamo values(8,'008','11-05-2019','13-05-2019','12-05-2019',130,'prestamo',1)
insert into prestamo values(9,'009','11-05-2019','13-05-2019','12-05-2019',20,'prestamo',1)
insert into prestamo values(10,'010','11-05-2019','13-05-2019','12-05-2019',500,'prestamo',1)
insert into prestamo values(11,'011','11-05-2019','13-05-2019','12-05-2019',900,'prestaBancario',1)

insert into tarjeta values(1,'001','C',1000,'12-05-2019','PC','12-05-2019',1)
insert into tarjeta values(2,'001','C',1000,'12-05-2019','PC','12-05-2019',2)
insert into tarjeta values(3,'001','D',1000,'12-05-2019','PD','12-05-2019',3)
insert into tarjeta values(4,'001','D',1000,'12-05-2019','PD','12-05-2019',4)
insert into tarjeta values(5,'001','C',1000,'12-05-2019','PC','12-05-2019',5)
insert into tarjeta values(6,'001','C',1000,'12-05-2019','PC','12-05-2019',6)
insert into tarjeta values(7,'001','D',1000,'12-05-2019','PD','12-05-2019',7)
insert into tarjeta values(8,'001','D',1000,'12-05-2019','PD','12-05-2019',8)
insert into tarjeta values(9,'001','C',1000,'12-05-2019','PC','12-05-2019',9)
insert into tarjeta values(10,'001','C',1000,'12-05-2019','PC','12-05-2019',10)
insert into tarjeta values(11,'001','C',1000,'12-05-2019','PC','12-05-2019',11)
insert into tarjeta values(12,'001','C',1000,'12-05-2019','PC','12-05-2019',12)
insert into tarjeta values(13,'001','C',1000,'12-05-2019','PC','12-05-2019',13)