DROP DATABASE IF EXISTS  proyecto;
CREATE DATABASE IF NOT EXISTS proyecto;
USE proyecto;

/* niv_acc -> 0: invitado, 1: usuario, 2:admin */

DROP TABLE IF EXISTS registro;
CREATE TABLE registro(
	id INT UNSIGNED AUTO_INCREMENT,
	nombre TEXT NOT NULL,
	correo VARCHAR(50) NOT NULL,
	niv_acc ENUM('0', '1', '2') DEFAULT '1',
	clave VARCHAR(100) NOT NULL,
	token VARCHAR(255),
	fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	PRIMARY KEY(id),
	CONSTRAINT UNIQUE(correo)
);

DROP TABLE IF EXISTS login;
CREATE TABLE login(
	id INT UNSIGNED AUTO_INCREMENT,
	correo VARCHAR(50) NOT NULL,
	clave VARCHAR(255) NOT NULL,
	niv_acc SET("Usuario", "Admin") DEFAULT "Usuario",
	fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	PRIMARY KEY(id),
	FOREIGN KEY(correo) REFERENCES registro(correo)
);

DROP TABLE IF EXISTS populares;
CREATE TABLE populares(
	id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT UNIQUE(nombre)
);

DROP TABLE IF EXISTS fecha;
CREATE TABLE fecha(
	id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	fecha_estreno DATE,
	PRIMARY KEY(id),
	FOREIGN KEY(nombre) REFERENCES populares(nombre)
);

DROP TABLE IF EXISTS film;
CREATE TABLE film(
	id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	genero VARCHAR(40),
  	fecha_lanzamiento DATE,
	PRIMARY KEY(id),
	CONSTRAINT UNIQUE(nombre)
);

DROP TABLE IF EXISTS genero;
CREATE TABLE genero(
	id INT UNSIGNED AUTO_INCREMENT,
	genero VARCHAR(40),
	PRIMARY KEY(id),
	FOREIGN KEY(id) REFERENCES populares(id),
	FOREIGN KEY(id) REFERENCES film(id)
);

INSERT INTO `registro` (`nombre`, `correo`,`clave`, `niv_acc`) VALUES ('Sugey', 'chaconsugey2003@gmail.com','$2b$10$Q29/W7sccOJ8CCzHlPrdzOf5Spajll0lh57mvazR/D9zpvSsHl5UW', '2');

INSERT INTO `populares`(`nombre`) VALUES ('avatar'),('boyka'), ('the infernal machine'), ('she will'), ('bestia'), ('demon slayer'), ('last man down'), ('hocus pocus 2'), ('obi-wan kenobi'), ('jujutsu kaisen'),('morbius'),('nemesis'),('lou'),('orphan'),('presencias'),('fullmetal alchemist'),('athena'),('dahmer'),('nope'),('the exorcism of god'),('memory'),('venom'),('black adam'),('catch the fair one');

INSERT INTO `film`(`nombre`, `genero`, `fecha_lanzamiento`) VALUES ('el hombre del norte','acción', '2022-04-07'),('chernobyl','acción', '2021-04-15'), ('wrath of man','acción', '2021-04-22'), ('the witch','acción', '2022-06-15'), ('fury','acción', '2014-10-15'), ('hasta el ultimo hombre','drama', '2016-10-07'), ('el ultimo duelo','drama', '2021-10-13'), ('creed','drama', '2015-11-25'), ('interstellar','drama', '2014-11-05'), ('fifty shade freed','drama','2018-01-17'),('halloween','terror','2018-10-18'),('the unholy','terror','2021-03-31'),('insidios','terror','2013-09-12'),('mamá','terror','2013-09-17'),('the vatican tapes','terror','2015-07-24'),('deadpool','comedia','2016-02-09'),('grown ups','comedia','2013-07-11'),('el otro guardespaldas','comedia','2017-08-16'),('almighty','comedia','2003-05-23'),('rush hour','comedia','2007-08-08'),('el corredor del laberinto','ciencia ficción', '2014-09-10'),('eternals','ciencia ficción','2021-11-03'),('matrix','ciencia fición','2021-12-16'),('godzilla vs kong','ciencia ficción','2021-03-24'),('pacifi rim','ciencia ficción','2013-05-11'),('colisión','crimen','2022-04-16'),('pasado violento','crimen','2022-01-28'),('the fate of the furious','crimen','2015-03-05'),('parabelum','crimen','2019-05-15'),('crank','crimen','2006-08-31'),('los secretos de dumbledore','aventura','2022-04-06'),('mortal kombat','aventura','2022-08-09'),('the last warrior','aventura','2021-12-23'),('el señor de los anillos','aventura','2001-12-18'),('el hobbit','aventura','2014-12-10');

INSERT INTO `registro` (`nombre`, `correo`,`clave`, `niv_acc`) VALUES ('Sugey', 'chaconsugey2003@gmail.com','$2b$10$Q29/W7sccOJ8CCzHlPrdzOf5Spajll0lh57mvazR/D9zpvSsHl5UW', '2');

INSERT INTO `admin` (`nombre`, `correo`,`clave`, `niv_acc`) VALUES ('Sugey', 'chaconsugey2003@gmail.com','$2b$10$Q29/W7sccOJ8CCzHlPrdzOf5Spajll0lh57mvazR/D9zpvSsHl5UW', '2');



INSERT INTO `fecha`(`nombre`, `fecha_estreno`) VALUES ('Avatar', '2022-12-14'), ('boyka','2016-08-01'), ('the infernal machine','2022-09-23'), ('she will','2022-05-15'), ('bestia','2022-08-11'), ('demon slayer','2019-03-29'), ('last man down','2022-11-03'), ('hocus pocus 2','2022-09-27'), ('obi-wan kenobi','2022-09-08'), ('jujutsu kaisen','2021-12-24'),('morbius','2022-03-30'), ('nemesis','2022-08-25'), ('lou','2022-09-23'), ('orphan','2022-05-27'), ('presencias','2022-09-07'), ('fullmetal alchemist','2022-06-20'), ('athena','2022-09-09'), ('dahmer','2002-05-21'), ('nope','2022-05-20'), ('the exorcism of god','2022-03-11'), ('memory','2022-04-28'), ('venom','2021-09-30'), ('black adam','2022-06-19'), ('catch the fair one','2022-02-11');

INSERT INTO `genero`(`genero`) VALUES ('Accion'), ('Misterio'), ('Terror'), ('Suspenso'), ('Fantasia'), ('Documental'), ('Ciencia Ficcion'), ('Drama'), ('Crimen'), ('Comedia'), ('Aventura');