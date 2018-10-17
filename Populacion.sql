USE TeConstruye
GO

/**CREATE TRIGGER Validate_Worked_Hours on Worked_hours 
AFTER Insert
AS
	If exists (select W.id_project, W.id_project, W.date from Worked_hours as W
		Inner Join inserted as I on I.id_project = W.id_project and I.id_employee = W.id_employee and I.date = W.date)
	Begin
		Rollback
		RAISERROR('Duplicate Data', 16, 1)
	End
	GO**/

INSERT INTO Client (identification, name, lastname1, lastname2, phone, email) VALUES
('304920850', 'Mauricio', 'Alvarez', 'Varela', '7202-4566', 'mau18alvarez@example.com'),
('123456789', 'Kerrie', 'Banks', 'Adkins', '8821-1543', 'kerrieBA@example.com'),
('987654321', 'Xavier', 'Larson', 'Flynn', '32534-4255', 'xaviLF@example.com');

INSERT INTO Project (name, ubication, id_client) VALUES
('Casa de habitacion', 'Guanacaste', '304920850'),
('Condominios', 'Cartago', '304920850'),
('Apartamentos', 'Limon', '123456789'),
('Hotel', 'Puntarenas', '987654321');


INSERT INTO Anotations(id_project, anotation, date) VALUES 
(1, 'Atraso en mercaderia','2014-02-26'),
(4, 'Atraso debido a clima','2018-09-19');


INSERT INTO Stage(id_project, name, description, start_date, end_date) VALUES
(1, 'Trabajo Preliminar', 'Se limpia y aplana la zona de construccion', '2014-01-03', '2014-01-10'),
(1, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '2014-01-11','2014-02-01'),
(1, 'Instalacion Pluvial',	'Se instalan las salidas de agua', '2014-02-02' ,'2014-02-08'),
(1, 'Instalacion Sanitaria', 'Se colocan los sanitarios', '2014-02-09' ,'2014-02-12'),
(1, 'Paredes', 'Se levantan las paredes de la construccion', '2014-02-13' ,'2014-02-16'),
(1, 'Escaleras', 'Se colocan escaleras en caso de ser necesario', '2013-02-16' ,'2013-02-20'),
(1, 'Concreto Reforzado', 'Se realiza el refuerzo de en el concreto', '2014-02-21','2014-02-26'),
(1, 'Techos', 'Se inicia a colocar el techado de la estructura', '2014-02-27','2014-03-05'),
(1, 'Instalacion Electrica', 'Se realiza la instalacion electrica', '2014-03-12' ,'2014-03-24'),
(1, 'Repello', 'Se repellan las paredes', '2014-03-24' ,'2014-04-02'),
(1, 'Entrepisos' ,'Se coloca el entrepiso', '2014-04-03' ,'2014-04-08'),
(1, 'Enchapes', 'Se inicia el enchapado en los lugares requeridos', '2014-04-08' ,'2014-04-12'),
(1, 'Pintura', 'Se pinta toda la estructura para mejorar su imagen', '2014-04-13' ,'2014-04-22'),
(1, 'Puertas', 'Se colocan las puertas', '2014-04-23' ,'2014-04-23'),
(1, 'Cerrajeria', 'Se colocan llavines', '2014-04-24' ,'2014-04-24' ),
(1, 'Ventanas', 'Se ponen los vidrios en las ventanas', '2014-04-25' ,'2014-04-25'),
(1, 'Closets', 'Se instalan los closets en habitaciones', '2014-04-26' ,'2014-04-26'),
(1, 'Muebles', 'Se colocan todos los muebles en la casa', '2014-04-27' ,'2014-04-27'),

(2, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '2017-05-11','2017-05-20'),
(2, 'Instalacion Pluvial',  'Se instalan las salidas de agua', '2017-05-21' ,'2017-06-08'),
(2, 'Instalacion Sanitaria', 'Se colocan los sanitarios', '2017-06-09' ,'2017-06-12'),
(2, 'Paredes', 'Se levantan las paredes de la construccion', '2017-06-13' ,'2017-06-16'),
(2, 'Escaleras', 'Se colocan escaleras en caso de ser necesario', '2013-06-16' ,'2013-06-20'),
(2, 'Concreto Reforzado', 'Se realiza el refuerzo de en el concreto', '2017-06-21','2017-06-26'),
(2, 'Techos', 'Se inicia a colocar el techado de la estructura', '2017-06-27','2017-07-05'),
(2, 'Instalacion Electrica', 'Se realiza la instalacion electrica', '2017-07-12' ,'2017-07-24'),
(2, 'Repello', 'Se repellan las paredes', '2017-07-24' ,'2017-08-02'),
(2, 'Entrepisos' ,'Se coloca el entrepiso', '2017-08-03' ,'2017-08-08'),
(2, 'Enchapes', 'Se inicia el enchapado en los lugares requeridos', '2017-08-08' ,'2017-08-12'),
(2, 'Pintura', 'Se pinta toda la estructura para mejorar su imagen', '2017-08-13' ,'2017-08-22'),
(2, 'Puertas', 'Se colocan las puertas', '2017-08-23' ,'2017-08-23'),
(2, 'Cerrajeria', 'Se colocan llavines', '2017-08-24' ,'2017-08-24' ),
(2, 'Ventanas', 'Se ponen los vidrios en las ventanas', '2017-08-25' ,'2017-08-25'),
(2, 'Muebles', 'Se colocan todos los muebles en la casa', '2017-08-27' ,'2017-08-27'),

(3, 'Trabajo Preliminar', 'Se limpia y aplana la zona de construccion', '2018-01-03', '2018-01-10'),
(3, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '2018-01-11','2018-02-01'),
(3, 'Instalacion Pluvial',  'Se instalan las salidas de agua', '2018-02-02' ,'2018-02-08'),
(3, 'Instalacion Sanitaria', 'Se colocan los sanitarios', '2018-02-09' ,'2018-02-12'),
(3, 'Paredes', 'Se levantan las paredes de la construccion', '2018-02-13' ,'2018-02-16'),
(3, 'Escaleras', 'Se colocan escaleras en caso de ser necesario', '2013-02-16' ,'2013-02-20'),
(3, 'Concreto Reforzado', 'Se realiza el refuerzo de en el concreto', '2018-02-21','2018-02-26'),
(3, 'Techos', 'Se inicia a colocar el techado de la estructura', '2018-02-27','2018-03-05'),
(3, 'Instalacion Electrica', 'Se realiza la instalacion electrica', '2018-03-12' ,'2018-03-24'),
(3, 'Repello', 'Se repellan las paredes', '2018-03-24' ,'2018-04-02'),
(3, 'Entrepisos' ,'Se coloca el entrepiso', '2018-04-03' ,'2018-04-08'),
(3, 'Enchapes', 'Se inicia el enchapado en los lugares requeridos', '2018-04-08' ,'2018-04-12'),
(3, 'Pintura', 'Se pinta toda la estructura para mejorar su imagen', '2018-04-13' ,'2018-04-22'),
(3, 'Puertas', 'Se colocan las puertas', '2018-04-23' ,'2018-04-23'),
(3, 'Cerrajeria', 'Se colocan llavines', '2018-04-24' ,'2018-04-24' ),
(3, 'Ventanas', 'Se ponen los vidrios en las ventanas', '2018-04-25' ,'2018-04-25'),
(3, 'Closets', 'Se instalan los closets en habitaciones', '2018-04-26' ,'2018-04-26'),
(3, 'Muebles', 'Se colocan todos los muebles en la casa', '2018-04-27' ,'2018-04-27'),


(4, 'Trabajo Preliminar', 'Se limpia y aplana la zona de construccion', '2018-05-03', '2018-05-10'),
(4, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '2018-05-11','2018-06-03'),
(4, 'Instalacion Pluvial',  'Se instalan las salidas de agua', '2018-06-01' ,'2018-06-08'),
(4, 'Instalacion Sanitaria', 'Se colocan los sanitarios', '2018-06-09' ,'2018-06-11'),
(4, 'Paredes', 'Se levantan las paredes de la construccion', '2018-06-11' ,'2018-06-16'),
(4, 'Concreto Reforzado', 'Se realiza el refuerzo de en el concreto', '2018-06-18','2018-06-28'),
(4, 'Techos', 'Se inicia a colocar el techado de la estructura', '2018-07-01','2018-07-05'),
(4, 'Instalacion Electrica', 'Se realiza la instalacion electrica', '2018-07-05' ,'2018-07-12'),
(4, 'Repello', 'Se repellan las paredes', '2018-07-12' ,'2018-07-15'),
(4, 'Entrepisos' ,'Se coloca el entrepiso', '2018-07-15' ,'2018-07-18'),
(4, 'Pintura', 'Se pinta toda la estructura para mejorar su imagen', '2018-07-19' ,'2018-07-25'),
(4, 'Puertas', 'Se colocan las puertas', '2018-07-25' ,'2018-07-26'),
(4, 'Cerrajeria', 'Se colocan llavines', '2018-07-26' ,'2018-07-27' ),
(4, 'Ventanas', 'Se ponen los vidrios en las ventanas', '2018-07-27' ,'2018-07-27');




INSERT Employee(identification, name, lastname1, lastname2, phone) VALUES 
('304920877', 'Marc', 'Kelley', 'Nolan', '653-5167927'),
('664556705', 'Melody', 'James', 'Cummings', '379709-4241'),
('288785464', 'Dylan', 'Dixon', 'Blevins', '961-832-5642'),
('385982474', 'Jeannie', 'Faulkner', 'Kim', '167583-6508'),
('185455468', 'Maureen', 'Velasquez', 'Kaiser', '3640729480'),
('455065758', 'Jim', 'Peck', 'Stephenson', '157745-1285'),
('536135785', 'Kathryn', 'Beasley', 'Harrison', '2249174400'),
('278801474', 'Erica', 'Stevens', 'Shields', '093-183-8121'),
('184828587', 'Bobbie', 'Francis', 'Fuentes', '896-6990883'),
('610726107', 'Craig', 'Payne', 'Greer', '344-196-4906'),
('122356107', 'Shawn', 'Gaines', 'Mc Cormick', '7954780060'),
('335406107', 'Ivan', 'Boyd', 'Terrell', '200-4688348'),
('681176107', 'Meghan', 'Mckenzie', 'Morrison', '692-0295590'),
('613766137', 'Angie', 'Sims', 'Howe', '0354961097'),
('204676136', 'Kelley', 'Stevenson', 'Gutierrez', '530-1749038'),
('560991376', 'Ernesto', 'Hines', 'Aguyen', '978-5757362'),
('053845985', 'Randall', 'Mueller', 'Sanford', '032154-2986'),
('656495982', 'Dion', 'Lloyd', 'Wallace', '367-3283827'),
('959828177', 'Marvin', 'Cantrell', 'Terrell', '711-683-3238'),
('601598232', 'Rex', 'Ritter', 'Joseph', '698064-7537');


INSERT INTO Roles (id_employee, role) VALUES
(1, 'Alba�il'),
(2, 'Alba�il'),
(3, 'Alba�il'),
(4, 'Alba�il'),
(5, 'Alba�il'),
(6,'Ing Electrico'),
(7,'Aquitecto'),
(8,'Ing Civil'),
(9,'Ing Materiales');

/**INSERT INTO Worked_hours(id_project, id_employee, date, hours, hour_cost) VALUES
 (1, 1, '2014-01-03', 8, 1600),
 (1, 2, '2014-01-03', 8, 1600),
 (1, 3, '2014-01-03', 8, 1600),
 (1, 4, '2014-01-03', 8, 1600),
 (1, 6, '2014-01-03', 2, 1600),
 (1, 7, '2014-01-03', 8, 2500),
 (1, 8, '2014-01-03', 8, 2000),
 (1, 9, '2014-01-03', 8, 1950),

 (2, 1, '2017-05-11', 6, 1600),
 (2, 2, '2017-05-11', 6, 1600),
 (2, 3, '2017-05-11', 6, 1600),
 (2, 4, '2017-05-11', 6, 1600),
 (2, 6, '2017-05-11', 3, 3000),
 (2, 7, '2017-05-11', 6, 3000),
 (2, 8, '2017-05-11', 8, 2500),
 (2, 9, '2017-05-11', 8, 1950),

 (3, 1, '2018-01-03', 7, 1000),
 (3, 2, '2018-01-03', 6, 1000),
 (3, 3, '2018-01-03', 5, 1000),
 (3, 4, '2018-01-03', 4, 1000),
 (3, 6, '2018-01-03', 1, 1000),
 (3, 7, '2018-01-03', 1, 1000),
 (3, 8, '2018-01-03', 1, 1000),
 (3, 9, '2018-01-03', 1, 1000),

 (4, 1, '2018-05-03', 8, 500),
 (4, 2, '2018-05-03', 3, 500),
 (4, 3, '2018-05-03', 8, 500),
 (4, 4, '2018-05-03', 3, 500),
 (4, 6, '2018-05-03', 2, 1000),
 (4, 7, '2018-05-03', 2, 1000),
 (4, 8, '2018-05-03', 2, 1000),
 (4, 9, '2018-05-03', 2, 1000);**/


 
 INSERT INTO Materials (name, description, price) VALUES
 ('Backhoe', 'Maquinaria por hora', 14000),
 ('Niveladora', 'Maquinaria por hora', 14000),
 ('Cemento', 'Holcim 50Kg', 6400),
 ('Conceto seco', 'Concremix 40Kg', 3100),
 ('Mortero Repemax', 'Repemax 40kg', 3350),
 ('Mortero Bondex', 'Bondex 25kg', 5400),
 ('Muro Seco Impersa', 'Impersa 20kg', 3600),
 ('Muro Seco Repemax', 'Repemax 25kg', 5200),
 ('Varilla 3/8', 'Varilla deformada 3/8, 6mts', 1650),
 ('Varilla 1/2', 'Varilla deformada 1/2, 6mts', 3030),
 ('Arena', 'Arena de tajo/metro c�bico', 16000),
 ('Piedra cuarta', 'Piedra cuartilla de tajo/metro c�bico', 18000),
 ('Piedra quinta', 'Piedra quinta de tajo/metro c�bico', 19000),
 ('Lastre fino', 'De tajo/metro c�bico', 15000),
 ('Block 12x20x40cm', 'Clase A', 420),
 ('Block 15x20x40cm', 'Clase A', 560),
 ('Madera 1x12', 'Madera semidura sin cepillo 1x12/vara', 1500),
 ('Madera 1x3', 'Madera semidura sin cepillo 1x3/vara', 375),
 ('Soldadura 1/8', '1/8 pulgada /kg', 4800),
 ('Soldadura 3/32', '3/32 pulgada /kg', 4900),
 ('Tape el�ctrico', '3/4pulgada 3mts', 2600),
 ('Tubo PVC 1/2', 'Tubo presi�n 6mts', 6400),
 ('Tubo conduit 3/4', 'PVC tipo A de 3/4', 2700),
 ('Tubo sanitario', 'PVC 2 pulgadas', 9400),
 ('Codo sanitario', 'PVC 4 pulgadas', 4600),
 ('Rodillo', 'Rodillo para pintar',1200),
 ('Felpa para rodillo', '3/4 pulgadas', 1200),
 ('Brocha Pretul', '3 pulgadas', 1400),
 ('Brocha Atlas', '2 pulgadas', 2200),
 ('Pintura esmalte blanca', 'Sur, Galon', 12000),
 ('Pintura goltex base', 'Sur, Galon', 20000),
 ('Anticorrosivo Sur Rojo', 'Sur, Galon', 11000),
 ('Anticorrosivo Lanco Negro', 'Lanco, Galon', 17000),
 ('Bombillo incandescente', '100W potencia', 350),
 ('Caja ETM 4x4', 'caja cuadrada 4x4 pulgadas', 700),
 ('Caja ETM 1/2', 'caja rectangular 1/2 pulgadas', 500),
 ('Caja ETM 3/4', 'caja rectangular 3/4 pulgadas', 500),
 ('Tomacorriente sencillo', 'polarizado', 1100),
 ('Tomacorriente doble', 'doble polarizado', 1100),
 ('Encendedor sencillo', 'Un encendedor', 1500),
 ('Encendedor doble', 'Dos encendedores', 2200),
 ('Encendedor three way', 'Three way switch', 1600),
 ('Enchufe polarizado', 'Hule, 15A', 800),
 ('L�mina techo rectangular', 'Esmaltada blanca 1.07x3.66mts', 18000),
 ('L�mina techo ondulada', 'Galvanizada, 0.81x3.66mts', 12300),
 ('L�mina techo  policarbonato', 'Transparenre, 0.81x3.66mts', 11000),
 ('L�mina techo tipo teja', 'Teja Colonial, 1.05x3.66mts', 18600),
 ('Tornillo techo', 'Punta de broca, 100 unidades', 400),
 ('L�mina Gypsum', 'Blanca 1.22x2.44mts', 3600),
 ('Malla electrosoladada', '2.20x6mts, 3.80mm', 12000),
 ('WD-40', 'Aceite penetrante', 2800),
 ('Llave chorro 1/2', 'Pfister 1/2pulgada', 4000),
 ('Grifer�a Ducha 013CSVC', 'Pfister cromo', 13000),
 ('Grifer�a Ducha 013CSLC', 'Pfister cromo', 14000),
 ('Cabeza Ducha Redonda', 'Pfister cromo', 10000),
 ('Grifer�a Fregadero 036CSLC', 'Pfister cromo', 30000),
 ('Grifer�a Fregadero 036CSVC', 'Pfister cromo', 29000),
 ('Grifer�a Lavatorio 040CSVPC', 'Pfister cromo', 10000),
 ('Grifer�a Lavatorio 040CSLPC', 'Pfister cromo', 12000),
 ('Lampara Techo Ptl-5050', 'Tecnolite', 35000),
 ('Lampara Techo Globo Ptl-5110', 'Tecnolite', 21000),
 ('Lampara Techo base madera', 'Tecnolite', 40000),
 ('Lampara Techo base vidrio', 'Tecnolite', 40000),
 ('Ventilador Techo 3 aspas', 'Hunter', 115000),
 ('Ventilador Techo 5 aspas', 'Hunter', 75000),
 ('Porcelanato Rojo', '60x60cm/ metro cuadrado', 6000),
 ('Porcelanato Gris', '60x60cm/ metro cuadrado', 7000),
 ('Porcelanato Indian Grey', '60x60cm/ metro cuadrado', 9000),
 ('Porcelanato Marron', '60x60cm/ metro cuadrado', 5000),
 ('Enchape Rustico ladrillo', 'metro cuadrado', 11000),
 ('Enchape Rustico piedra', 'metro cuadrado', 25000),
 ('Puerta colonial', '90x210cm', 16000),
 ('Puerta pino', '90x210cm', 30000),
 ('Llavin doble paso', 'Yale, derecho', 20000),
 ('Cerradura habitacion', 'Cromo Mate', 10000),
 ('Vidrio para ventana', 'Vidrio transparente', 3000),
 ('Closet de rejillas', '1.52mts', 60000),
 ('Mueble Fregadero', 'Tanque derecho, pino', 100000);


 INSERT INTO MaterialsxStage (id_stage, id_material, quantity, price) VALUES
 (1, 1, 6, 14000),
 (1, 2, 2, 14000),
 (2, 3, 20, 6400),
 (2, 10, 50, 3030),
 (3, 22, 15, 6400),
 (4, 24, 2, 9400),
 (5, 15, 100, 420),
 (5, 16, 100, 560),
 (6, 17, 20, 1500),
 (7, 5, 5, 3350),
 (8, 44, 25, 18000),
 (9, 35, 5, 700),
 (9, 38, 20, 1100),
 (10, 8, 5, 5200),
 (11, 3, 2, 6400),
 (12, 70, 3, 11000),
 (13, 31, 5, 20000),
 (14, 72, 8, 16000),
 (15, 74, 2, 20000),
 (15, 75, 6, 10000),
 (16, 76, 10, 3000),
 (17, 77, 4, 60000),
 (18, 78, 2, 100000),

 (19, 1, 10, 14000),
 (19, 2, 20, 14000),
 (20, 22, 20, 6400),
 (21, 24, 10, 9400),
 (21, 25, 10, 4600),
 (22, 15, 50, 420),
 (22, 16, 50, 560),
 (23, 17, 20, 2700),
 (24, 5, 10, 3350),
 (25, 44, 40, 18000),
 (26, 35, 15, 700),
 (26, 38, 20, 1100),
 (27, 8, 5, 5200),
 (28, 3, 5, 6400),
 (29, 70, 5, 11000),
 (30, 31, 10, 20000),
 (31, 72, 4, 16000),
 (32, 74, 2, 20000),
 (33, 76, 10, 3000),
 (34, 78, 2, 100000),

 (35, 1, 10, 14000),
 (36, 2, 10, 14000),
 (37, 22, 10, 6400),
 (38, 25, 10, 4600),
 (39, 15, 100, 420),
 (40, 17, 20, 1500),
 (41, 5, 5, 3350),
 (42, 44, 20, 18000),
 (43, 38, 20, 1100),
 (44, 8, 10, 5200),
 (45, 3, 8, 6400),
 (46, 70, 4, 11000),
 (47, 31, 5, 20000),
 (48, 72, 8, 16000),
 (49, 75, 8, 10000),
 (50, 76, 20, 3000),
 (51, 77, 8, 60000),
 (52, 78, 4, 100000),

 (53, 2, 5, 14000),
 (54, 2, 50, 14000),
 (55, 22, 20,6400),
 (56, 25, 25, 4600),
 (57, 15, 300, 420),
 (58, 5, 20, 3350),
 (59, 44, 50, 18000),
 (60, 38, 30, 1100),
 (61, 8, 20, 5200),
 (62, 3, 20, 6400),
 (63, 31, 10, 20000),
 (64, 72, 10, 16000),
 (65, 75, 10, 10000),
 (66, 76, 15, 3000);


 INSERT INTO Provider (name) VALUES
 ('EPA'),
 ('Colono Construcci�n'),
 ('El Lagar'),
 ('Construplaza'),
 ('Ferreter�a Iztar�'),
 ('Infesa'),
 ('Las Gravilias'),
 ('Ferreter�a Santa Rosa'),
 ('Deposito Ferretero Pacayas'),
 ('Ferreter�a el Roble'),
 ('Ferreter�a el Mar'),
 ('Ferreter�a la Ruta'),
 ('Ferreter�a la Trinidad'),
 ('Ferreter�a la Lima'),
 ('Ferreter�a los �ngeles'),
 ('Ferreter�a Capris'),
 ('Ferjuca'),
 ('Fermaco'),
 ('Cofresa'),
 ('Ferreter�a Cipreses'),
 ('Ferreter�a Lomas'),
 ('Indudi S.A.'),
 ('Ferreter�a la Union S.A'),
 ('Ferreter�a Boston'),
 ('Vetcomer S.A.'),
 ('Ferreutil');


/**INSERT INTO Bill(date, serial, price, id_stage, id_provider) VALUES
 ('2014-02-02', 'AAA-1234', 18000, 3, 1),
 ('2017-06-21', 'BBB-12E65', 25000, 24, 2),
 ('2018-02-09', 'CCC-12RD34', 450000, 38, 3),
 ('2018-06-01', 'DDD-1R2D34', 8750, 55, 4);**/
 
/**PRUEBA PRUEBA PRUEBA **/

INSERT INTO Project(ubication, id_client) VALUES
('Cartago', '123456789');

INSERT INTO Stage(id_project, name, description, start_date, end_date) VALUES
(5, 'Trabajo Preliminar', 'Se limpia y aplana la zona de construccion', '2014-01-03', '2014-01-10'),
(5, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '2014-01-11','2014-02-01');

 INSERT INTO MaterialsxStage(id_stage, id_material, quantity, price) VALUES
 (67, 1, 6, 14000),
 (68, 2, 2, 14000);

 INSERT INTO Worked_hours(id_project, id_employee, date, hours, hour_cost) VALUES
 (1, 1, '2014-01-03', 8, 600),
 (1, 1, '2014-01-04', 2, 1500),
 (1, 3, '2014-01-03', 3, 700),
 (1, 4, '2014-01-05', 4, 600),
 (2, 1, '2014-01-06', 5, 500),
 (2, 2, '2014-01-05', 8, 1600),
 (2, 5, '2014-01-07', 9, 600),
 (2, 6, '2014-01-08', 12, 300),
 (3, 1, '2014-01-09', 12, 100),
 (3, 9, '2014-01-03', 88, 5000),
 (3, 12, '2014-01-06', 1, 400),
 (3, 5, '2014-01-05', 2, 1000),
 (4, 1, '2014-01-09', 3, 1100),
 (4, 1, '2014-01-10', 4, 110),
 (4, 5, '2014-01-10', 8, 60),
 (4, 12, '2014-01-03', 8, 500);

INSERT INTO Bill(date, serial, price, id_stage, id_provider) VALUES
 ('2014-02-02', 'AAE-1234', 128000, 3, 1),
 ('2014-02-02', 'AAB-1234', 180800, 2, 5),
 ('2014-02-02', 'AAN-1234', 180070, 3, 9),

 ('2014-02-07', 'B2BB-12E65', 2000, 24, 2),
 ('2014-02-06', 'BB4B-12E65', 5000, 25, 3),
 ('2014-02-05', 'BBB-1265', 25000,	25, 4),

 ('2014-02-09', 'CCC-12RD34', 450000, 38, 8),
 ('2014-02-10', 'DDD-1R2D34', 8750, 41, 7);


/**
Select * 
from Project

Select * 
from Client


Select * 
from Stage
Where id_project = 5

Select * 
from Materials
Where Materials.id = 1 OR Materials.id = 2

Select * 
from Worked_hours

Select * 
from Project

Select * 
from Employee

Select * 
from Bill

**/
