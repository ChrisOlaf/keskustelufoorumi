﻿DROP DATABASE IF EXISTS Foorumi;
CREATE DATABASE Foorumi
DEFAULT CHARACTER SET utf8;
USE Foorumi;
SET NAMES 'utf8';
SET AUTOCOMMIT=0;
DROP TABLE IF EXISTS `alue`;
CREATE TABLE `alue` (
`alueid` int NOT NULL AUTO_INCREMENT,
`nimi` varchar(128) NOT NULL,
`kuvaus` text NOT NULL,
PRIMARY KEY (`alueid`)
);
INSERT INTO `alue` VALUES(1, 'Netflix-sarjat', 'Keskustelua Netflix-sarjoista');
INSERT INTO `alue` VALUES(2, 'HBO-fanit', 'Keskustelua HBO-faneille');
INSERT INTO `alue` VALUES(3, 'Julkkisjuorut', 'Juoruja julkkiksista');
INSERT INTO `alue` VALUES(4, 'Viiniarvostelut', 'Viinikeskustelua');
INSERT INTO `alue` VALUES(5, 'Munchies', 'Parhaat snacks-ideat!');

DROP TABLE IF EXISTS `henkilo`;
CREATE TABLE `henkilo` (
`hloid` int NOT NULL AUTO_INCREMENT,
`nimi` varchar(128) NOT NULL,
`nimimerkki` varchar(128),
`kuvaus` text,
`rooli` ENUM('admin', 'rekisteroitynyt', 'moderaattori', 'muu'),
`kuvausteksti` text,
PRIMARY KEY (`hloid`)
);
INSERT INTO `henkilo` VALUES(1, 'root', 'Mestari', 'Pääylläpitäjä',
'admin', 'Mestari on mestari.');
INSERT INTO `henkilo` VALUES(2, 'anonymous', 'Anonyymi', 'Anonyymi
käyttäjä, ei kirjautunut', 'rekisteroitynyt', 'Anonanananana');
INSERT INTO `henkilo` VALUES(3, 'seppo', 'HovinSeppo', 'Virtuoosi', 'rekisteroitynyt', 'Seppo on oikea Mestari!');

DROP TABLE IF EXISTS `salasana`;
CREATE TABLE `salasana` (
`salasanaid` int NOT NULL AUTO_INCREMENT,
`kayttaja` int NOT NULL,
`salasana` varchar(128) NOT NULL,
CONSTRAINT `salasana_henkilo_fk` FOREIGN KEY (`kayttaja`) REFERENCES
`henkilo` (`hloid`),
PRIMARY KEY (`salasanaid`)
);
INSERT INTO `salasana` VALUES(1,1,'academy');
INSERT INTO `salasana` VALUES(2,2,'adminadmin');
INSERT INTO `salasana` VALUES(3,3,'hovi');

DROP TABLE IF EXISTS `viesti`;
CREATE TABLE `viesti` (
`id` int NOT NULL AUTO_INCREMENT,
`kirjoittaja` int NOT NULL,
`alueid` int NOT NULL,
`otsikko` varchar(255),
`viesti` text NOT NULL,
`vastaus` int DEFAULT NULL,
`kirjoitettu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`viimeksimuutettu` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE
CURRENT_TIMESTAMP,
CONSTRAINT `viesti_henkilo_fk` FOREIGN KEY (`kirjoittaja`) REFERENCES
`henkilo` (`hloid`),
CONSTRAINT `viesti_alue_fk` FOREIGN KEY (`alueid`) REFERENCES `alue`
(`alueid`),
PRIMARY KEY (`id`)
);

INSERT INTO `viesti` VALUES(1, 1, 1, 'Sarjavinkkejä', 'Alle vinkkejä lempparisarjoistanne, kiitos!', NULL, NULL, NULL);
INSERT INTO `viesti` VALUES(2, 1, 2, 'OMG GOT!!!', 'Siis pahinta oli ku se yks ni sit ne muutki ja sit kaikki oli ihan et OMG.', NULL, NULL, NULL);
INSERT INTO `viesti` VALUES(3, 2, 3, 'Seppo Hovi nähty!', 'Ette siis ikinä usko mut näin SEPPO HOVIN OIKEESTI stockal! Onx muut nähny!?', NULL, NULL, NULL);
INSERT INTO `viesti` VALUES(4, 3, 1, 'Tosi hyviä on esim..', 'No mie tykkään marveleist ja sit mie tykkään niist muistkii', 1, NULL, NULL);
INSERT INTO `viesti` VALUES(5, 2, 5, 'OM NOM NOM NOM', 'ON NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM NOM', NULL, NULL, NULL);
INSERT INTO `viesti` VALUES(6, 1, 1, 'Ootteks kattonu?', 'Sitä yhtä uutta elokuvaa niist kissoista?', NULL, NULL, NULL);
INSERT INTO `viesti` VALUES(7, 3, 4, 'Viinit haisee', 'Kaikki haisee. Paitsi Hankasalmi.', NULL, NULL, NULL);
INSERT INTO `viesti` VALUES(8, 3, 5, 'NOM NOM NOM NOM', 'NOM NOM NOM!', 5, NULL, NULL);
INSERT INTO `viesti` VALUES(9, 1, 4, 'Suosittelen hyviä viinejä!', 'Hyviä pvat etenkin viinit yksi ja kaksi.', NULL, NULL, NULL);
COMMIT;
SET AUTOCOMMIT=1;