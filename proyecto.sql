DROP DATABASE IF EXISTS  proyecto;
CREATE DATABASE IF NOT EXISTS proyecto;
USE proyecto;

/* niv_acc -> 0: invitado, 1: usuario, 2:admin */

DROP TABLE IF EXISTS registro;
CREATE TABLE registro(
	id INT UNSIGNED AUTO_INCREMENT,
	nombre TEXT NOT NULL,
	correo VARCHAR(50) NOT NULL,
	clave VARCHAR(100) NOT NULL,
	niv_acc ENUM('0', '1', '2') DEFAULT '1',
	token VARCHAR(255),
	fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	PRIMARY KEY(id),
	CONSTRAINT UNIQUE(correo)
);

DROP TABLE IF EXISTS login;
CREATE TABLE login(
	id INT UNSIGNED AUTO_INCREMENT,
	correo VARCHAR(50) NOT NULL,
	clave VARCHAR(100) NOT NULL,
	token VARCHAR(255),
	fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	PRIMARY KEY(id),
	FOREIGN KEY(correo) REFERENCES registro(correo)
);

DROP TABLE IF EXISTS populares;
CREATE TABLE populares(
	id INT UNSIGNED AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
  genero VARCHAR(40),
	PRIMARY KEY(id),
	CONSTRAINT UNIQUE(nombre)
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

INSERT INTO `populares`(`nombre`, `genero`) VALUES ('avatar','ciencia ficción'),('boyka','acción'), ('the infernal machine','misterio'), ('she will','terror'), ('bestia','suspenso'), ('demon slayer','fantasía'), ('last man down','acción'), ('hocus pocus 2','fantasía'), ('obi-wan kenobi','documental'), ('jujutsu kaisen','acción'),('morbius','ciencia ficción'),('nemesis','drama'),('lou','suspenso'),('orphan','terror'),('presencias','terror'),('fullmetal alchemist','fantasía'),('athena','drama'),('dahmer','crimen'),('nope','ciencia ficción'),('the exorcism of god','terror'),('memory','crimen'),('venom','ciencia ficción'),('black adam','fantasía'),('catch the fair one','drama');

INSERT INTO `film`(`nombre`, `genero`, `fecha_lanzamiento`) VALUES ('el hombre del norte','acción', '2022-04-07'),('chernobyl','acción', '2021-04-15'), ('wrath of man','acción', '2021-04-22'), ('the witch','acción', '2022-06-15'), ('fury','acción', '2014-10-15'), ('hasta el ultimo hombre','drama', '2016-10-07'), ('el ultimo duelo','drama', '2021-10-13'), ('creed','drama', '2015-11-25'), ('interstellar','drama', '2014-11-05'), ('fifty shade freed','drama','2018-01-17'),('halloween','terror','2018-10-18'),('the unholy','terror','2021-03-31'),('insidios','terror','2013-09-12'),('mamá','terror','2013-09-17'),('the vatican tapes','terror','2015-07-24'),('deadpool','comedia','2016-02-09'),('grown ups','comedia','2013-07-11'),('el otro guardespaldas','comedia','2017-08-16'),('almighty','comedia','2003-05-23'),('rush hour','comedia','2007-08-08'),('el corredor del laberinto','ciencia ficción', '2014-09-10'),('eternals','ciencia ficción','2021-11-03'),('matrix','ciencia fición','2021-12-16'),('godzilla vs kong','ciencia ficción','2021-03-24'),('pacifi rim','ciencia ficción','2013-05-11'),('colisión','crimen','2022-04-16'),('pasado violento','crimen','2022-01-28'),('the fate of the furious','crimen','2015-03-05'),('parabelum','crimen','2019-05-15'),('crank','crimen','2006-08-31'),('los secretos de dumbledore','aventura','2022-04-06'),('mortal kombat','aventura','2022-08-09'),('the last warrior','aventura','2021-12-23'),('el señor de los anillos','aventura','2001-12-18'),('el hobbit','aventura','2014-12-10');

INSERT INTO `registro` (`nombre`, `correo`,`clave`, `niv_acc`) VALUES ('Sugey', 'chaconsugey2003@gmail.com','$2b$10$Q29/W7sccOJ8CCzHlPrdzOf5Spajll0lh57mvazR/D9zpvSsHl5UW', '2');

