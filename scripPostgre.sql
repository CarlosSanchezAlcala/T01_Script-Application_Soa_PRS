-- CREATE DATABASE soa_canete_2023;

-- DROP DATABASE soa_canete_2023;

----- ELIMINACIÓN DE TABLAS -----

-- DROP TABLE legal_guardian;
-- DROP TABLE adolescent_data;
-- DROP TABLE family_data;
-- DROP TABLE family_detalle_data;

-- CREAMOS LA TABLA DE TUTOR LEGAL
CREATE TABLE legal_guardian(
	id serial PRIMARY KEY,
	name varchar(100) NOT NULL,
	father_last_name varchar(100) NOT NULL,
	mother_last_name varchar(100) NOT NULL,
	document_type varchar(30) NOT NULL,
	document_number varchar(15) NOT NULL,
	address varchar(300) NOT NULL,
	cell_phone char(9) NOT NULL,
	email varchar(200) NOT NULL,
	active char(1) NOT NULL DEFAULT ('A')
);

-- CREAMOS LA TABLA DE ADOLESCENTE
CREATE TABLE adolescent_data(
	id serial PRIMARY KEY,
	name varchar(100) NOT NULL,
	father_last_name varchar(100) NOT NULL,
	mother_last_name varchar(100) NOT NULL,
	document_type varchar(30) NOT NULL,
	document_number varchar(15) NOT NULL,
	address varchar(300) NOT NULL,
	cell_phone char(9) NOT NULL,
	email varchar(200) NOT NULL,
	active char(1) NOT NULL DEFAULT ('A')
);

-- CREAMOS LA TABLA DE FAMILIA
CREATE TABLE family_data(
	id serial PRIMARY KEY,
	idLegalGuardian int,
	idAdolescent int,
	active char(1) NOT NULL DEFAULT ('A'),
	description varchar(200) NOT NULL,
	FOREIGN KEY (idLegalGuardian) REFERENCES legal_guardian(id),
	FOREIGN KEY (idAdolescent) REFERENCES adolescent_data(id)
);

----- SELECCIÓN DE TABLAS -----

SELECT * FROM legal_guardian;
SELECT * FROM adolescent_data;
SELECT * FROM family_data;

----- INSERCIÓN DE DATOS -----

--INSERTAMOS DATOS DE PRUEBA EN LA TABLA DE TUTOR LEGAL
INSERT INTO legal_guardian
(name, father_last_name, mother_last_name, document_type, document_number, address, cell_phone, email)
VALUES
(
'Carlos Edidson',
'Sanchez',
'Alcala',
'DNI',
'73829932',
'Calle Alfonso Ugarte Mz B Lote 13',
'959495725',
'CarlosS789789@hotmail.com'
)
;

-- INSERTAMOS DATOS DE PRUEBA EN LA TABLA DE TUTOR LEGAL
INSERT INTO legal_guardian
(name, father_last_name, mother_last_name, document_type, document_number, address, cell_phone, email)
VALUES
(
'Elizardo Jesús',
'Cama',
'Padilla',
'DNI',
'15487548',
'Calle Las Azucenas Mz B Lote 3',
'958648759',
'ElizardoCama1005@hotmail.com'
)
;

--INSERTAMOS DATOS DE PRUEBA EN LA TABLA DE ADOLESCENTE
INSERT INTO adolescent_data
(name, father_last_name, mother_last_name, document_type, document_number, address, cell_phone, email)
VALUES
(
'José Alberto',
'Campos',
'Almeida',
'DNI',
'52364125',
'Sin dirección exacta',
'963032014',
'JoseAlberto@hotmail.com'
)
;
 
-- INSERTAMOS DATOS DE PRUEBA EN LA TABLA DE ADOLESCENTE
 INSERT INTO adolescent_data
(name, father_last_name, mother_last_name, document_type, document_number, address, cell_phone, email)
VALUES
(
'Nicole Melany',
'Avila',
'Sanchez',
'DNI',
'52120214',
'Calle Las Azucenas',
'963023520',
'MelanySA@hotmail.com'
)
;

-- INSERTAMOS DATOS DE PRUEBA EN LA TABLA DE FAMLIA
INSERT INTO family_data
(idLegalGuardian, idAdolescent, description)
VALUES
(
'1',
'2',
'Tutor Legal por motivo de Psicología.'
)
;

SELECT
fd.idlegalguardian,
lgd.name,
lgd.father_last_name,
lgd.mother_last_name,
fd.idadolescent,
adl.name,
adl.father_last_name,
adl.mother_last_name
FROM family_data fd INNER JOIN legal_guardian lgd
					ON fd.idlegalguardian = lgd.id
					INNER JOIN adolescent_data adl
					ON fd.idadolescent = adl.id
;

SELECT * FROM legal_guardian;
SELECT * FROM family_data;
SELECT * FROM adolescent_data;