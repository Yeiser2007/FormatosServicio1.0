****Entrar a la BD*****
mysql --version
mysql -u root -p
contraseña: 2011
show databases;
use doctorado; -> Nombre BD

***Querys para crear la BD****
CREATE TABLE pais(id_pais INT NOT NULL PRIMARY KEY AUTO_INCREMENT,pais VARCHAR(30));

Create Table estado(id_estado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,estado VARCHAR(25));

Create Table delegaMuni(id_delegacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,delega_Muni VARCHAR(30),id_estado INT NOT NULL,  INDEX (id_estado),FOREIGN KEY (id_estado) REFERENCES estado(id_estado));

Create Table colonia(id_colonia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,colonia VARCHAR(30),id_delegacion INT NOT NULL,  INDEX (id_delegacion),FOREIGN KEY (id_delegacion) REFERENCES delegaMuni(id_delegacion));
Create Table Calle(id_calle INT NOT NULL PRIMARY KEY AUTO_INCREMENT,calle VARCHAR(30),id_colonia INT NOT NULL,  INDEX (id_colonia),FOREIGN KEY (id_colonia) REFERENCES Colonia(id_colonia)); 

Create Table Telefono(id_telefono INT NOT NULL PRIMARY KEY AUTO_INCREMENT,telefono_Part int,codigo_Pais int, telefono_cel int, codigo_area int, clave_lada int);

Create Table documentacion(id_documento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,id_persona INT NOT NULL,solicitudAdmision boolean,promedioCerti boolean, cartasRecomendacion boolean, constanciaIgls boolean, cv boolean, cartaMotivos boolean, cartaTiempo boolean, 
cartaPresentacion boolean, propuesta boolean, pagoDerechos boolean, cartaAceptacion boolean,
INDEX (id_persona), FOREIGN KEY (id_persona) REFERENCES persona(id_persona));

CREATE TABLE carrera(id_carrera INT NOT NULL PRIMARY KEY AUTO_INCREMENT,carrera VARCHAR(30));
CREATE TABLE lineaAcentuacion(id_linea INT NOT NULL PRIMARY KEY AUTO_INCREMENT,nombre VARCHAR(30));
CREATE TABLE prodep(id_prodep INT NOT NULL PRIMARY KEY AUTO_INCREMENT,prodep boolean, periodo VARCHAR(15));
CREATE TABLE sni(id_sni INT NOT NULL PRIMARY KEY AUTO_INCREMENT,estado boolean, SNI VARCHAR(15), periodo VARCHAR(15));

CREATE TABLE beca(id_beca INT NOT NULL PRIMARY KEY AUTO_INCREMENT,nombre VARCHAR(25), tipo VARCHAR(25));
CREATE TABLE institucion(id_institucion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,nombreInstitucion VARCHAR(25), Facultad_Esc VARCHAR(25), campus VARCHAR(25));
CREATE TABLE proAcademico(id_programa INT NOT NULL PRIMARY KEY AUTO_INCREMENT,nombre VARCHAR(25));
CREATE TABLE protocolo(id_protocolo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,nombre VARCHAR(25), fecha Date);
Create Table tesis(id_tesis INT NOT NULL PRIMARY KEY AUTO_INCREMENT,nombre VARCHAR(25),id_protocolo INT NOT NULL,  INDEX (id_protocolo),FOREIGN KEY (id_protocolo) REFERENCES protocolo(id_protocolo));

CREATE TABLE cargos(id_cargo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,tipo VARCHAR(25));
CREATE TABLE generacion(id_generacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,generacion VARCHAR(30));

CREATE TABLE persona(id_persona INT NOT NULL PRIMARY KEY AUTO_INCREMENT,nombres varchar(50), primerApellido varchar(50), segundoApellido varchar(50), fechaNac Date, genero varchar(6), id_pais int , id_estado int,
delegacion varchar(50), colonia varchar(50), calle varchar(50),numero_ext int,numero_int int, cp int, edo_civil varchar(15), email_personal varchar(20), tel varchar(20), telCel varchar(20),
curp varchar(30), nacionalidad varchar(15), firma varchar(25), rfc varchar(20),
INDEX (id_pais),FOREIGN KEY (id_pais) REFERENCES pais(id_pais),
INDEX (id_estado),FOREIGN KEY (id_estado) REFERENCES estado(id_estado));





CREATE TABLE aspirante(id_aspirante INT NOT NULL PRIMARY KEY AUTO_INCREMENT, id_persona int, estado varchar(10), id_linea int, id_generacion int,
documentacion boolean, id_documento int, id_carrera int, promedio dec(2,1), id_institucion int, email_institucional varchar(25), url varchar(20),
INDEX (id_persona), FOREIGN KEY (id_persona) REFERENCES persona(id_persona),
INDEX (id_linea), FOREIGN KEY(id_linea) REFERENCES lineaAcentuacion(id_linea), 
INDEX (id_documento), FOREIGN KEY(id_documento) REFERENCES documentacion(id_documento),
INDEX (id_carrera), FOREIGN KEY(id_carrera) REFERENCES carrera(id_carrera),
INDEX (id_institucion), FOREIGN KEY(id_institucion) REFERENCES institucion(id_institucion),
INDEX (id_generacion), FOREIGN KEY(id_generacion) REFERENCES generacion(id_generacion));

CREATE TABLE asesorExt(id_asesor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,id_persona int NOT NULL,id_linea int,GRADO varchar(10),
INDEX (id_persona), FOREIGN KEY (id_persona) REFERENCES persona(id_persona),
INDEX (id_linea), FOREIGN KEY(id_linea) REFERENCES lineaAcentuacion(id_linea));

CREATE TABLE investigador(id_investigador INT NOT NULL PRIMARY KEY AUTO_INCREMENT, id_persona int NOT NULL,id_cargo1 int,periodo1 varchar(20),
id_cargo2 int,periodo2 varchar(20),id_cargo3 int,  periodo3 varchar(20),id_linea int,id_sni int,id_prodep int,
INDEX (id_persona), FOREIGN KEY (id_persona) REFERENCES persona(id_persona),
INDEX (id_cargo1), FOREIGN KEY(id_cargo1) REFERENCES cargos(id_cargo),
INDEX (id_cargo2), FOREIGN KEY(id_cargo2) REFERENCES cargos(id_cargo),
INDEX (id_cargo3), FOREIGN KEY(id_cargo3) REFERENCES cargos(id_cargo),
INDEX (id_linea), FOREIGN KEY(id_linea) REFERENCES lineaAcentuacion(id_linea),
INDEX (id_sni), FOREIGN KEY(id_sni) REFERENCES sni(id_sni),
INDEX (id_prodep), FOREIGN KEY(id_prodep) REFERENCES prodep(id_prodep));


CREATE TABLE doctorado(id_doctorado INT NOT NULL PRIMARY KEY AUTO_INCREMENT, CVU INT, CARRERA_POSGRD VARCHAR(15),
GRADO VARCHAR(10), PROMEDIO_MAESTRIA DEC(2,1), fecha_ingreso date, duracion_plan varchar(15), fecha_termino date, generacion varchar(15),
estatus varchar(15), id_institucion int, id_programa int, id_protocolo int, id_asesor int, id_coodirector int, id_tutor1 int, id_tutor2 int, 
id_asesorext int, id_tesis int, email_institu Varchar(50),
INDEX (id_doctorado), FOREIGN KEY (id_doctorado) REFERENCES aspirante(id_aspirante),
INDEX (id_institucion), FOREIGN KEY(id_institucion) REFERENCES institucion(id_institucion),
INDEX (id_programa), FOREIGN KEY(id_programa) REFERENCES proAcademico(id_programa),
INDEX (id_protocolo), FOREIGN KEY(id_protocolo) REFERENCES protocolo(id_protocolo),
INDEX (id_asesor), FOREIGN KEY(id_asesor) REFERENCES investigador(id_investigador),
INDEX (id_coodirector), FOREIGN KEY(id_coodirector) REFERENCES investigador(id_investigador),
INDEX (id_tutor1), FOREIGN KEY(id_tutor1) REFERENCES investigador(id_investigador),
INDEX (id_tutor2), FOREIGN KEY(id_tutor2) REFERENCES investigador(id_investigador),
INDEX (id_asesorext), FOREIGN KEY(id_asesorext) REFERENCES asesorExt(id_asesor),
INDEX (id_tesis), FOREIGN KEY(id_tesis) REFERENCES tesis(id_tesis));


CREATE TABLE beca_dtsAca(ID_BECA INT NOT NULL, ID_DOCTORADO INT NOT NULL, FECHA_INICIO DATE, FECHA_FIN DATE, ESTADO VARCHAR(10),
INDEX (id_beca), FOREIGN KEY (id_beca) REFERENCES beca(id_beca),
INDEX (id_doctorado), FOREIGN KEY (id_doctorado) REFERENCES doctorado(id_doctorado));



CREATE TABLE secretaria(id_secretaria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,contrasenia varchar(20), cargo varchar(25),
INDEX (id_secretaria), FOREIGN KEY (id_secretaria) REFERENCES persona(id_persona));

CREATE TABLE usuario(id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT, id_investigador int, id_cargo int, periodo varchar(20), contrasenia varchar(20),
INDEX (id_investigador), FOREIGN KEY (id_investigador) REFERENCES investigador(id_investigador));
 


******Despues de Crear la Base agregas estos querys para corregir unos errores que ahorita no me da tiempo corregir 

ALTER TABLE Persona ADD Tel Varchar(20) AFTER email_personal;
ALTER TABLE Persona ADD TelCel Varchar(20) AFTER Tel;
ALTER TABLE institucion MODIFY COLUMN nombreInstitucion VARCHAR(80);
ALTER TABLE protocolo MODIFY COLUMN nombre VARCHAR(180);
ALTER TABLE proAcademico MODIFY COLUMN nombre VARCHAR(50);
ALTER TABLE persona MODIFY COLUMN email_personal VARCHAR(50);
ALTER TABLE persona MODIFY COLUMN genero VARCHAR(20);

ALTER TABLE generacion MODIFY COLUMN generacion VARCHAR(120);
ALTER TABLE aspirante MODIFY COLUMN estado VARCHAR(40);
ALTER TABLE investigador ADD email_institu Varchar(35) AFTER id_persona;

ALTER TABLE Doctorado ADD email_institu Varchar(50) AFTER id_tesis;

ALTER TABLE Documentacion ADD id_persona int FOREIGN KEY (id_persona) REFERENCES persona(id_persona)AFTER id_persona;
ALTER TABLE Documentacion ADD id_persona int AFTER id_documento;
UPDATE Investigador SET email_institu = 'vmunozj@uaemex.mx' WHERE id_investigador = 5;
UPDATE Documentacion SET id_persona = 5 WHERE id_documento = 1;

UPDATE usuario set contrasenia='dr123' where id_usuario=(Select id_usuario from usuario INNER JOIN investigador INNER JOIN persona where persona.id_persona = investigador.id_persona and investigador.id_investigador=usuario.id_investigador and persona.email_personal='maramosc@uaemex.mx');
UPDATE usuario set contrasenia='dr123' where id_usuario= union (Select id_usuario from usuario where id_investigador= (Select id_investigador from investigador where email_institu='vmunozj@uaemex.mx'));


UPDATE INVESTIGADOR set ID_LINEA=NULL where id_INVESTIGADOR=29

ALTER TABLE Persona ADD delegacion Varchar(50) AFTER id_estado;
ALTER TABLE Persona ADD colonia Varchar(50) AFTER delegacion;
ALTER TABLE Persona ADD calle Varchar(50) AFTER colonia;

ALTER TABLE Persona DROP COLUMN id_delegacion;

**************Lllenar las tablas**********************



INSERT INTO persona(id_persona,nombres,primerapelllido,segundoapellido,fechaNac,genero,id_pais,id_estado,id_delegacion,id_colonia,id_Calle,numero_ext,
numero_int,cp,edo_civil,email_personal,Tel,TelCel,curp, nacionalidad, firma,RFC)

INSERT INTO persona VALUES(45,'Oleg Alexandro','Cravioto','García','1984-02-23','Masculino',1,1,12,16,16,NULL,9,52140,'Soltero','oleg19cg@gmail.com',9177756,2408907,'CXGO840223HMCRRL05','Mexicana',NULL,'CXGO840223');
INSERT INTO persona VALUES(46,'Ariana','Cruz','Olayo','1988-07-26','Femenino',1,1,12,17,17,162,NULL,52149,'Soltera','arycruzo@gmail.com',7222711182,7223711903,'CUOA880726MDFRLR05','Mexicana',NULL,'CUOA880726');
INSERT INTO persona VALUES(47,'Eduardo','González','Mora','1992-08-06','Masculino',1,1,2,18,18,50,NULL,50016,'Soltero','eduardo.gmora@outlook.com',7222117199,7224940982,'GOME920806HMCNRD03','Mexicana',NULL,'GOME920806V43');
INSERT INTO persona VALUES(48,'Efrén','Gutiérrez','Ocampo','1966-06-18','Masculino',1,1,13,19,19,119,NULL,51356,'Casado','efrengutierrezocampo@gmail.com',7222184903,7223705691,'GUOE660618HMCTF00','Mexicana',NULL,'GUOE660618');
INSERT INTO persona VALUES(49,'Maribel','Jaimes','Torres','1977-06-06','Femenino',1,1,2,20,20,306,NULL,50040,'Casada','semiaj@hotmail.com',5514137328,5514137328,'JATM770606MDFMRR06','Mexicana',NULL,'JATM770606');
INSERT INTO persona VALUES(50,'Julio César','Marin','Aguilar','1981-02-09','Masculino',1,1,2,21,21,1906,NULL,50120,'Soltero','jucemaag@hotmail.com',2193689,7223639799,'MAAJ810209HMCRGL02','Mexicana',NULL,'MAAJ810209');
INSERT INTO persona VALUES(51,'Josè Angel','Alvarez','Duarte','1987-11-12','Masculino',1,1,2,22,22,711,NULL,50180,'Soltero','josealvarez121187@gmail.com',NULL,3620848,NULL,'Cubana',NULL,NULL);
INSERT INTO persona VALUES(52,'Gretel','Bernal','Barò','1985-11-30','Femenino',1,1,2,23,23,1108,NULL,50100,'Casada','gretelbernalbaro@gmail.com',NULL,7222485958,NULL,'Cubana',NULL,NULL);
INSERT INTO persona VALUES(53,'Cèsar','Castillo','Castillo','1985-09-14','Masculino',1,1,1,24,24,8,NULL,52754,'Soltero','cecastillocastillo@gmail.com',NULL,7221000591,'CACC850914HJCSSS01','Mexicana',NULL,'CACC850914N59');
INSERT INTO persona VALUES(54,'Fernando Gabriel','Flores','Nava','1993-11-16','Masculino',1,1,9,25,25,NULL,NULL,50740,'Soltero','FernandoFloresNava@hotmail.com',NULL,NULL,'FONF931116HMCLVR01','Mexicana',NULL,'FONF9931116');
INSERT INTO persona VALUES(55,'Christopher','Gutièrrez','Luna','1983-07-24','Masculino',1,1,14,26,26,34,NULL,50450,'Casado','chrisvelca@hotmail.com',NULL,4862834,'GULC830724HMCTNH00','Mexicana',NULL,'GULC830724');
INSERT INTO persona VALUES(56,'Laura Patricia','Jimènez','Mijangos','1981-08-22','Femenino',1,1,2,27,27,219,NULL,50150,'Casada','ljimenezmijangos@gmail.com',NULL,3931883,'JIML810822MMCMJRO2','Mexicana',NULL,'JIML810822');
INSERT INTO persona VALUES(57,'Antonio Adolfo','Juárez','Hernández','1978-06-13','Masculino',1,1,15,28,28,1115,NULL,52104,'Casado','antonio13_28@hotmail.com',NULL,5513323378,'JUHA780613MDFRRN06','Mexicana',NULL,'JUHA780613FR1');
INSERT INTO persona VALUES(58,'Esteban Cuitlahuac','López','Bravo','1984-07-09','Masculino',1,1,16,29,29,NULL,NULL,56970,'Soltero',NULL,NULL,5572779484,'LOB3840709HDFPRS03','Mexicana',NULL,'LOB3840709');
INSERT INTO persona VALUES(59,'Marco Antonio','López','Medina','1992-05-16','Masculino',1,1,12,30,30,18,NULL,52176,'Soltero','valgirmanda@gmail.com',NULL,5367245,'LOMM920516HMCPDR06','Mexicana',NULL,'LOMM920516CX3');
INSERT INTO persona VALUES(60,'Rafael','Mercado','Herrera','1991-12-10','Masculino',1,1,2,31,31,104,NULL,50070,'Soltero','rafael.mercado.h@gmail.com',NULL,7223632593,'MAEHR911210HMCBRF02','Mexicana',NULL,'MEHR9112101XA');
INSERT INTO persona VALUES(61,'Víctor Manuel','Montaño','Serrano','1988-10-01','Masculino',1,1,2,32,32,106,NULL,50110,'Soltero','vmms.011088@gmail.com',NULL,7221074042,'MOSV881001HMCNRC03','Mexicana',NULL,'MO5V881001Q42');
INSERT INTO persona VALUES(62,'Daniela Montserrat','Ruiz','López','1993-07-23','Femenino',1,1,12,33,33,706,NULL,52175,'Soltera','dm.ruiz.lopez@outlook.com',NULL,3222393,'RULD930723MDFZPNO9','Mexicana',NULL,'RULD930723PK2');
INSERT INTO persona VALUES(63,'Rosario','Ramírez','Segundo','1993-01-11','Femenino',1,1,9,34,34,NULL,NULL,50740,'Soltera','r.ramirez-segundo@hotmail.com',NULL,NULL,'RASR930111MMCMGS04','Mexicana',NULL,'RASR930111');
INSERT INTO persona VALUES(64,'Joel','Zagoya','López','1985-07-30','Masculino',1,1,2,35,35,105,NULL,50020,'Soltero','joel.zagoya@gmail.com',7222377753,7226517863,'ZALJ850730HMCGPL08','Mexicana',NULL,'ZALJ8507308G9');
INSERT INTO persona VALUES(65,'Iván Galileo','Martínez','Cienfuegos',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(66,'Boris Miguel','López','Rebollar',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(67,'Salih','Abdelaziz',NULL,NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(68,'Rosa María','Valdovinos','Rosas',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(69,'Ansel Yoan','Rodríguez','González',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(70,'Jesùs','Valdés','González',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(71,'Jaime','De la colina','Martínez',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(72,'David','De León','Escobedo',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(73,'José Javier','Reyes','Lagos',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(74,'Mónica de la Luz','Corea','Téllez',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(75,'Jacobo Leonardo','González','Ruiz',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(76,'Juan Manuel','Jacinto','Villegas',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES (1, 'Serafin','Chirino','Ortega','1971-09-30','masculino',1,1,1,1,1,15,0,52740,'Casado','chirino34@hotmail.com',' ',7221826826,'CIOS710930HMCHRR00',
'MEXICANA',' ','CIOS710930');

INSERT INTO persona VALUES (2, 'GIORGIO MACKENZIE','Cruz','MartínezINSERT INTO aspirante VALUES(820964,48,'ESTUDIANTE',2,2,FALSE,14,NULL,8.0,NULL,NULL,NULL);
INSERT INTO aspirante VALUES(2030695,49,'ESTUDIANTE',1,2,FALSE,15,NULL,9.2,NULL,NULL,NULL);
INSERT INTO aspirante VALUES(9610461,50,'ESTUDIANTE',1,2,FALSE,16,NULL,9.2,NULL,NULL,NULL);','1982-04-05','masculino',1,1,2,2,2,311,0,50140,' ','giorgio.mck@gmail.com',' ',7221682227,'CUMG820405HMCRRR00',
'MEXICANA',' ','CUMG820405');

INSERT INTO persona VALUES (3, 'Joanna','Juárez','Michua','1987-06-01','femenino',1,1,3,3,3,100,100,52600,'Soltera','anna.oj@live.com.mx',017131334841,7224741906,'JUMJ870601MMCRCN07',
'MEXICANA',' ','JUMJ870601UY4');
INSERT INTO persona VALUES (4, 'Carlos Alberto','Rojas','Hernández','1976-07-22','masculino',1,1,4,4,4,7,0,55600,'','carojash@gmail.com',' ',' ',' ','MEXICANA',' ','ROHC760722');
INSERT INTO persona VALUES (5,'Lol Chen','Alegria','Mejía','1982-10-04','Femenino',1,1,2,5,5,6,0,50250,'Casada','lolchenalegria@gmail.com',7223264084,7224148707,
'AEML821004MMCLJL03','MEXICANA',' ','AEML821004S84');
****Persona Investigador


INSERT INTO persona VALUES(6,'Miriam','Sánchez','Pozos',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);INSERT INTO aspirante VALUES(820964,48,'ESTUDIANTE',2,2,FALSE,14,NULL,8.0,NULL,NULL,NULL);
INSERT INTO aspirante VALUES(2030695,49,'ESTUDIANTE',1,2,FALSE,15,NULL,9.2,NULL,NULL,NULL);
INSERT INTO aspirante VALUES(9610461,50,'ESTUDIANTE',1,2,FALSE,16,NULL,9.2,NULL,NULL,NULL);
INSERT INTO persona VALUES(7,'Noel','León','Albiter',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(8,'María Dolores','Durán','García',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(9,'Sergio Alejandro','Díaz','Camacho',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(10,'Liliana Ivette','Ávila','Córdoba',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(11,'Vianney','Muñoz','Jiménez',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vmunozj@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(12,'Marco Antonio','Ramos','Corchado',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'maramosc@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(13,'Jesús','García','Barrera','1990-06-09','Masculino',1,1,5,6,6,226,NULL,52600,'Soltero','j3susgb90@gmail.com',7134354547,7131384307,'MOFH721022HMCRJC06','MEXICANA',NULL,'MOFH7210227Y6');
INSERT INTO persona VALUES(14,'Edgar','Jardon','Torres','1994-11-16','Masculino',1,1,6,7,7,NULL,NULL,52360,'Soltero','edgar.jardon@hotmail.com',7294795227,7222480614,'JATE941116HMCRRD00','MEXICANA',NULL,'JATE9411167MA');
INSERT INTO persona VALUES(15,'Juan Ramón','Meda','Gutierrez','1979-08-21','Masculino',1,1,7,8,8,6,NULL,50250,'Casado','jrmeda@gmail.com',NULL,5624324430,'MEGJ790821HCSDTN05','MEXICANA',NULL,'MEGJ790821A41');
INSERT INTO persona VALUES(16,'José Luis','Medina','Valdés','1991-07-10','Masculino',1,1,8,9,9,NULL,NULL,50906,'Soltero','josluis_07@hotmail.com',7222433258,7222433258,'MEVL910710HMCDLS05','MEXICANA',NULL,'MEVL9107103L7');
INSERT INTO persona VALUES(17,'Juan','Monroy','De Jesús','1990-08-15','Masculino',1,1,9,10,10,7,NULL,50740,'Soltero','juan_mj89@hotmail.com',NULL,7151157332,'MOJJ900815HMCNSN05','MEXICANA',NULL,'MOJJ9008153R0');
INSERT INTO persona VALUES(18,'Héctor Manuel','Morales','Fajardo','1972-10-22','Masculino',1,1,2,11,11,123,NULL,50120,'Casado','hector-morales@global.t-bird.edu',7222123580,5518007439,'MOFH721022HMCRJC06','MEXICANA',NULL,'MOFH7210227Y6');
INSERT INTO persona VALUES(19,'Lázaro','Trejo','Allende','1981-06-21','Masculino',1,1,10,12,12,24,NULL,52050,'Soltero','Lzarotrejo@yahoo.com.mx',7281062453,1221104337,'TEAL810621HMCRLZ03','MEXICANA',NULL,'TEAL810621TF5');
INSERT INTO persona VALUES(20,'Adriana','Ventolero','Hernández','1986-03-31','Femenino',1,1,8,13,13,8,NULL,50940,'Soltera','adrianaventolero@gmail.com',7221904908,7223698068,'VEHA860331MMCNRD04','MEXICANA',NULL,'VEHA860331TM4');
INSERT INTO persona VALUES(21,'Paola Guillermina','Vilchis','Gutiérrez','1991-12-09','Femenino',1,1,7,14,14,235,NULL,52169,'Soltera','paoo.vilchis@gmail.com',7222178397,7228858962,'VIGP911209MMCLTL08','MEXICANA',NULL,'VIGP911209512');
INSERT INTO persona VALUES(22,'Juan Carlos','Ávila','Vilchis',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(23,'Martha Belem','Saldívar','Márquez',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(24,'Manuel Alejandro','Jiménez','Lizárraga',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(25,'Marcelo','Romero','Huertas',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(26,'Raymundo','Marcial','Romero',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(27,'David Joaquín','Delgado','Hernández',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(28,'David','Valle','Cruz',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(29,'Luis Adrían','Zúñiga','Avilés',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(30,'Adriana H.','Vilchis','González',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(31,'José Martín','Herrera','Ramírez',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(32,'Usiel Sandino','Silva','Rivera',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(33,'Juana Mariel','Dávila','Vilchis','1988-01-09','Femenino',1,1,11,15,15,37,NULL,50850,'Casada','mardv_702@hotmail.com',17121110053,7223804501,'DAVJ880109MMCVLN06','Mexicana',NULL,'DAVJ880109QQ0');
INSERT INTO persona VALUES(34,'Otniel','Portillo','Rodríguez',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(35,'Jorge','Rodríguez','Arce',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(36,'Lorena','Parra','Rodríguez',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(37,'Oscar Osvaldo','Sandoval','González',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(38,'Rigoberto','Martínez','Méndez',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


INSERT INTO persona VALUES(40,'Elena','Colín','Orozco',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(41,'Cuauhtémoc','Palacios','González',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(42,'María Guadalupe','Olayo','González',NULL,'Femenino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(43,'Guillermo Jesús','Cruz','Cruz',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO persona VALUES(44,'Jorge','Morales','Hernández',NULL,'Masculino',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



*****PAIS
INSERT INTO pais Values(1,'MÉXICO');


*****Estado
INSERT INTO estado Values(1,'ESTADO DE MÉXICO');

INSERT INTO ESTADO Values(2,'CHIAPAS MÉXICO');
INSERT INTO ESTADO VALUES(3,'Ciudad de México');


*****Delegacion
INSERT INTO DelegaMuni Values(1,'OCOYOACAC',1);
INSERT INTO DelegaMuni Values(2,'TOLUCA',1);
INSERT INTO DelegaMuni Values(3,'TIANGUISTECO',1);
INSERT INTO DelegaMuni Values(4,'ZUMPANGO',1);
INSERT INTO DelegaMuni Values(5,'SANTIAGO TIANGUISTENCO ',1);
INSERT INTO DelegaMuni Values(6,'MÉXICO',1);
INSERT INTO DelegaMuni Values(7,'METEPEC',2);
INSERT INTO DelegaMuni Values(8,'ALMOLOYA DE JUÁREZ',1);
INSERT INTO DelegaMuni Values(9,'IXTLAHUACA',1);
INSERT INTO DelegaMuni Values(10,'Lerma',1);
INSERT INTO DelegaMuni Values(11,'Temoaya',1);
INSERT INTO DelegaMuni Values(12,'Metepec',1);
INSERT INTO DelegaMuni Values(13,'Zinacantepec',1);
INSERT INTO DelegaMuni Values(14,'Atlacomulco',1);
INSERT INTO DelegaMuni Values(15,'San Mateo Atenco',1);
INSERT INTO DelegaMuni Values(16,'Atlautla',1);

******Colonia
INSERT INTO colonia Values(1,'JÚAREZ',1);
INSERT INTO colonia Values(2,'VALLE DON CAMILO',2);
INSERT INTO colonia Values(3,'GUADALUPE YANCUICTLALPAN',3);
INSERT INTO colonia Values(4,'BO. San Lorenzo',4);
INSERT INTO colonia Values(5,'San Felipe Tlalmimilolpan',2);
INSERT INTO colonia Values(6,'Centro',5);
INSERT INTO colonia Values(7,'SANTIAGO TLACOMULCO',6);
INSERT INTO colonia Values(8,'LAS MARGARITAS',7);
INSERT INTO colonia Values(9,'SANTA MARIA NATIVITAS',8);
INSERT INTO colonia Values(10,'IXTLAHUACA',9);
INSERT INTO colonia Values(11,'RESIDENCIAL COLÓN',2);
INSERT INTO colonia Values(12,'SAN LORENZO HUITZIZILOPAN',10);
INSERT INTO colonia Values(13,'SAN FRANCISCO TLALCILALCALPAN',8);
INSERT INTO colonia Values(14,'XINANTECATL',7);
INSERT INTO colonia Values(15,'Taborda',11);
INSERT INTO colonia Values(16,'Barrio de San Mateo',12);
INSERT INTO colonia Values(17,'La Virgen',12);
INSERT INTO colonia Values(18,'La Crespa',2);
INSERT INTO colonia Values(19,'Barrio de la Veracruz',13);
INSERT INTO colonia Values(20,'Sor Juana Ines de la Cruz',2);
INSERT INTO colonia Values(21,'Morelos Primera Sección',2);
INSERT INTO colonia Values(22,'Moderna de la Cruz',2);
INSERT INTO colonia Values(23,'Parques Nacionales',2);
INSERT INTO colonia Values(24,'San Pedro Atlapulco',1);
INSERT INTO colonia Values(25,'SAN JERÓNIMO IXTAPANTONGO',9);
INSERT INTO colonia Values(26,'El arbolito',14);
INSERT INTO colonia Values(27,'Vertice',2);
INSERT INTO colonia Values(28,'Santa María',15);
INSERT INTO colonia Values(29,'San Jacinto',16);
INSERT INTO colonia Values(30,'Infonavit San Francisco',12);
INSERT INTO colonia Values(31,'Ferrocarriles Nacionales',2);
INSERT INTO colonia Values(32,'Vicente Guerrero',2);
INSERT INTO colonia Values(33,'Casa Blanca',2);
INSERT INTO colonia Values(34,'La Concepcion de los Baños',9);
INSERT INTO colonia Values(35,'Los Ángeles',2);

****Calle
INSERT INTO calle Values(1,'HIDALGO',1);
INSERT INTO calle Values(2,'SIERRA PARACAIMA',2);
INSERT INTO calle Values(3,'M. HIDALGO',3);
INSERT INTO calle Values(4,'Allende',4);
INSERT INTO calle Values(5,'Calle de la Cruz',5);
INSERT INTO calle Values(6,'BENITO JUÁREZ ',6);
INSERT INTO calle Values(7,'POZO BLANCO',7);
INSERT INTO calle Values(8,'PRIV. PAYNANI',8);
INSERT INTO calle Values(9,'DOMICILIO CONOCIDO',9);
INSERT INTO calle Values(10,'SAN BARTOLO DEL LLANO, BARRIO',10);
INSERT INTO calle Values(11,'MARTIN ALONSO PINZON',11);
INSERT INTO calle Values(12,'NORTE',12);
INSERT INTO calle Values(13,'Av. Independencia',13);
INSERT INTO calle Values(14,'NAUCAMPANTEPETL',14);
INSERT INTO calle Values(15,'Independencia',15);
INSERT INTO calle Values(16,'PRIVADA DE ÁRBOL DE LA VIDA',16);
INSERT INTO calle Values(17,'Ciruelos',17);
INSERT INTO calle Values(18,'Circuito del Pinar',18);
INSERT INTO calle Values(19,'29 de Septiembre',19);
INSERT INTO calle Values(20,'Jilotepec',20);
INSERT INTO calle Values(21,'Venustiano Carranza',21);
INSERT INTO calle Values(22,'Alberto Violante',22);
INSERT INTO calle Values(23,'Parque Chapultepec',23);
INSERT INTO calle Values(24,'Mariano Asuela',24);
INSERT INTO calle Values(25,'Domicilio Conocido',25);
INSERT INTO calle Values(26,'Ebano',26);
INSERT INTO calle Values(27,'Manuel Ma. Contreras',27);
INSERT INTO calle Values(28,'AV. PROLONG. FCO. JAVIER MINA',28);
INSERT INTO calle Values(29,'AV. Francisco I. Madero',29);
INSERT INTO calle Values(30,'Hacienda la Angostura',30);
INSERT INTO calle Values(31,'Privada de Gónzalez Ortega',31);
INSERT INTO calle Values(32,'Abrazo de Acatempan',32);
INSERT INTO calle Values(33,'Lirios',33);
INSERT INTO calle Values(34,'Domicilio Conocido',34);
INSERT INTO calle Values(35,'Pastor Velázquez',35);

*****Institucion

INSERT INTO INSTITUCION(ID_INSTITUCION,NOMBREINSTITUCION,FACULTAD_ESC,CAMPUS)
INSERT INTO institucion Values(1,'Universidad Nacional Autónoma de México',' ',' ');
INSERT INTO institucion Values(2,'INSTITUTO TECNOLÓGICO DE ESTUDIOS SUPERIORES DE ECATEPEC',NULL,NULL);
INSERT INTO institucion Values(3,'Universidad Autónoma del Estado de México',NULL,NULL);
INSERT INTO institucion Values(4,'CENTRO DE INVESTIGACIÓN AVANZADA Y TECNOLOGICA DEL EDO. QUERETARO',NULL,NULL);
INSERT INTO institucion Values(5,'INSTITUTO TECNOLÓGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY CAMPUS GUADALAJARA',NULL,NULL);

*****LINEAACENTUACION

Insert INTO lineaAcentuacion Values(1,'SISTEMAS ENERGÉTICOS');
Insert INTO lineaAcentuacion Values(2,'SISTEMAS DINÁMICOS');
Insert INTO lineaAcentuacion Values(3,'Estructuras');
Insert INTO lineaAcentuacion Values(4,'COMPUTACIÓN');

********Documentacion
INSERT INTO DOCUMENTACION(ID_DOCUMENTO,ID_PERSONA,SOLICITUDADMISION,PROMEDIOCERTI,CARTASRECOMENDACION,CONSTANCIAIgls,CV,CartaMotivos,CartaTiempo,CartaPresentacion,propuesta,pagoDerechos,cartaAceptacion)

INSERT INTO documentacion VALUES(1,5,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(2,13,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(3,14,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(4,15,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(5,16,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(6,17,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(7,18,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(8,19,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(9,20,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(10,21,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);

INSERT INTO documentacion VALUES(11,45,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(12,46,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(13,47,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(14,48,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(15,49,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(16,50,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);


INSERT INTO documentacion VALUES(17,51,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(18,52,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(19,53,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(20,54,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(21,55,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(22,56,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(23,57,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(24,59,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(25,60,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(26,61,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(27,62,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(28,63,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);
INSERT INTO documentacion VALUES(29,64,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE);


*****Generacion
INSERT INTO generacion VALUES(1,'DOCEAVA GENERACIÓN 2021-B');
INSERT INTO generacion VALUES(2,'ONCEAVA GENERACIÓN 2020-B (fin: 2023A)');
INSERT INTO generacion VALUES(3,'DECIMA GENERACIÓN 2019-B  (fin: 2022A)');


*******Aspirante
INSERT INTO generacion VALUES(2,'ONCEAVA GENERACIÓN 2020-B (fin: 2023A)');
INSERT INTO generacion VALUES(3,'DECIMA GENERACIÓN 2019-B  (fin: 2022A)');

INSERT INTO aspirante VALUES(2130833,5,'ESTUDIANTE',1,1,FALSE,1,NULL,9.5,1,NULL,NULL);
INSERT INTO aspirante VALUES(0543998,13,'ESTUDIANTE',2,1,FALSE,2,NULL,9.5,2,NULL,NULL);
INSERT INTO aspirante VALUES(1220773,14,'ESTUDIANTE',4,1,FALSE,3,NULL,9.9,3,NULL,NULL);
INSERT INTO aspirante VALUES(1930528,15,'ESTUDIANTE',2,1,FALSE,4,NULL,NULL,3,NULL,NULL);
INSERT INTO aspirante VALUES(0924395,16,'ESTUDIANTE',2,1,FALSE,5,NULL,NULL,3,NULL,NULL);
INSERT INTO aspirante VALUES(1530127,17,'ESTUDIANTE',2,1,FALSE,6,NULL,9.2,3,NULL,NULL);
INSERT INTO aspirante VALUES(8710538,18,'ESTUDIANTE',2,1,FALSE,7,NULL,9.4,3,NULL,NULL);
INSERT INTO aspirante VALUES(9544266,19,'ESTUDIANTE',2,1,FALSE,8,NULL,9.8,3,NULL,NULL);
INSERT INTO aspirante VALUES(1830531,20,'ESTUDIANTE',1,1,FALSE,9,NULL,9.4,3,NULL,NULL);
INSERT INTO aspirante VALUES(1630631,21,'ESTUDIANTE',1,1,FALSE,10,NULL,9.7,3,NULL,NULL);

INSERT INTO aspirante VALUES(2030694,45,'ESTUDIANTE',2,2,FALSE,11,NULL,8.7,NULL,NULL,NULL);
INSERT INTO aspirante VALUES(351372,46,'ESTUDIANTE',1,2,FALSE,12,NULL,9.6,NULL,NULL,NULL);
INSERT INTO aspirante VALUES(0711087,47,'ESTUDIANTE',2,2,FALSE,13,NULL,9.8,NULL,NULL,NULL);

*********TIENE UNA D?*****LA OMITÍ
INSERT INTO aspirante VALUES(820964,48,'ESTUDIANTE',2,2,FALSE,14,NULL,8.0,NULL,NULL,NULL);
INSERT INTO aspirante VALUES(2030695,49,'ESTUDIANTE',1,2,FALSE,15,NULL,9.2,NULL,NULL,NULL);
INSERT INTO aspirante VALUES(9610461,50,'ESTUDIANTE',1,2,FALSE,16,NULL,9.2,NULL,NULL,NULL);

INSERT INTO aSPIRANTE(id_aspirante,id_persona,estado,id_linea,id_generacion,documentacion,id_documento,id_carrera,promedio,id_institucion,email_insitucional,url)

INSERT INTO aspirante VALUES(1630761,51,'ESTUDIANTE',2,3,FALSE,17,NULL,9.1,3,NULL,NULL);
INSERT INTO aspirante VALUES(1630663,52,'BAJA TEMPORAL',4,3,FALSE,18,NULL,9.3,3,NULL,NULL);
INSERT INTO aspirante VALUES(0010130,53,'ESTUDIANTE',3,3,FALSE,19,NULL,9.0,3,NULL,NULL);
INSERT INTO aspirante VALUES(1730625,54,'ESTUDIANTE',1,3,FALSE,20,NULL,NULL,3,NULL,NULL);
INSERT INTO aspirante VALUES(1130554,55,'ESTUDIANTE',1,3,FALSE,21,NULL,8.5,3,NULL,NULL);
INSERT INTO aspirante VALUES(9611740,56,'ESTUDIANTE',2,3,FALSE,22,NULL,9.0,3,NULL,NULL);
INSERT INTO aspirante VALUES(1930608,57,'ESTUDIANTE',2,3,FALSE,23,NULL,9.7,4,NULL,NULL);
INSERT INTO aspirante VALUES(0711158,59,'ESTUDIANTE',4,3,FALSE,24,NULL,9.4,3,NULL,NULL);
INSERT INTO aspirante VALUES(0612098,60,'ESTUDIANTE',4,3,FALSE,25,NULL,9.4,3,NULL,NULL);
INSERT INTO aspirante VALUES(0312478,61,'ESTUDIANTE',2,3,FALSE,26,NULL,8.4,3,NULL,NULL);
INSERT INTO aspirante VALUES(1120857,62,'BAJA TEMPORAL',2,3,FALSE,27,NULL,9.2,3,NULL,NULL);
INSERT INTO aspirante VALUES(1730626,63,'ESTUDIANTE',1,3,FALSE,28,NULL,NULL,3,NULL,NULL);
INSERT INTO aspirante VALUES(0013282,64,'ESTUDIANTE',2,3,FALSE,29,NULL,8.9,5,NULL,NULL);


*****Doctorado

INSERT INTO DOCTORADO(id_doctorado,cvu,carrera_posgrd,grado,promedio_maestria,fecha_ingreso,duracion_plan,fecha_termino,
generacion,estatus,id_institucion,id_programa,id_protocolo,id_asesor,id_coodirector,id_tutor1,id_tutor2,id_asesorext,
id_tesis,email_institu)

INSERT INTO doctorado VALUES(2130833,271433,NULL,NULL,9.5,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,1,1,2,3,4,1,NULL,NULL);
INSERT INTO doctorado VALUES(0543998,1147722,NULL,NULL,9.5,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,2,7,8,NULL,NULL,2,NULL,NULL);
INSERT INTO doctorado VALUES(1220773,783344,NULL,NULL,9.9,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,3,9,NULL,10,11,3,NULL,'ejardont@uaemex.mx');
INSERT INTO doctorado VALUES(1930528,1009754,NULL,NULL,NULL,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,4,12,NULL,13,14,4,NULL,NULL);
INSERT INTO doctorado VALUES(0924395,930281,NULL,NULL,NULL,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,5,12,15,13,NULL,5,NULL,NULL);
INSERT INTO doctorado VALUES(1530127,702288,NULL,NULL,9.2,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,6,16,NULL,17,18,6,NULL,NULL);
INSERT INTO doctorado VALUES(8710538,456303,NULL,NULL,9.4,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,7,17,NULL,16,19,7,NULL,NULL);
INSERT INTO doctorado VALUES(9544266,281066,NULL,NULL,9.8,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,8,8,NULL,7,16,2,NULL,NULL);
INSERT INTO doctorado VALUES(1830531,930363,NULL,NULL,9.4,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,9,21,22,NULL,23,8,NULL,NULL);
INSERT INTO doctorado VALUES(1630631,709996,NULL,NULL,9.7,'2021-08-03','3 AÑOS','2024-08-03',1,'ESTUDIANTE',3,1,10,3,NULL,21,NULL,9,NULL,NULL);


INSERT INTO doctorado VALUES(2030694,1028331,NULL,NULL,8.7,'2020-09-03','3 AÑOS','2023-09-03',2,'ESTUDIANTE',3,1,11,8,24,7,NULL,NULL,NULL,'ocraviotog001@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(351372,589965,NULL,NULL,9.6,'2020-09-03','3 AÑOS','2023-09-03',2,'ESTUDIANTE',3,1,12,25,NULL,NULL,NULL,NULL,NULL,'acruzo005@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(0711087,863595,NULL,NULL,9.8,'2020-09-03','3 AÑOS','2023-09-03',2,'ESTUDIANTE',3,1,13,3,NULL,NULL,NULL,NULL,NULL,'egonzalezm087@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(820964,577122,NULL,NULL,8.0,'2020-09-03','3 AÑOS','2023-09-03',2,'ESTUDIANTE',3,1,14,8,NULL,7,16,NULL,NULL,'hmoralesf001@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(2030695,268300,NULL,NULL,9.2,'2020-09-03','3 AÑOS','2023-09-03',2,'ESTUDIANTE',3,1,15,1,19,25,NULL,NULL,NULL,'mjaimest001@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(9610461,248264,NULL,NULL,9.2,'2020-09-03','3 AÑOS','2023-09-03',2,'ESTUDIANTE',3,1,16,1,26,22,NULL,NULL,NULL,'jmarina003@alumno.uaemex.mx');


INSERT INTO doctorado VALUES(1630761,786136,NULL,NULL,9.1,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,17,13,27,7,NULL,NULL,NULL,'jalvarezd761@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(1630663,648192,NULL,NULL,9.3,'2019-08-05','3 AÑOS','2022-08-05',3,'BAJA TEMPORAL',3,1,18,28,29,10,9,NULL,NULL,'gbernalb663@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(0010130,289688,NULL,NULL,9.0,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,19,30,31,32,NULL,NULL,NULL,'ccastillocas@uaemex.mx');
INSERT INTO doctorado VALUES(1730625,860506,NULL,NULL,NULL,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,20,21,23,22,NULL,NULL,NULL,'ffloresn002@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(1130554,412252,NULL,NULL,8.5,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,21,25,NULL,NULL,NULL,NULL,NULL,'cgutierrezl@uaemex.mx');
INSERT INTO doctorado VALUES(9611740,351022,NULL,NULL,9.0,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,22,17,33,19,NULL,NULL,NULL,'ljimenezm004@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(1930608,353237,NULL,NULL,9.7,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,23,12,34,19,NULL,NULL,NULL,'ajuarezh004@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(0711158,787172,NULL,NULL,9.4,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,24,10,35,9,NULL,NULL,NULL,'mlopezm158@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(0612098,784441,NULL,NULL,9.4,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,25,5,6,10,NULL,NULL,NULL,'rmercadoh098@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(0312478,646839,NULL,NULL,8.4,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,26,13,36,16,NULL,NULL,NULL,'vmmontanos@uaemex.mx');
INSERT INTO doctorado VALUES(1120857,863733,NULL,NULL,9.2,'2019-08-05','3 AÑOS','2022-08-05',3,'BAJA TEMPORAl',3,1,27,7,27,13,NULL,NULL,NULL,NULL);
INSERT INTO doctorado VALUES(1730626,860515,NULL,NULL,NULL,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,28,22,37,21,NULL,NULL,NULL,'rramirezs005@alumno.uaemex.mx');
INSERT INTO doctorado VALUES(0013282,1009402,NULL,NULL,8.9,'2019-08-05','3 AÑOS','2022-08-05',3,'ESTUDIANTE',3,1,29,12,7,13,NULL,NULL,NULL,'jzagoyal002@alumno.uaemex.mx');


*****PROTOCOLO

INSERT INTO PROTOCOLO(ID_PROTOCOLO,NOMBRE,FECHA);
INSERT INTO protocolo VALUES(1,'Estudio de las propiedades fisicoquímicas del PET expuesto a radiación solar concentrada como posible alternativa de disposición final',NULL);
INSERT INTO protocolo VALUES(2,'Modelado y control de vehículo aéreo estable por construcción','2022-02-24');
INSERT INTO protocolo VALUES(3,'Un modelo para optimizar la localización-asignación de servicios de atención médica domiciliaria',NULL);
INSERT INTO protocolo VALUES(4,'FUGRAD: Granada con gradualidad de daño que funciona con base en una nueva relación de índice de daño',NULL);
INSERT INTO protocolo VALUES(5,'Diseño de un exoesqueleto para rehabilitación de miembro superior',NULL);

INSERT INTO protocolo VALUES(6,'Automatización de las pruebas de desempeño físico para la cuantificación del riesgo de caída utilizando un smartphone',NULL);
INSERT INTO protocolo VALUES(7,'Development of a method and platform to detect multimodal academic stress levels from multiple data sources',NULL);
INSERT INTO protocolo VALUES(8,'Determinación de Protocolos Óptimos para la Administración de Inmunoterapia con Células Dendríticas contra el Cáncer: Enfoque de Sistemas con Retardos',NULL);
INSERT INTO protocolo VALUES(9,'Estudio de las propiedades electro-ópticas en películas bicompuestas de SnOx/CuOy sobre substratos de polietilentereftalato (PET) obtenidas mediante pulverización catódica','2022-03-24');
INSERT INTO protocolo VALUES(10,'Diseño de electrodos flexibles de carbono-níquel para su aplicación en supercapacitores',NULL);
INSERT INTO protocolo VALUES(11,'Planeación de trayectorias y diseño de control para el desarrollo de maniobras aéreas acrobáticas en un vehículo aéreo no tripulado tipo cuadrirrotor','2021-06-12');
INSERT INTO protocolo VALUES(12,'Sistema de gestión ambiental a través del análisis de ciclo de vida para la producción de tortillas',NULL);
INSERT INTO protocolo VALUES(13,'Análisis térmico y comparativa de una planta conceptual de generación directa de vapor empleando canal parabólico y reflectores Fresnel optimizados',NULL);

INSERT INTO protocolo VALUES(14,'Sistema de control para la estabilización de voltaje en la terminal de potencial de un acelerado Tánden Van de Graaff','2021-06-12');
INSERT INTO protocolo VALUES(15,'Desarrollo biomimético de un módulo para fachada arquitectónica automatizada como estrategia de control energético en la CDMX.','2021-09-28');
INSERT INTO protocolo VALUES(16,'Propuesta de modificación y análisis mediante CFD del perfil aerodinámico para un rotor de un aerogenerador de eje vertical bioinspirado en la aleta de la ballena jorobada','2021-04-06');
INSERT INTO protocolo VALUES(17,'Control law synthesis for tensegrity mechanisms','2020-02-06');
INSERT INTO protocolo VALUES(18,'Desarrollo de una metaheurística para la obtención de patrones similares frecuentes','2020-09-11');
INSERT INTO protocolo VALUES(19,'Determinación de los niveles de desempeño de edificios considerando su uso y costos asociados','2022-03-14');
INSERT INTO protocolo VALUES(20,'Síntesis por plasma de mesopartículas de polialilamina','2020-06-22');
INSERT INTO protocolo VALUES(21,'Evaluación de un sistema de concentración solar para la generación directa de vapor aplicado en calor de proceso',NULL);
INSERT INTO protocolo VALUES(22,'Sistema electrónico de medición de señales fisiológicas para la detección de respuesta hacia el estrés académico','2020-09-29');
INSERT INTO protocolo VALUES(23,'MUBIO I-E 3D: Design and Manufacturing of a 3D injection extrusion bioprinter','2019-11-19');

INSERT INTO protocolo VALUES(24,'Estudio de la complejidad computacional de #k-SAT',NULL);
INSERT INTO protocolo VALUES(25,'Modelo gramatical para generar la estructura morfológica inicial de criaturas virtuales considerando premisas de vida y evolución.','2021-06-21');
INSERT INTO protocolo VALUES(26,'Desarrollo de un sistema para asistencia de un paciente con deterioro cognitivo leve durante la actividad de comer','2020-12-14');
INSERT INTO protocolo VALUES(27,'Modelling and control of spatial tensegrity devices for percutaneous insertion','2020-02-06');
INSERT INTO protocolo VALUES(28,'Síntesis electro-asistida de polímeros híbridos conjugados','2020-06-22');
INSERT INTO protocolo VALUES(29,'FPROS21: Diseño de una prótesis para tobillo y pie','2020-11-19');


******PROGRAMA 

INSERT INTO VALUES(ID_PROGRAMA,NOMBRE);
INSERT INTO proAcademico VALUES(1,'DOCTORADO EN CIENCIA DE LA INGENIERÍA');

********INVESTIGADOR
INSERT INTO INVESTIGADOR (ID_INVESTIGADOR,ID_PERSONA,EMAIL_INSTITU,ID_CARGO1,PERIODO1,ID_CARGO2,PERIODO2,ID_CARGO3,PERIODO3,ID_LINEA,ID_SNI,ID_PRODEP);

INSERT INTO investigador VALUES(1,6,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
INSERT INTO investigador VALUES(2,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(3,8,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
INSERT INTO investigador VALUES(4,9,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL);
INSERT INTO investigador VALUES(5,11,'vmunozj@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL);
INSERT INTO investigador VALUES(6,12,'maramosc@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL);

INSERT INTO investigador VALUES(7,22,'javilav776@profesor.uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);
INSERT INTO investigador VALUES(8,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);
INSERT INTO investigador VALUES(9,25,'mromeroh@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL);
INSERT INTO investigador VALUES(10,26,'jmarcialr006@profesor.uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL);
INSERT INTO investigador VALUES(11,27,'david.delgado@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(12,29,'lazunigaa@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);
INSERT INTO investigador VALUES(13,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);
INSERT INTO investigador VALUES(14,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(15,2,'gmcruzm@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(16,34,'oportillor@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);
INSERT INTO investigador VALUES(17,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);
INSERT INTO investigador VALUES(18,36,'lparrar_s@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(19,38,'rmartinezme@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);

INSERT INTO investigador VALUES(20,39,'jcavilav@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);//No existe 

INSERT INTO investigador VALUES(21,40,'ecolino@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
INSERT INTO investigador VALUES(22,41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
INSERT INTO investigador VALUES(23,42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(24,24,'manuel.jimenezlzr@uanl.edu.mx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(25,65,'imartinezc233@profesor.uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
INSERT INTO investigador VALUES(26,66,'blopezr470@profesor.uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(27,67,'sabdelaziz_ext@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(28,68,'rvaldovinosr446@profesor.uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL);
INSERT INTO investigador VALUES(29,69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(30,70,'jvaldes@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL);
INSERT INTO investigador VALUES(31,71,'jdelacolinam147@profesor.uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL);
INSERT INTO investigador VALUES(32,72,'ddeleone492@profesor.uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL);
INSERT INTO investigador VALUES(33,73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(34,74,'mlcoreat_s@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(35,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO investigador VALUES(36,76,'jmjacintov@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL);
INSERT INTO investigador VALUES(37,43,'gjcruzc_s@uaemex.mx',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

****AsesorExt
INSERT INTO AsesorExt(id_asesor,id_persona,id_linea,grado)
INSERT INTO asesorExt Values(1,10,NULL,NULL);
INSERT INTO asesorExt Values(2,24,NULL,NULL);
INSERT INTO asesorExt Values(3,28,NULL,NULL);
INSERT INTO asesorExt Values(4,32,NULL,NULL);
INSERT INTO asesorExt Values(5,33,NULL,NULL);
INSERT INTO asesorExt Values(6,37,NULL,NULL);
INSERT INTO asesorExt Values(7,30,NULL,NULL);
INSERT INTO asesorExt Values(8,43,NULL,NULL);
INSERT INTO asesorExt Values(9,44,NULL,NULL);




*****Usuario
INSERT INTO usuario VALUES(1,5,NULL,NULL,'VianneyMJ'); 
INSERT INTO usuario VALUES(2,6,NULL,NULL,'MarcoRM'); 



******Beca
INSERT INTO Beca VALUES(id_beca,nombre,tipo);
INSERT INTO beca VALUES(1,NULL,'CONACYT');

******Beca_DTSACA DATE: YYYY-MM-DD
INSERT INTO Beca_dtsACA VALUES(id_beca,id_doctorado,fecha_inicio,fecha_fin,estado);

INSERT INTO beca_dtsAca VALUES(1,2130833,'2021-08-01','2024-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,0543998,'2021-08-01','2024-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1220773,'2021-08-01','2024-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1930528,'2021-08-01','2024-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,0924395,'2021-08-01','2024-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1530127,'2021-08-01','2024-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,9544266,'2021-08-01','2024-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1830531,'2021-08-01','2024-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1630631,'2021-08-01','2024-07-31','ACTIVO');

INSERT INTO beca_dtsAca VALUES(1,2030694,'2020-09-01','2023-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,351372,'2020-09-01','2023-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,0711087,'2020-09-01','2023-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,9610461,'2020-09-01','2023-07-31','ACTIVO');

INSERT INTO beca_dtsAca VALUES(1,1630761,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1630663,'2019-08-01','2022-07-31','INACTIVO');
INSERT INTO beca_dtsAca VALUES(1,0010130,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1730625,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1130554,'2020-02-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,9611740,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1930608,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,0711158,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,0612098,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,0312478,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1120857,'2019-08-01','2022-07-31','INACTIVO');
INSERT INTO beca_dtsAca VALUES(1,1730626,'2019-08-01','2022-07-31','ACTIVO');
INSERT INTO beca_dtsAca VALUES(1,0013282,'2019-08-01','2022-07-31','ACTIVO');



