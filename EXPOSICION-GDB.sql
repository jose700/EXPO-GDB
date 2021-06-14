/*==============================================================*/

/* Table: ARTICULO */

/*==============================================================*/

create table ARTICULO (

COD_ARTICULO INT4 not null,

ARTICULOS_NOMBRE VARCHAR(100) not null,

ARTICULOS_CANTIDAD INT4 not null,

ARTICULOS_PRECIO NUMERIC not null,

constraint PK_ARTICULO primary key (COD_ARTICULO)

);



/*==============================================================*/

/* Table: CLIENTE */

/*==============================================================*/

create table CLIENTE (

CLIENTE_CEDULA INT4 not null,

CLIENTE_NOMBRES VARCHAR(30) not null,

CLIENTES_APELLIDOS VARCHAR(30) not null,

CLIENTE_DIRECCION VARCHAR(100) not null,

CLIENTE_TELEFONO INT4 not null,

constraint PK_CLIENTE primary key (CLIENTE_CEDULA)

);



/*==============================================================*/

/* Table: DETALLE_LOTE */

/*==============================================================*/

create table DETALLE_LOTE (

COD_DETALLE_LOTE INT4 not null,

COD_LOTE INT4 not null,

COD_ARTICULO INT4 not null,

constraint PK_DETALLE_LOTE primary key (COD_DETALLE_LOTE)

);



/*==============================================================*/

/* Table: DETALLE_MANTENIMIENTO */

/*==============================================================*/

create table DETALLE_MANTENIMIENTO (

COD_DETALLE_MANTENIMIENTO INT4 not null,

COD_ARTICULO INT4 not null,

COD_MANTENIMIENTO INT4 not null,

constraint PK_DETALLE_MANTENIMIENTO primary key (COD_DETALLE_MANTENIMIENTO)

);



/*==============================================================*/

/* Table: DETALLE_VENTA */

/*==============================================================*/

create table DETALLE_VENTA (

COD_DETALLE_VENTA INT4 not null,

COD_ARTICULO INT4 not null,

COD_CANTIDAD INT4 not null,

COD_VENTA INT4 not null,

constraint PK_DETALLE_VENTA primary key (COD_DETALLE_VENTA)

);



/*==============================================================*/

/* Table: EMPLEADO */

/*==============================================================*/

create table EMPLEADO (

COD_EMPLEADO INT4 not null,

COD_TIPO INT4 null,

EMPLEADO_CEDULA INT4 not null,

EMPLEADO_NOMBRES VARCHAR(30) not null,

EMPLEADO_APELLIDOS VARCHAR(30) not null,

EMPLEADO_GENERO VARCHAR(10) not null,

EMPLEADO_DIRECCION VARCHAR(100) not null,

EMPLEADO_TELEFONO INT4 not null,

EMPLEADO_FECHA_NACIMIENTO DATE not null,

EMPLEADO_NACIONALIDAD VARCHAR(30) not null,

constraint PK_EMPLEADO primary key (COD_EMPLEADO)

);



/*==============================================================*/

/* Table: LOTE */

/*==============================================================*/

create table LOTE (

COD_LOTE INT4 not null,

COD_PROVEEDOR INT4 null,

LOTE_FECHA_INGRESO DATE not null,

LOTE_COSTO NUMERIC not null,

constraint PK_LOTE primary key (COD_LOTE)

);



/*==============================================================*/

/* Table: MANTENIMIENTO */

/*==============================================================*/

create table MANTENIMIENTO (

COD_MANTENIMIENTO INT4 not null,

COD_EMPLEADO INT4 null,

CLIENTE_CEDULA INT4 null,

MANTENIMIENTO_FECHA_INGRESO DATE not null,

MANTENIMIENTO_FECHA_SALIDA DATE not null,

MANTENIMIENTO_SOLUCION CHAR(2) not null,

SERIE_EQUIPO VARCHAR(100) not null,

MANTENIMIENTO_CONDICION VARCHAR(500) not null,

MANTENIMIENTO_COSTO NUMERIC not null,
	
MANTENIMIENTO_DESCRIPCION VARCHAR(200) not null,	

constraint PK_MANTENIMIENTO primary key (COD_MANTENIMIENTO)

);



/*==============================================================*/

/* Table: PROVEEDOR */

/*==============================================================*/

create table PROVEEDOR (

COD_PROVEEDOR INT4 not null,

PROVEEDORES_NOMBRE VARCHAR(50) not null,

PROVEEDORES_PAIS VARCHAR(30) not null,

PROVEEDORES_CIUDAD VARCHAR(30) not null,

PROVEEDORES_DIRECCION VARCHAR(100) not null,

PROVEEDORES_TELEFONO INT4 not null,

PROVEEDORES_CORREO VARCHAR(50) not null,

constraint PK_PROVEEDOR primary key (COD_PROVEEDOR)

);



/*==============================================================*/

/* Table: TIPO_EMPLEADO */

/*==============================================================*/

create table TIPO_EMPLEADO (

COD_TIPO INT4 not null,

NOMBRE VARCHAR(30) not null,

constraint PK_TIPO_EMPLEADO primary key (COD_TIPO)

);



/*==============================================================*/

/* Table: VENTA */

/*==============================================================*/

create table VENTA (

COD_VENTA INT4 not null,

CLIENTE_CEDULA INT4 null,

COD_EMPLEADO INT4 null,

VENTAS_TOTAL NUMERIC not null,

constraint PK_VENTA primary key (COD_VENTA)

);



alter table DETALLE_LOTE

add constraint FK_DETALLE__DETALLE_L_LOTE foreign key (COD_LOTE)

references LOTE (COD_LOTE)

on delete restrict on update restrict;



alter table DETALLE_LOTE

add constraint FK_DETALLE__DETALLE_L_ARTICULO foreign key (COD_ARTICULO)

references ARTICULO (COD_ARTICULO)

on delete restrict on update restrict;



/*alter table DETALLE_MANTENIMIENTO

add constraint FK_DETALLE__DETALLE_M_ARTICULO foreign key (COD_ARTICULO)

references ARTICULO (COD_ARTICULO)

on delete restrict on update restrict;
*/


alter table DETALLE_MANTENIMIENTO

add constraint FK_DETALLE__DETALLE_M_MANTENIM foreign key (COD_MANTENIMIENTO)

references MANTENIMIENTO (COD_MANTENIMIENTO)

on delete restrict on update restrict;



alter table DETALLE_VENTA

add constraint FK_DETALLE__DETALLE_V_ARTICULO foreign key (COD_ARTICULO)

references ARTICULO (COD_ARTICULO)

on delete restrict on update restrict;



alter table DETALLE_VENTA

add constraint FK_DETALLE__DETALLE_V_VENTA foreign key (COD_VENTA)

references VENTA (COD_VENTA)

on delete restrict on update restrict;



alter table EMPLEADO

add constraint FK_EMPLEADO_RELATIONS_TIPO_EMP foreign key (COD_TIPO)

references TIPO_EMPLEADO (COD_TIPO)

on delete restrict on update restrict;



alter table LOTE

add constraint FK_LOTE_RELATIONS_PROVEEDO foreign key (COD_PROVEEDOR)

references PROVEEDOR (COD_PROVEEDOR)

on delete restrict on update restrict;



alter table MANTENIMIENTO

add constraint FK_MANTENIM_RELATIONS_EMPLEADO foreign key (COD_EMPLEADO)

references EMPLEADO (COD_EMPLEADO)

on delete restrict on update restrict;



alter table MANTENIMIENTO

add constraint FK_MANTENIM_RELATIONS_CLIENTE foreign key (CLIENTE_CEDULA)

references CLIENTE (CLIENTE_CEDULA)

on delete restrict on update restrict;



alter table VENTA

add constraint FK_VENTA_RELATIONS_CLIENTE foreign key (CLIENTE_CEDULA)

references CLIENTE (CLIENTE_CEDULA)

on delete restrict on update restrict;



alter table VENTA

add constraint FK_VENTA_RELATIONS_EMPLEADO foreign key (COD_EMPLEADO)

references EMPLEADO (COD_EMPLEADO)

on delete restrict on update restrict;










/*INSERTAR DATOS*/
insert into ARTICULO values (1011, 'Tp-link Mini Wireless Wifi Adaptador Usb Wn823n 300mbps Pc', 18, 11.00);
insert into ARTICULO values (1012, 'Parlante para PC NEXUS', 26, 6.25);
insert into ARTICULO values (1013, 'Laptop Lenovo Slim, Amd A9, 14 pulg, 64gb, 4gb, bt, w10', 6, 425.00);
insert into ARTICULO values (1014, 'MOUSE MI XIAOMI METÁLICO PORTABLE PLATEADO', 21, 29.00);
insert into ARTICULO values (1015, 'Laptop HP Gamer AMD RYZEN 7, 8gb, 1tb, AMD Radeon, webcam', 8, 850.00);
insert into ARTICULO values (1016, 'Cable HDMI blindado en empaque Blíster de 5 metros', 7, 6.00);
insert into ARTICULO values (1017, 'Cable HP HDMI a HDMI de 3 metros', 8, 7.00);
insert into ARTICULO values (1018, 'Cable HDMI con blíster de 1.2 metros', 9, 3.99);
insert into ARTICULO values (1019, 'Impresora Epson Lx 350, Matricial', 4, 230.00);
insert into ARTICULO values (1020, 'CPU HP Original Core i3 9na, 1tb, 128gb, 8gb, dvdwr, bt, w10', 12, 535.00);
insert into ARTICULO values (1021, 'Pendrive Kinston 64gb tipo C, USB 3.2', 25, 13.00);
insert into ARTICULO values (1022, 'Pendrive Kingston 32gb USB 3.2, type C', 25, 7.00);
insert into ARTICULO values (1023, 'Adaptador De Disco Duro De 2.5 A 3.5 Rack', 12, 1.79);
insert into ARTICULO values (1024, 'Ventilador para laptop, cooling pad Wesdar', 10, 12.00);
insert into ARTICULO values (1025, 'BOTELLA DE TINTA CANON GI -190 CYAN BOTLE 70 ML', 40, 9.61);
insert into ARTICULO values (1026, 'BOTELLA DE TINTA CANON GI -190 NEGRO BOTLE 135 ML', 40, 9.99);
insert into ARTICULO values (1027, 'BOTELLA DE TINTA CANON GI-190 MAGENTA BOTLE 70ML', 40, 9.61);
insert into ARTICULO values (1028, 'BOTELLA DE TINTA CANON GI-190 AMARILLA BOTLE 70ML', 40, 9.61);
insert into ARTICULO values (1029, 'ESCANER CANON CanoScan LIDE 300', 7, 64.15);
insert into ARTICULO values (1030, 'IMPRESORA FOTOGRAFICA CANON SELPHY CP1300 WI-FI', 2, 164.67);
insert into ARTICULO values (1031, 'CARTUCHO + PAPEL FOTOGRAFICO CANON KP-108 SELPHY 740-760-780', 7, 33.12);
insert into ARTICULO values (1032, 'DVD-WRITER INTERNO ASUS SATA 24X DVD+R / RW 8X COLOR NEGRO', 4, 19.17);
insert into ARTICULO values (1033, 'DISCO DURO INTERNO 3.5″ TOSHIBA 3TB 7200RPM 64MB PARA PC', 5, 91.97);
insert into ARTICULO values (1034, 'UPS INTERACTIVO POWEST 500VA / 300W 110-120VAC', 2, 30.04);
insert into ARTICULO values (1035, 'Fuente De Poder Rippa Desktop 600W Sata', 2, 7.60);
insert into ARTICULO values (1036, 'COMPUTADOR INTEL CELERON 3.2GHZ RAM 4GB DISCO 1TB MONITOR LED CAMARA WEB', 1, 457.00);
insert into ARTICULO values (1037, 'CPU INTEL INTEL CORE I3 10ma GEN. 3.6GHZ RAM 4GB DISCO 1TB', 2, 481.00);
insert into ARTICULO values (1038, 'Lector Interno Rippa De Memorias Flash', 8, 4.46);
insert into ARTICULO values (1039, 'Memoria Adata 4Gb Ddr4 Udimm 2666Mhz', 4, 31.25);
insert into ARTICULO values (1040, 'Cable De Poder Xtech Para 3 Ranuras Para Pc- 1.8M', 11, 3.56);
insert into ARTICULO values (1041, 'CABLE IMPRESORA USB 2.0', 25, 2.43);
insert into ARTICULO values (1042, 'Licencia Microsoft Office 365 Personal 32/64 Bits Subscripción 1 Año', 50, 49.11);
insert into ARTICULO values (1043, 'Parlante Logitech 2.0 S120 - 3.5Mm', 21, 22.32);
insert into ARTICULO values (1044, 'CABLE SVGA 1.8m', 18, 7.60);
insert into ARTICULO values (1045, 'CABLE SVGA 3m', 16, 9.00);
insert into ARTICULO values (1046, 'CABLE SVGA 5m', 14, 13.00);
insert into ARTICULO values (1047, 'Licencia Antivirus Eset Nod32 Oem, Suscripción Anual Para Plataforma Windows', 48, 25.90);
insert into ARTICULO values (1048, 'Bateria Para Laptop/Notebook Lenovo ThinkPad Series T61/R61', 3, 135.20);
insert into ARTICULO values (1049, 'Procesador Intel Core I5-7400 3.0 Ghz 6Mb Lga1151 7Ma Generacion', 4, 264.29);
insert into ARTICULO values (1050, 'Tarjeta De Video Msi 1Gb N210 de Computadoras', 5, 61.61);

/*INGRESO CLIENTES*/
insert into CLIENTE values (1317548954, 'Dennis Snayder', 'Teran Avendaño', 'Calle 14 av. 20', 0958743397);
insert into CLIENTE values (1722697441, 'Selena Nicole','Medina Reyes','Calle 15 av. 35',0978445012);
insert into CLIENTE values (1701420570, 'Manuel Jose','Aveiga Loor','Calle universidad 9 av. universidad 4',0948756669);
insert into CLIENTE values (1311328114, 'Fabian Leonardo','Delgado Marchan','Urbanización Ciudad del Sol',0998445255);
insert into CLIENTE values (1697536715, 'Santiago Patricio','Bautista Alonzo','Calle 13 av. 17',0987597199);
insert into CLIENTE values (1487741126, 'Alisson Katherine','Macias Tenelema','Calle 15 av. 24',0995937132);
insert into CLIENTE values (1317925956, 'Alexander Jared','Mera Coba','Urbanización Cielito Lindo',0993938937);
insert into CLIENTE values (1154779629, 'Joselyn Alessa','Anchundia Moreira','Calle 308 av. 239B',0981640094);
insert into CLIENTE values (1784987441, 'Roberth Xavier','Chavez Conforme','Calle 122 av. 102',0996853524);
insert into CLIENTE values (1317915842, 'Ariana Valentina','Huerta Santana','Calle 109 av. 111',0988997615);
insert into CLIENTE values (1177852487, 'Sophia Carolina','Rojas Mendoza','Calle 4 av. 11',0997689029);
insert into CLIENTE values (1549997452, 'Adriana Anahi','Flores Cevallos','Calle 10 av. 10',0962610603);
insert into CLIENTE values (1309873279, 'Alanys Gissella','Alarcon Pico','Urbanización Manta Azul',0999189541);
insert into CLIENTE values (1348789954, 'Geovanny Andres','Alcivar Solorzano','Calle 17-B av. 30',0983177115);
insert into CLIENTE values (1124478965, 'Karen Denisse','Giler Ponce','Cdla. La Aurora Mz. F villa 12',0967616386);
insert into CLIENTE values (1458749961, 'Vielka Yamileth','Tauriz Rivera','Miraflores calle 9 de Octubre',0963280234);
insert into CLIENTE values (1314874168, 'Jordy Vicente','Rodriguez Garcia','Calle 114 av. 113',0997295053);
insert into CLIENTE values (1317818220, 'Victoria Luciana','Espin Intriago','Altagracia calle T1',0967143732);
insert into CLIENTE values (1317915666, 'Tania Jazmin','Zambrano Burgos','San Pedro calle 310 av. 207',0997455841);
insert into CLIENTE values (1719230342, 'Carlos Paul','Peñafiel Palma','Porvenir calle 297 av. 207',0996399073);
/*INGRESO TIPO_EMPLEADO*/
insert into TIPO_EMPLEADO values (1, 'VENDEDOR');
insert into TIPO_EMPLEADO values (2, 'TECNICO');
insert into TIPO_EMPLEADO values (3, 'TECNICO PARTICULAR');




/*INGRESO EMPLEADOS*/
insert into EMPLEADO values (1, 1, 1647815664, 'Eliana Cristina', 'Valle Ramirez', 'Femenino', 'Calle 15 av. 25', 0999543034, '05/10/1997','ecuatoriana');
insert into EMPLEADO values (2, 1, 1784452164, 'Martha Pamela', 'Arauz Aguayo', 'Femenino', 'Calle 10 av. 11', 0995482236, '13/06/1999','ecuatoriana');
insert into EMPLEADO values (3, 1, 1745120558, 'Gema Cecilia', 'Bazurto Quiroz', 'Femenino', 'Santa Martha calle 11 av. 34', 0968956789, '23/11/1998','ecuatoriana');
insert into EMPLEADO values (4, 1, 1877953032, 'Juan Anderson', 'Alava Hernandez', 'Masculino', 'La Aurora II', 0955887410, '25/11/1996','ecuatoriana');
insert into EMPLEADO values (5, 1, 1458726480, 'Bryan Gabriel', 'Arcentales Castillo', 'Masculino', 'Calle 13 av. 8', 0965487512, '13/07/2000','ecuatoriana');
insert into EMPLEADO values (6, 1, 1302995466, 'Raquel Amelia', 'Sanchez Alvia', 'Femenino', 'Cdla. las Cumbres', 0954875410, '26/09/2001','ecuatoriana');
insert into EMPLEADO values (7, 1, 1348756667, 'Martina Violeta', 'Acosta Espinales', 'Femenino', 'Urbanización Metróplis', 0948556820, '04/08/1997','mexicana');
insert into EMPLEADO values (8, 1, 1353648795, 'Abel Daniel', 'Roldan Plua', 'Masculino', 'San Agustín calle A', 0968774859, '31/01/1995','ecuatoriana');
insert into EMPLEADO values (9, 2, 1478552220, 'Coraima Alejandra', 'Vera Navarrete', 'Femenino', 'Calle 11 av. 23', 0998572156, '14/01/1992','colombiana');
insert into EMPLEADO values (10, 2, 1647845628, 'Marcos Steven', 'Saltos Gutierrez', 'Masculino', 'Los Geraneos', 0965441285, '18/05/1990','colombiana');
insert into EMPLEADO values (11, 2, 1348448004, 'Jacinto Humberto', 'Arevalo Bravo', 'Masculino', 'Maria Auxiliadora calle 309 av. 209', 0958476698, '04/06/1995','ecuatoriana');
insert into EMPLEADO values (12, 2, 1784995642, 'Luis Renato', 'Rivas Paredes', 'Masculino', 'Calle 17 av. 21', 0935395489, '17/07/1995','venezolana');
insert into EMPLEADO values (13, 2, 1254810202, 'Leonela Maria', 'Villamar Mejia', 'Femenino', 'La Pradera calle P5', 0947854122, '18/02/1991','ecuatoriana');
insert into EMPLEADO values (14, 2, 1895554584, 'Sergio Adam', 'Murillo Briones', 'Masculino', 'Nueva Esperanza', 0987458666, '24/12/1989','venezolana');




/*INGRESO PROVEEDORES*/ 
insert into PROVEEDOR values (1, 'Intcomex Corp.', 'Ecuador', 'Guayaquil', 'Ciudadela Adace Calle B N. 206 y Calle Sexta', 0943705200,'info.ec@intcomex.com');
insert into PROVEEDOR values (2, 'Megamicro S.A.', 'Ecuador', 'Quito', 'De las Anonas E9 - 119 y Los Jazmines', 093281288,'contactoweb@megamicro-ec.com');
insert into PROVEEDOR values (3, 'IDC Mayoristas en Computación CA', 'Ecuador', 'Quito', 'Av. Universitaria Oe6-46 y Santa Rosa Sector Miraflores', 2504754,'marketing@idcmayoristas.com');
insert into PROVEEDOR values (4, 'Pinsoft Corp.', 'Ecuador', 'Quito', 'Fray Jodoco Rique N14-102 e Itchimbía (Parque Itchimbía)', 2528506,'ventas1@pinsoft.ec');
insert into PROVEEDOR values (5, 'Impova', 'Ecuador', 'Guayaquil', 'Av. Quito 1024 y Jose Gabriel de Luque', 0996917529,'ventas@impova.com');
insert into PROVEEDOR values (6, 'XPC Tecnología Informática', 'Ecuador', 'Quito', 'Av Galo Plaza Lasso N67-23, entre Ciruelos y Cerezos', 022809088,'info@xpc.com.ec');
insert into PROVEEDOR values (7, 'Compuzone', 'Ecuador', 'Guayaquil', 'Manzana #40 solar # 1D', 042738565,'info@compuzone.com.ec');
insert into PROVEEDOR values (8, 'Compushop S.A.', 'Ecuador', 'Guayaquil', 'Cdla Albatros Calle Miguel H. Alcivar y A. Andrade Mz 6 V 8 1er piso', 0987456874,'info@compushop.ec');
insert into PROVEEDOR values (9, 'A.P.C. Tecnología Cía. Ltda.', 'Ecuador', 'Cuenca', 'Cornelio Merchan y José Peralta (esq.)', 0974103067,'ventasapc@apctecnologia.com');


/*INGRESO LOTE*/
insert into LOTE values (16, 1, '14/09/2020', 9800.00);
insert into LOTE values (17, 2, '21/09/2020', 6900.00);
insert into LOTE values (18, 3, '28/09/2020', 9870.00);
insert into LOTE values (19, 5, '02/10/2020', 9990.00);
insert into LOTE values (20, 7, '06/10/2020', 10000.00);
insert into LOTE values (21, 9, '10/10/2020', 8700.00);
insert into LOTE values (22, 8, '31/10/2020', 7850.00);
insert into LOTE values (23, 3, '05/11/2020', 10000.00);
insert into LOTE values (24, 2, '16/11/2020', 9500.00);
insert into LOTE values (25, 1, '24/11/2020', 8740.00);
insert into LOTE values (26, 3, '30/11/2020', 9948.00);
insert into LOTE values (27, 4, '01/12/2020', 9800.00);
insert into LOTE values (28, 5, '02/12/2020', 10000.00);
insert into LOTE values (29, 9, '04/12/2020', 9540.00);
insert into LOTE values (30, 6, '07/12/2020', 7800.00);





/*INGRESO VENTAS*/
insert into VENTA values (18, 1317548954, 1, 122.00);
insert into VENTA values (19, 1722697441, 2, 103.64);
insert into VENTA values (20, 1701420570, 3, 209.00);
insert into VENTA values (21, 1311328114, 4, 442.25);
insert into VENTA values (22, 1697536715, 5, 879.00);
insert into VENTA values (23, 1487741126, 6, 246.99);
insert into VENTA values (24, 1317925956, 7, 548.00);
insert into VENTA values (25, 1154779629, 8, 123.79);
insert into VENTA values (26, 1784987441, 9, 216.96);
insert into VENTA values (27, 1317915842, 10, 586.61);
insert into VENTA values (28, 1177852487, 11, 520.27);
insert into VENTA values (29, 1549997452, 12, 103.46);
insert into VENTA values (30, 1309873279, 13, 161.10);
insert into VENTA values (31, 1348789954, 14, 325.90);
insert into VENTA values (32, 1311328114, 4, 442.25);
insert into VENTA values (33, 1784987441, 9, 216.96);
insert into VENTA values (34, 1311328114, 4, 442.25);
insert into VENTA values (35, 1722697441, 2, 103.64);
insert into VENTA values (36, 1722697441, 2, 103.64);

/*INGRESO DETALLE_VENTA*/
insert into DETALLE_VENTA values (1,1011,  2, 18);
insert into DETALLE_VENTA values (2,1012,  4, 19);
insert into DETALLE_VENTA values (3,1012,  1, 20);
insert into DETALLE_VENTA values (4,1013,  5, 21);
insert into DETALLE_VENTA values (5,1014,  3, 22);
insert into DETALLE_VENTA values (6,1015,  2, 23);
insert into DETALLE_VENTA values (7,1016,  1, 24);
insert into DETALLE_VENTA values (8,1017,  4, 25);
insert into DETALLE_VENTA values (9,1018,  5, 26);
insert into DETALLE_VENTA values (10,1019,  2, 27);
insert into DETALLE_VENTA values (11,1020,  3, 28);
insert into DETALLE_VENTA values (12,1021,  2, 29);
insert into DETALLE_VENTA values (13,1022,  1, 30);
insert into DETALLE_VENTA values (14,1023,  4, 31);


/*INGRESO MANTENIMIENTO*/
insert into MANTENIMIENTO values (1, 9, 1719230342, '14/09/2020', '24/09/2020', 'Si', '5SR5F6R5G4R64E', ' Defectuoso', 99.00, 'Revisión total de equipo');
insert into MANTENIMIENTO values (2, 10, 1317915666, '22/09/2020', '01/10/2020', 'No', '4FE54FEAF8FE48', 'No enciende', 25.00, 'Cambio de bateria');
insert into MANTENIMIENTO values (3, 11, 1317818220, '06/10/2020', '16/11/2020', 'Si', 'HH82AC84AA200A', 'Impresora con fallas', 80.00, 'Cambio de tinta');
insert into MANTENIMIENTO values (4, 12, 1314874168, '29/10/2020', '08/11/2020', 'Sí', '9EW89W2E2E00E6', 'Daño de disco duro', 150.00, 'Cambio de disco duro');
insert into MANTENIMIENTO values (5, 13, 1458749961, '25/11/2020', '05/12/2020', 'No', 'F6W5W59FCZ6203', 'Defectuoso', 25.00, 'Cambio de pantalla');
insert into MANTENIMIENTO values (6, 14, 1124478965, '27/11/2020', '07/12/2020', 'No', 'E94R12T5Z320C0', 'Procesador quemado', 25.00, 'Cambio de procesador');
insert into MANTENIMIENTO values (7, 12, 1348789954, '29/11/2020', '09/12/2020', 'No', '48668SC688SDE8', 'Defectuoso', 25.00, 'Cambio de enfriador');

/*INGRESO DETALLE_MANTENIMIENTO*/
insert into DETALLE_MANTENIMIENTO values (1, 1042, 1);
insert into DETALLE_MANTENIMIENTO values (2, 1047, 2);
insert into DETALLE_MANTENIMIENTO values (3, 1025, 3);
insert into DETALLE_MANTENIMIENTO values (4, 1026, 4);
insert into DETALLE_MANTENIMIENTO values (5, 1027, 5);
insert into DETALLE_MANTENIMIENTO values (6, 1028, 6);
insert into DETALLE_MANTENIMIENTO values (7, 1033, 7);


/*insert into DETALLE_VENTA values (15,1025,  2, 5);
insert into DETALLE_VENTA values (16,1025,  3, 6);
insert into DETALLE_VENTA values (17,1028,  1, 6);
insert into DETALLE_VENTA values (18,1012,  1, 6);
insert into DETALLE_VENTA values (19,1012,  1, 6);
insert into DETALLE_VENTA values (20,1029,  2, 7);
insert into DETALLE_VENTA values (21,1015,  2, 7);
insert into DETALLE_VENTA values (22,1030,  2, 8);
insert into DETALLE_VENTA values (23,1018,  3, 8);
insert into DETALLE_VENTA values (24,1012,  1, 8);
insert into DETALLE_VENTA values (25,1019,  2, 8);
insert into DETALLE_VENTA values (26,1023,  2, 8);
insert into DETALLE_VENTA values (27,1024,  1, 8);
insert into DETALLE_VENTA values (28,1027,  1, 8);
insert into DETALLE_VENTA values (29,1012,  1, 8);
insert into DETALLE_VENTA values (30,1029,  2, 9);
insert into DETALLE_VENTA values (31,1031,  1, 9);
insert into DETALLE_VENTA values (32,1050,  2, 9);
insert into DETALLE_VENTA values (33,1042,  3, 10);
insert into DETALLE_VENTA values (34,1043,  3, 10);
insert into DETALLE_VENTA values (35,1044,  1, 10);
insert into DETALLE_VENTA values (36,1045,  1, 10);
insert into DETALLE_VENTA values (37,1046,  2, 11);
insert into DETALLE_VENTA values (38,1047,  1, 11);
insert into DETALLE_VENTA values (39,1036,  1, 11);
insert into DETALLE_VENTA values (40,1037,  2, 11);
insert into DETALLE_VENTA values (41,1038,  2, 12);
insert into DETALLE_VENTA values (42,1039,  3, 12);
insert into DETALLE_VENTA values (43,1040,  4, 12);
insert into DETALLE_VENTA values (44,1010,  2, 12);
insert into DETALLE_VENTA values (45,1016,  1, 12);
insert into DETALLE_VENTA values (46,1019,  1, 12);
insert into DETALLE_VENTA values (47,1017,  2, 13);
insert into DETALLE_VENTA values (48,1042,  4, 13);
insert into DETALLE_VENTA values (49,1043,  2, 14);
insert into DETALLE_VENTA values (50,1044,  1, 14);*/

/*consulta todas las marcas de productos q se vendio x cada marca*/
select 
ARTICULO.COD_ARTICULO as Código,
ARTICULO.ARTICULOS_NOMBRE as Nombre,
ARTICULO.ARTICULOS_PRECIO as Precio,
sum(DETALLE_VENTA.COD_CANTIDAD) as Articulos_Vendidos
from ARTICULO
inner join DETALLE_VENTA on DETALLE_VENTA.COD_ARTICULO=ARTICULO.COD_ARTICULO
group by 
Código,
Nombre,
Precio;


/*tecnicos cuanto de ingreso hizo por marca*/
select 
EMPLEADO.EMPLEADO_NOMBRES AS Nombre_Tecnico,
MANTENIMIENTO.MANTENIMIENTO_COSTO as Precio,
MANTENIMIENTO.MANTENIMIENTO_DESCRIPCION as descripcion,
sum(DETALLE_MANTENIMIENTO.COD_MANTENIMIENTO) as Articulos_Vendidos,
SUM(DETALLE_MANTENIMIENTO.COD_MANTENIMIENTO*MANTENIMIENTO.MANTENIMIENTO_COSTO) AS TOTAL
from MANTENIMIENTO
inner join DETALLE_MANTENIMIENTO on DETALLE_MANTENIMIENTO.COD_ARTICULO=DETALLE_MANTENIMIENTO.COD_ARTICULO
INNER JOIN EMPLEADO ON EMPLEADO.COD_EMPLEADO = EMPLEADO.COD_EMPLEADO
group by 
Nombre_Tecnico,
precio,
descripcion;


/*vendedores cuanto ingreso hizo por marca*/
select 
EMPLEADO.EMPLEADO_NOMBRES AS NOMBRE1,
ARTICULO.COD_ARTICULO as Código,
ARTICULO.ARTICULOS_NOMBRE as Nombre,
ARTICULO.ARTICULOS_PRECIO as Precio,
sum(DETALLE_VENTA.COD_CANTIDAD) as Articulos_Vendidos,
SUM(DETALLE_VENTA.COD_CANTIDAD*ARTICULO.ARTICULOS_PRECIO) AS TOTAL
from ARTICULO
inner join DETALLE_VENTA on DETALLE_VENTA.COD_ARTICULO=ARTICULO.COD_ARTICULO
INNER JOIN EMPLEADO ON EMPLEADO.COD_EMPLEADO = EMPLEADO.COD_EMPLEADO
group by 
NOMBRE1,
Código,
Nombre,
Precio;
/*clientes cuantos productos ha comprado*/

select CLIENTE.CLIENTE_CEDULA as CEDULA,
CLIENTE.CLIENTE_NOMBRES AS NOMBRE,
CLIENTE.CLIENTES_APELLIDOS AS APELLIDOS,
count(VENTA.COD_VENTA) as COMPRAS_TOTAL
from PUBLIC.CLIENTE
inner join VENTA on VENTA.CLIENTE_CEDULA=CLIENTE.CLIENTE_CEDULA
group by 
CEDULA,
NOMBRE,
APELLIDOS;




