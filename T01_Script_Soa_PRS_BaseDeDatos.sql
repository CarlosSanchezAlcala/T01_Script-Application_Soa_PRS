--------------------------------------------------------------------------------------------------------------------------------------------------------

-- TRUNCATE ubigeo RESTART IDENTITY;
-- TRUNCATE teen RESTART IDENTITY;
-- TRUNCATE funcionary RESTART IDENTITY;
-- TRUNCATE operative_unit RESTART IDENTITY;
-- TRUNCATE funcionary_teen RESTART IDENTITY;

-- DROP TABLE ubigeo;
-- DROP TABLE funcionary;
-- DROP TABLE attorney;
-- DROP TABLE operative_unit;
-- DROP TABLE teen;
-- DROP TABLE funcionary_teen;

--------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ubigeo
(
	 codubi 			char(6) NOT NULL PRIMARY KEY,
	 depar 				varchar(100)  NOT NULL,
     provi 				varchar(100)  NOT NULL,
     distri 			varchar(100)  NOT NULL,
	 status				char(1) NOT NULL DEFAULT ('A')
)
;

-- CREATION TABLE OF (ATTORNEY)
CREATE TABLE attorney
(
     id_attorney 		serial 			PRIMARY KEY,
     name 				varchar	(200) 	NOT NULL,
	 surnameFather 		varchar(200) 	NOT NULL,
	 surnameMother 		varchar(200) 	NOT NULL,
     dni 				varchar(8) 		NOT NULL,
     phonenumber 		varchar(9) 		NOT NULL,
     address 			varchar(200) 	NOT NULL,
     email 				varchar(200) 	NOT NULL,
	 codubi				char(6) 		NOT NULL REFERENCES ubigeo(codubi),
     status 			char(1) 		NOT NULL DEFAULT ('A')
);

-- CREATION TABLE OF (TEEN)
CREATE TABLE teen
(
     id_teen		 	serial 			PRIMARY KEY,
     name 				varchar(200) 	NOT NULL,
     surnameFather 		varchar(200) 	NOT NULL,
	 surnameMother 		varchar(200) 	NOT NULL,
     dni 				varchar(8) 		NOT NULL,
	 phonenumber 		varchar(9) 		NOT NULL,
	 address 			varchar(200) 	NOT NULL,
     email 				varchar(200) 	NOT NULL,
	 birthade			DATE 			NOT NULL,
	 gender				char(1)			NOT NULL,
	 crime_committed	varchar(200)	NOT NULL,
	 id_attorney		integer			NOT NULL REFERENCES attorney(id_attorney),
	 codubi				char(6) 		NOT NULL REFERENCES ubigeo(codubi),
	 status 			char(1)         NOT NULL DEFAULT ('A')
);

-- CREATION TABLE OF (FUNCIONARY)
CREATE TABLE funcionary
(
     id_funcionary 		serial 			PRIMARY KEY,
     name 				varchar	(200) 	NOT NULL,
	 surnameFather 		varchar	(200) 	NOT NULL,
	 surnameMother 		varchar	(200) 	NOT NULL,
     dni 				varchar	(8) 	NOT NULL,
     phonenumber 		varchar	(9) 	NOT NULL,
     range 				varchar	(200) 	NOT NULL,
	 confirmation 		char	(1) 	NOT NULL DEFAULT ('N'),
     address 			varchar	(200) 	NOT NULL,
     email 				varchar	(200) 	NOT NULL,
	 codubi				char(6) 		NOT NULL REFERENCES ubigeo(codubi),
     status 			char 	(1) 	NOT NULL DEFAULT ('A')
);

-- CREATION TABLE OF (OPERATIVE UNIT)
CREATE TABLE operative_unit
(
	id_operativeunit	serial 			PRIMARY KEY,
	name				varchar(200) 	NOT NULL,
	id_funcionary		integer 		NOT NULL REFERENCES funcionary(id_funcionary),
	phonenumber			char(9)			NOT NULL,
	address				varchar(200)	NOT NULL,
	codubi				char(6) 		NOT NULL REFERENCES ubigeo(codubi),
	status				char(1)			NOT NULL DEFAULT ('A')
);

-- CREATION TABLE OF TRANSACTIONAL (FUNCIONARY (RANGE = {LEGAL GUARDIAN}) - ADOLESCENTE)
CREATE TABLE funcionary_teen
(
     id_funcionaryteend serial 			PRIMARY KEY,
     description 		varchar	(200) 	NOT NULL,
     status 			char 	(1)  	NOT NULL DEFAULT ('A'),
     id_teen 			integer 		REFERENCES teen(id_teen),
     id_funcionary 		integer 		REFERENCES funcionary(id_funcionary)
);

--------------------------------------------------------------------------------------------------------------------------------------------------------

-- RECORDING DATA IN THE TABLE "UBIGEO"

INSERT INTO ubigeo
(codubi, depar, provi, distri)
VALUES
('150101'		,'LIMA'		,'LIMA'			,'LIMA'),
('150102'		,'LIMA'		,'LIMA'			,'ANCON'),
('150103'		,'LIMA'		,'LIMA'			,'ATE'),
('150104'		,'LIMA'		,'LIMA'			,'BARRANCO'),
('150105'		,'LIMA'		,'LIMA'			,'BREÑA'),
('150106'		,'LIMA'		,'LIMA'			,'CARABAYLLO'),
('150107'		,'LIMA'		,'LIMA'			,'CHACLACAYO'),
('150108'		,'LIMA'		,'LIMA'			,'CHORRILLOS'),
('150109'		,'LIMA'		,'LIMA'			,'CIENEGUILLA'),
('150110'		,'LIMA'		,'LIMA'			,'COMAS'),
('150111'		,'LIMA'		,'LIMA'			,'EL AGUSTINO'),
('150112'		,'LIMA'		,'LIMA'			,'INDEPENDENCIA'),
('150113'		,'LIMA'		,'LIMA'			,'JESUS MARIA'),
('150114'		,'LIMA'		,'LIMA'			,'LA MOLINA'),
('150115'		,'LIMA'		,'LIMA'			,'LA VICTORIA'),
('150116'		,'LIMA'		,'LIMA'			,'LINCE'),
('150117'		,'LIMA'		,'LIMA'			,'LOS OLIVOS'),
('150118'		,'LIMA'		,'LIMA'			,'LURIGANCHO'),
('150119'		,'LIMA'		,'LIMA'			,'LURIN'),
('150120'		,'LIMA'		,'LIMA'			,'MAGDALENA DEL MAR'),
('150121'		,'LIMA'		,'LIMA'			,'PUEBLO LIBRE'),
('150122'		,'LIMA'		,'LIMA'			,'MIRAFLORES'),
('150123'		,'LIMA'		,'LIMA'			,'PACHACAMAC'),
('150124'		,'LIMA'		,'LIMA'			,'PUCUSANA'),
('150125'		,'LIMA'		,'LIMA'			,'PUENTE PIEDRA'),
('150126'		,'LIMA'		,'LIMA'			,'PUNTA HERMOSA'),
('150127'		,'LIMA'		,'LIMA'			,'PUNTA NEGRA'),
('150128'		,'LIMA'		,'LIMA'			,'RIMAC'),
('150129'		,'LIMA'		,'LIMA'			,'SAN BARTOLO'),
('150130'		,'LIMA'		,'LIMA'			,'SAN BORJA'),
('150131'		,'LIMA'		,'LIMA'			,'SAN ISIDRO'),
('150132'		,'LIMA'		,'LIMA'			,'SAN JUAN DE LURIGANCHO'),
('150133'		,'LIMA'		,'LIMA'			,'SAN JUAN DE MIRAFLORES'),
('150134'		,'LIMA'		,'LIMA'			,'SAN LUIS'),
('150135'		,'LIMA'		,'LIMA'			,'SAN MARTIN DE PORRES'),
('150136'		,'LIMA'		,'LIMA'			,'SAN MIGUEL'),
('150137'		,'LIMA'		,'LIMA'			,'SANTA ANITA'),
('150138'		,'LIMA'		,'LIMA'			,'SANTA MARIA DEL MAR'),
('150139'		,'LIMA'		,'LIMA'			,'SANTA ROSA'),
('150140'		,'LIMA'		,'LIMA'			,'SANTIAGO DE SURCO'),
('150141'		,'LIMA'		,'LIMA'			,'SURQUILLO'),
('150142'		,'LIMA'		,'LIMA'			,'VILLA EL SALVADOR'),
('150143'		,'LIMA'		,'LIMA'			,'VILLA MARIA DEL TRIUNFO'),
('150201'		,'LIMA'		,'BARRANCA'		,'BARRANCA'),
('150202'		,'LIMA'		,'BARRANCA'		,'PARAMONGA'),
('150203'		,'LIMA'		,'BARRANCA'		,'PATIVILCA'),
('150204'		,'LIMA'		,'BARRANCA'		,'SUPE'),
('150205'		,'LIMA'		,'BARRANCA'		,'SUPE PUERTO'),
('150301'		,'LIMA'		,'CAJATAMBO'	,'CAJATAMBO'),
('150302'		,'LIMA'		,'CAJATAMBO'	,'COPA'),
('150303'		,'LIMA'		,'CAJATAMBO'	,'GORGOR'),
('150304'		,'LIMA'		,'CAJATAMBO'	,'HUANCAPON'),
('150305'		,'LIMA'		,'CAJATAMBO'	,'MANAS'),
('150401'		,'LIMA'		,'CANTA'		,'CANTA'),
('150402'		,'LIMA'		,'CANTA'		,'ARAHUAY'),
('150403'		,'LIMA'		,'CANTA'		,'HUAMANTANGA'),
('150404'		,'LIMA'		,'CANTA'		,'HUAROS'),
('150405'		,'LIMA'		,'CANTA'		,'LACHAQUI'),
('150406'		,'LIMA'		,'CANTA'		,'SAN BUENAVENTURA'),
('150407'		,'LIMA'		,'CANTA'		,'SANTA ROSA DE QUIVES'),
('150501'		,'LIMA'		,'CAÑETE'		,'SAN VICENTE DE CAÑETE'),
('150502'		,'LIMA'		,'CAÑETE'		,'ASIA'),
('150503'		,'LIMA'		,'CAÑETE'		,'CALANGO'),
('150504'		,'LIMA'		,'CAÑETE'		,'CERRO AZUL'),
('150505'		,'LIMA'		,'CAÑETE'		,'CHILCA'),
('150506'		,'LIMA'		,'CAÑETE'		,'COAYLLO'),
('150507'		,'LIMA'		,'CAÑETE'		,'IMPERIAL'),
('150508'		,'LIMA'		,'CAÑETE'		,'LUNAHUANA'),
('150509'		,'LIMA'		,'CAÑETE'		,'MALA'),
('150510'		,'LIMA'		,'CAÑETE'		,'NUEVO IMPERIAL'),
('150511'		,'LIMA'		,'CAÑETE'		,'PACARAN'),
('150512'		,'LIMA'		,'CAÑETE'		,'QUILMANA'),
('150513'		,'LIMA'		,'CAÑETE'		,'SAN ANTONIO'),
('150514'		,'LIMA'		,'CAÑETE'		,'SAN LUIS'),
('150515'		,'LIMA'		,'CAÑETE'		,'SANTA CRUZ DE FLORES'),
('150516'		,'LIMA'		,'CAÑETE'		,'ZUÑIGA')
;

-- RECORDING DATA IN THE TABLE "ATTORNEY" --

INSERT INTO attorney
(name					, surnameFather	, surnameMother	, dni			, phonenumber	, address					, email						,codubi)
VALUES
('Jesús Nolberto'		, 'Mayas'		, 'Campos'		, '52630214'	, '963032147' 	, 'Sin dirección exacta.'	, 'sinDirección@gmail.com'	,'150512'),
('Mario Alberto'		, 'Quispe'		, 'Tantaira'	, '45259632'	, '963032147'	, 'Sin dirección exacta.'	, 'sinDirección@gmail.com'	,'150514')
;

-- RECORDING DATA IN THE TABLE "TEEN" --

INSERT INTO teen
(name					, surnameFather	, surnameMother	, dni			, phonenumber	, address						, email							,birthade		,gender	, crime_committed	, id_attorney	,codubi)
VALUES
('Jose Feliciano'		, 'Alcala'		, 'Sanchez'		, '45678945'	, '963230125'	, 'Av. Manzanalas 7894'			, 'SinDirección@gmail.com'		,'2020-01-01'	,'M'	,'Robo Menor'		,'1'			,'150101'),
('Carlos Alberto'		, 'Cama'		, 'Padilla'		, '63254120'	, '963020035'	, 'Av. Sepulveda 56'			, 'SinDirección@gmail.com'		,'2020-01-02'	,'M'	,'Robo Menor'		,'2'			,'150101'),
('Elizardo Jesús'		, 'Valerio'		, 'Alpaca'		, '63521410'	, '987452145'	, 'Av. Simón Bolivar 6320'		, 'SinDirección@gmail.com'		,'2020-01-03'	,'M'	,'Robo Menor'		,'2'			,'150101'),
('Juana La'				, 'Cubana'		, 'Del Can'		, '45632012'	, '963254147'	, 'Av. Josefina 7864'			, 'SinDirección@gmail.com'		,'2020-01-04'	,'F'	,'Robo Menor'		,'1'			,'150101')
;

-- RECORDING DATA IN THE TABLE "FUNCIONARY" --

INSERT INTO funcionary
(name					, surnameFather	, surnameMother	, dni			, phonenumber	, range			,confirmation	, address								, email								,codubi)
VALUES
('Jose Mamerto'			, 'Quispe'		, 'Sanchez'		, '52132014'	, '985632102'	,'Psicologo'	, 'S' 			, 'Av. San Bartolo 7894'				, 'LuisMiguelLira153@gmail.com'		,'150512'),
('Alberto Jacinto'		, 'Mamani'		, 'Quispe'		, '45259632'	, '963032147'	,'Guía'			, 'S'			, 'Sin dirección exacta.'				, 'JavierSanchez@outlook.com'		,'150514'),
('Manuel Javier'		, 'Sanchez'		, 'Lira'		, '96358974'	, '963032568'	,'Psicologo'	, 'N'			, 'Sin dirección exacta.'				, 'MQAlbertoP789@hotmail.com'		,'150516'),
('Luis Miguel'			, 'Lira'		, 'Del Riego'	, '02314521'	, '965874154'	,'Guía'		, 'N'			, 'Av. Simón Bolivar Mz B Lote 78'		, 'QuispeSanchez453@gmail.com'		,'150508')
;

-- RECORDING DATA IN THE TABLE "OPERATIVE UNIT"

INSERT INTO operative_unit
(name				, id_funcionary		, phonenumber	, address							, codubi)
VALUES
('SOA - CAÑETE'		, '1'				, '965241254'	, 'Av. Panamericana Sur Km 144'		, '150101'),
('SOA - LIMA'		, '2'				, '963023147'	, 'Av. Panamericana Sur Km 846'		, '150101')
;

-- RECORDING DATA IN THE TABLE (TRANSACTIONAL)

INSERT INTO funcionary_teen
(description											, id_teen	, id_funcionary)
VALUES
('Ayuda en la mejora.'									, '1'		, '1'),
('Ayuda en la conducta.'								, '4'		, '2'),
('Ayuda en la mejora de la autoestima y conducta.'		, '2'		, '3')
;

--------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM ubigeo;
SELECT * FROM teen;
SELECT * FROM funcionary ORDER BY id_funcionary DESC;
SELECT * FROM operative_unit ORDER BY id_operativeunit DESC;
SELECT * FROM attorney ORDER BY id_attorney DESC;
SELECT * FROM funcionary_teen;

DELETE FROM teen WHERE id_teen = 10;
DELETE FROM funcionary_teen WHERE id_funcionaryteend = 3;

SELECT funcionary_teen.*, teen.*, funcionary.*
FROM funcionary_teen
INNER JOIN teen 		ON funcionary_teen.id_teen 			= teen.id_teen
INNER JOIN funcionary 	ON funcionary_teen.id_funcionary 	= funcionary.id_funcionary
;

SELECT teen.*, attorney.*
FROM teen
INNER JOIN attorney 		ON teen.id_attorney = attorney.id_attorney
;

SELECT adol.*
FROM teen adol
LEFT JOIN funcionary_teen fa ON adol.id_teen = fa.id_teen
WHERE fa.id_teen IS NULL
;