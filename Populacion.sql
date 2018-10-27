USE TeConstruye
GO

INSERT INTO Client (identification, name, lastname1, lastname2, phone, email) VALUES
('304920850', 'Mauricio', 'Alvarez', 'Varela', '7202-4566', 'mau18alvarez@example.com'),
('123456789', 'Kerrie', 'Banks', 'Adkins', '8821-1543', 'kerrieBA@example.com'),
('987654321', 'Xavier', 'Larson', 'Flynn', '32534-4255', 'xaviLF@example.com');


INSERT INTO Employee(identification, name, lastname1, lastname2, phone, hour_cost) VALUES 
('304920877', 'Marc', 'Kelley', 'Nolan', '653-5167927', 1000),
('664556705', 'Melody', 'James', 'Cummings', '379709-4241', 1100),
('288785464', 'Dylan', 'Dixon', 'Blevins', '961-832-5642', 1050),
('385982474', 'Jeannie', 'Faulkner', 'Kim', '167583-6508', 1300),
('185455468', 'Maureen', 'Velasquez', 'Kaiser', '3640729480', 1500),
('455065758', 'Jim', 'Peck', 'Stephenson', '157745-1285', 2000),
('536135785', 'Kathryn', 'Beasley', 'Harrison', '2249174400', 2350),
('278801474', 'Erica', 'Stevens', 'Shields', '093-183-8121', 1800),
('184828587', 'Bobbie', 'Francis', 'Fuentes', '896-6990883', 800),
('610726107', 'Craig', 'Payne', 'Greer', '344-196-4906', 800),
('122356107', 'Shawn', 'Gaines', 'Mc Cormick', '7954780060', 800),
('335406107', 'Ivan', 'Boyd', 'Terrell', '200-4688348', 700),
('681176107', 'Meghan', 'Mckenzie', 'Morrison', '692-0295590', 750),
('613766137', 'Angie', 'Sims', 'Howe', '0354961097', 900),
('204676136', 'Kelley', 'Stevenson', 'Gutierrez', '530-1749038', 950),
('560991376', 'Ernesto', 'Hines', 'Aguyen', '978-5757362', 1000),
('053845985', 'Randall', 'Mueller', 'Sanford', '032154-2986', 1050),
('656495982', 'Dion', 'Lloyd', 'Wallace', '367-3283827', 950),
('959828177', 'Marvin', 'Cantrell', 'Terrell', '711-683-3238', 950),
('601598232', 'Rex', 'Ritter', 'Joseph', '698064-7537', 600);

INSERT INTO Passwords (id_employee, password) VALUES
(1,  'AAAAAAAAAAA1'),
(2,  'AAAAAAAAAAA2'),
(3,  'AAAAAAAAAAA3'),
(4,  'AAAAAAAAAAA4'),
(5,  'AAAAAAAAAAA5'),
(6,  'AAAAAAAAAAA6'),
(7,  'AAAAAAAAAAA7'),
(8,  'AAAAAAAAAAA8'),
(9,  'AAAAAAAAAAA9'),
(10, 'AAAAAAAAAA10'),
(11, 'AAAAAAAAAA11'),
(12, 'AAAAAAAAAA12'),
(13, 'AAAAAAAAAA13'),
(14, 'AAAAAAAAAA14'),
(15, 'AAAAAAAAAA15'),
(16, 'AAAAAAAAAA16'),
(17, 'AAAAAAAAAA17'),
(18, 'AAAAAAAAAA18'),
(19, 'AAAAAAAAAA19'),
(20, 'AAAAAAAAAA20');

INSERT INTO Role_specification (specification) VALUES
 ('Administrador'),
 ('Albanil'),
 ('Aquitecto'),
 ('Ingeniero Electrico'),
 ('Ingeniero Civil'),
 ('Ingeniero Materiales');

INSERT INTO Project (name, ubication, id_client, manager) VALUES
('Casa de habitacion', 'Guanacaste', '304920850', 6),
('Condominios', 'Cartago', '304920850', 7),
('Apartamentos', 'Limon', '123456789', 7),
('Hotel', 'Puntarenas', '987654321', 6);


INSERT INTO Anotations(id_project, anotation, date) VALUES 
(1, 'Atraso en mercaderia','02/26/2014'),
(4, 'Atraso debido a clima','09/19/2018');


INSERT INTO Stage(id_project, name, description, start_date, end_date) VALUES
(1, 'Trabajo Preliminar', 'Se limpia y aplana la zona de construccion', '01/03/2014', '01/10/2014'),
(1, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '01/11/2014','02/01/2014'),
(1, 'Instalacion Pluvial',	'Se instalan las salidas de agua', '02/02/2014' ,'02/08/2014'),
(1, 'Instalacion Sanitaria', 'Se colocan los sanitarios', '02/09/2014' ,'02/12/2014'),
(1, 'Paredes', 'Se levantan las paredes de la construccion', '02/13/2014' ,'02/16/2014'),
(1, 'Escaleras', 'Se colocan escaleras en caso de ser necesario', '02/16/2014' ,'02/20/2014'),
(1, 'Concreto Reforzado', 'Se realiza el refuerzo de en el concreto', '02/21/2014','02/26/2014'),
(1, 'Techos', 'Se inicia a colocar el techado de la estructura', '02/27/2014','03/05/2014'),
(1, 'Instalacion Electrica', 'Se realiza la instalacion electrica', '03/12/2014' ,'03/24/2014'),
(1, 'Repello', 'Se repellan las paredes', '03/24/2014' ,'04/02/2014'),
(1, 'Entrepisos' ,'Se coloca el entrepiso', '04/03/2014' ,'04/08/2014'),
(1, 'Enchapes', 'Se inicia el enchapado en los lugares requeridos', '04/08/2014' ,'04/12/2014'),
(1, 'Pintura', 'Se pinta toda la estructura para mejorar su imagen', '04/13/2014' ,'04/22/2014'),
(1, 'Puertas', 'Se colocan las puertas', '04/23/2014' ,'04/23/2014'),
(1, 'Cerrajeria', 'Se colocan llavines', '04/24/2014' ,'04/24/2014' ),
(1, 'Ventanas', 'Se ponen los vidrios en las ventanas', '04/25/2014' ,'04/25/2014'),
(1, 'Closets', 'Se instalan los closets en habitaciones', '04/26/2014' ,'04/26/2014'),
(1, 'Muebles', 'Se colocan todos los muebles en la casa', '04/27/2014' ,'04/27/2014'),

(2, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '05/11/2017','05/20/2017'),
(2, 'Instalacion Pluvial',  'Se instalan las salidas de agua', '05/21/2017' ,'06/08/2017'),
(2, 'Instalacion Sanitaria', 'Se colocan los sanitarios', '06/09/2017' ,'06/12/2017'),
(2, 'Paredes', 'Se levantan las paredes de la construccion', '06/13/2017' ,'06/16/2017'),
(2, 'Escaleras', 'Se colocan escaleras en caso de ser necesario', '06/16/2017' ,'06/20/2017'),
(2, 'Concreto Reforzado', 'Se realiza el refuerzo de en el concreto', '06/21/2017','06/26/2017'),
(2, 'Techos', 'Se inicia a colocar el techado de la estructura', '06/27/2017','07/05/2017'),
(2, 'Instalacion Electrica', 'Se realiza la instalacion electrica', '07/12/2017' ,'07/24/2017'),
(2, 'Repello', 'Se repellan las paredes', '07/24/2017' ,'08/02/2017'),
(2, 'Entrepisos' ,'Se coloca el entrepiso', '08/03/2017' ,'08/08/2017'),
(2, 'Enchapes', 'Se inicia el enchapado en los lugares requeridos', '08/08/2017' ,'08/12/2017'),
(2, 'Pintura', 'Se pinta toda la estructura para mejorar su imagen', '08/13/2017' ,'08/22/2017'),
(2, 'Puertas', 'Se colocan las puertas', '08/23/2017' ,'08/23/2017'),
(2, 'Cerrajeria', 'Se colocan llavines', '08/24/2017' ,'08/24/2017' ),
(2, 'Ventanas', 'Se ponen los vidrios en las ventanas', '08/25/2017' ,'08/25/2017'),
(2, 'Muebles', 'Se colocan todos los muebles en la casa', '08/27/2017' ,'08/27/2017'),

(3, 'Trabajo Preliminar', 'Se limpia y aplana la zona de construccion', '01/03/2018', '01/10/2018'),
(3, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '01/11/2018','02/01/2018'),
(3, 'Instalacion Pluvial',  'Se instalan las salidas de agua', '02/02/2018' ,'02/08/2018'),
(3, 'Instalacion Sanitaria', 'Se colocan los sanitarios', '02/09/2018' ,'02/12/2018'),
(3, 'Paredes', 'Se levantan las paredes de la construccion', '02/13/2018' ,'02/16/2018'),
(3, 'Escaleras', 'Se colocan escaleras en caso de ser necesario', '02/16/2018' ,'02/20/2018'),
(3, 'Concreto Reforzado', 'Se realiza el refuerzo de en el concreto', '02/21/2018','02/26/2018'),
(3, 'Techos', 'Se inicia a colocar el techado de la estructura', '02/27/2018','03/05/2018'),
(3, 'Instalacion Electrica', 'Se realiza la instalacion electrica', '03/12/2018' ,'03/24/2018'),
(3, 'Repello', 'Se repellan las paredes', '03/24/2018' ,'04/02/2018'),
(3, 'Entrepisos' ,'Se coloca el entrepiso', '04/03/2018' ,'04/08/2018'),
(3, 'Enchapes', 'Se inicia el enchapado en los lugares requeridos', '04/08/2018' ,'04/12/2018'),
(3, 'Pintura', 'Se pinta toda la estructura para mejorar su imagen', '04/13/2018' ,'04/22/2018'),
(3, 'Puertas', 'Se colocan las puertas', '04/23/2018' ,'04/23/2018'),
(3, 'Cerrajeria', 'Se colocan llavines', '04/24/2018' ,'04/24/2018' ),
(3, 'Ventanas', 'Se ponen los vidrios en las ventanas', '04/25/2018' ,'04/25/2018'),
(3, 'Closets', 'Se instalan los closets en habitaciones', '04/26/2018' ,'04/26/2018'),
(3, 'Muebles', 'Se colocan todos los muebles en la casa', '04/27/2018' ,'04/27/2018'),


(4, 'Trabajo Preliminar', 'Se limpia y aplana la zona de construccion', '05/03/2018', '05/10/2018'),
(4, 'Cimientos', 'Se realizan los cimientos que daran soporte a la estructura', '05/11/2018','06/03/2018'),
(4, 'Instalacion Pluvial',  'Se instalan las salidas de agua', '06/01/2018' ,'06/08/2018'),
(4, 'Instalacion Sanitaria', 'Se colocan los sanitarios', '06/09/2018' ,'06/11/2018'),
(4, 'Paredes', 'Se levantan las paredes de la construccion', '06/11/2018' ,'06/16/2018'),
(4, 'Concreto Reforzado', 'Se realiza el refuerzo de en el concreto', '06/18/2018','06/28/2018'),
(4, 'Techos', 'Se inicia a colocar el techado de la estructura', '07/01/2018','07/05/2018'),
(4, 'Instalacion Electrica', 'Se realiza la instalacion electrica', '07/05/2018' ,'07/12/2018'),
(4, 'Repello', 'Se repellan las paredes', '07/12/2018' ,'07/15/2018'),
(4, 'Entrepisos' ,'Se coloca el entrepiso', '07/15/2018' ,'07/18/2018'),
(4, 'Pintura', 'Se pinta toda la estructura para mejorar su imagen', '07/19/2018' ,'07/25/2018'),
(4, 'Puertas', 'Se colocan las puertas', '07/25/2018' ,'07/26/2018'),
(4, 'Cerrajeria', 'Se colocan llavines', '07/26/2018' ,'07/27/2018' ),
(4, 'Ventanas', 'Se ponen los vidrios en las ventanas', '07/27/2018' ,'07/27/2018');


INSERT INTO Roles (id_role, id_employee, start_date) VALUES
(1, 1, '11/13/2014'),
(1, 2, '02/23/2014'),
(2, 3, '06/09/2014'),
(2, 4, '08/09/2014'),
(2, 5, '01/01/2014'),
(2, 6, '03/04/2014'),
(3, 7, '05/06/2014'),
(4, 8, '01/07/2014'),
(5, 9, '01/03/2014'),
(2, 10,'01/03/2014'),
(2, 11,'01/03/2014'),
(2, 12,'01/03/2014'),
(2, 13,'01/03/2014'),
(2, 14,'01/03/2014'),
(6, 15,'01/03/2014'),
(2, 16,'01/03/2014'),
(3, 17,'01/03/2014'),
(4, 18,'01/03/2014'),
(5, 19,'01/03/2014'),
(6, 20,'01/03/2014');




/**INSERT INTO Worked_hours(id_project, id_employee, date, hours, hour_cost) VALUES
 (1, 1, '01/03/2014', 8, 1600),
 (1, 2, '01/03/2014', 8, 1600),
 (1, 3, '01/03/2014', 8, 1600),
 (1, 4, '01/03/2014', 8, 1600),
 (1, 6, '01/03/2014', 2, 1600),
 (1, 7, '01/03/2014', 8, 2500),
 (1, 8, '01/03/2014', 8, 2000),
 (1, 9, '01/03/2014', 8, 1950),

 (2, 1, '05/11/2017', 6, 1600),
 (2, 2, '05/11/2017', 6, 1600),
 (2, 3, '05/11/2017', 6, 1600),
 (2, 4, '05/11/2017', 6, 1600),
 (2, 6, '05/11/2017', 3, 3000),
 (2, 7, '05/11/2017', 6, 3000),
 (2, 8, '05/11/2017', 8, 2500),
 (2, 9, '05/11/2017', 8, 1950),

 (3, 1, '01/03/2018', 7, 1000),
 (3, 2, '01/03/2018', 6, 1000),
 (3, 3, '01/03/2018', 5, 1000),
 (3, 4, '01/03/2018', 4, 1000),
 (3, 6, '01/03/2018', 1, 1000),
 (3, 7, '01/03/2018', 1, 1000),
 (3, 8, '01/03/2018', 1, 1000),
 (3, 9, '01/03/2018', 1, 1000),

 (4, 1, '05/03/2018', 8, 500),
 (4, 2, '05/03/2018', 3, 500),
 (4, 3, '05/03/2018', 8, 500),
 (4, 4, '05/03/2018', 3, 500),
 (4, 6, '05/03/2018', 2, 1000),
 (4, 7, '05/03/2018', 2, 1000),
 (4, 8, '05/03/2018', 2, 1000),
 (4, 9, '05/03/2018', 2, 1000);**/


 
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


INSERT INTO Bill(date, serial, price, id_stage, id_material, id_provider) VALUES
 ('04/08/2014', 'MJJN/124', 15146, 1, 1, 26),
 ('04/06/2014', 'FNAT/764', 14000, 1, 2, 7),
 ('03/04/2014', 'AFYH/742', 6500, 2, 3, 24),
 ('04/08/2014', 'VBUV/204', 3030, 2, 10, 13),
 ('04/13/2014', 'NGTZ/043', 6350, 3, 22, 6),
 ('03/15/2014', 'BIQ5/784', 9366, 4, 24, 17),
 ('03/31/2014', 'ILFO/258', 422, 5, 15, 19),
 ('03/20/2014', 'GKE1/586', 560, 5, 16, 12),
 ('04/19/2014', 'YPRV/233', 1500, 6, 17, 9),
 ('03/28/2014', 'YSE7/974', 3400, 7, 5, 8),
 ('04/16/2014', 'UAAX/617', 18473, 8, 44, 22),
 ('03/09/2014', 'UGNU/192', 821, 9, 35, 14),
 ('03/15/2014', 'CTVD/406', 1235, 9, 38, 26),
 ('03/26/2014', 'SGOV/307', 5300, 10, 8, 17),
 ('03/09/2014', 'BLYJ/298', 6400, 11, 3, 5),
 ('03/30/2014', 'GFMB/957', 11200, 12, 70, 23),
 ('04/08/2014', 'VUNJ/699', 20000, 13, 31, 13),
 ('04/16/2014', 'FFF1/760', 16600, 14, 72, 20),
 ('04/12/2014', 'JEF1/460', 20602, 15, 74, 2),
 ('04/05/2014', 'WWW9/268', 10600, 15, 75, 25),
 ('03/18/2014', 'QIQ1/848', 3000, 16, 76, 12),
 ('03/08/2014', 'CVV1/359', 64202, 17, 77, 2),
 ('04/18/2014', 'WIH1/684', 99000, 18, 78, 20),

('05/18/2017', 'SMRA/765', 1414, 19, 1, 18),
('07/08/2017', 'NXQN/035', 14599, 19, 2, 1),
('06/23/2017', 'PKL9/789', 6400, 20, 22, 4),
('05/24/2017', 'EKDD/391', 9400, 21, 24, 9),
('05/29/2017', 'HPSF/469', 4517, 21, 25, 21),
('05/21/2017', 'NNQO/671', 427, 22, 15, 10),
('05/26/2017', 'CUM0/352', 541, 22, 16, 4),
('07/25/2017', 'FLS7/006', 2808, 23, 17, 16),
('08/05/2017', 'MVKE/594', 3371, 24, 5, 18),
('06/01/2017', 'OAV8/541', 18000, 25, 44, 23),
('05/13/2017', 'JPZ5/994', 797, 26, 35, 11),
('08/12/2017', 'CNM7/810', 1100, 26, 38, 5),
('07/11/2017', 'CODT/848', 5217, 27, 8, 12),
('07/18/2017', 'DGB3/103', 6452, 28, 3, 4),
('06/24/2017', 'CPXK/125', 11038, 29, 70, 20),
('06/10/2017', 'UENO/385', 20585, 30, 31, 13),
('06/11/2017', 'PHR9/963', 16890, 31, 72, 21),
('05/11/2017', 'BYYB/260', 23922, 32, 74, 25),
('06/27/2017', 'XAO4/878', 3751, 33, 76, 2),
('06/27/2017', 'LAKF/878', 103751, 34, 78, 17),


('04/19/2018', 'HTEP/307', 14636, 35, 1, 10),
('02/22/2018', 'UDB1/071', 14000, 36, 2, 11),
('02/19/2018', 'QAF3/018', 6400, 37, 22, 22),
('01/16/2018', 'TRH9/767', 4607, 38, 25, 22),
('03/08/2018', 'LMAX/381', 444, 39, 15, 16),
('02/13/2018', 'ORVQ/519', 1657, 40, 17, 17),
('02/03/2018', 'DIPM/519', 3350, 41, 5, 19),
('01/24/2018', 'YFCM/876', 18896, 42, 44, 10),
('02/01/2018', 'ANUJ/316', 1100, 43, 38, 9),
('03/24/2018', 'GAO7/419', 5200, 44, 8, 1),
('03/30/2018', 'ZNM7/882', 6400, 45, 3, 23),
('02/04/2018', 'JZOV/679', 11000, 46, 70, 4),
('02/27/2018', 'TYTZ/206', 20000, 47, 31, 8),
('04/15/2018', 'IIZO/732', 16095, 48, 72, 8),
('03/31/2018', 'GRAL/369', 13117, 49, 75, 10),
('03/16/2018', 'FCDT/759', 3050, 50, 76, 14),
('02/12/2018', 'UALE/429', 60943, 51, 77, 20),
('02/09/2018', 'YYBW/412', 130021, 52, 78, 21),

('06/27/2018', 'ICAW/377', 14705, 53, 2, 2),
('07/07/2018', 'XYEC/991', 14730, 54, 2, 10),
('06/05/2018', 'QWJH/092', 6895, 55, 22, 6),
('07/20/2018', 'KHC0/942', 4545, 56, 25, 7),
('06/22/2018', 'GVAG/625', 447, 57, 15, 16),
('07/05/2018', 'BAIB/600', 3354, 58, 5, 7),
('06/03/2018', 'FHL4/919', 18567, 59, 44, 20),
('06/04/2018', 'ZFMY/682', 1180, 60, 38, 18),
('07/06/2018', 'NLYH/678', 5200, 61, 8, 26),
('05/26/2018', 'RSSB/552', 6400, 62, 3, 12),
('05/10/2018', 'WXB6/853', 19708, 63, 31, 14),
('07/14/2018', 'YYJ1/551', 17000, 64, 72, 25),
('07/08/2018', 'TLBP/138', 12479, 65, 75, 1),
('05/15/2018', 'AXYK/337', 3000, 66, 76, 8);


-------------------------------------------------------------DATOS DE PRUEBA-----------------------------------


 INSERT INTO Worked_hours(id_project, id_employee, date, hours) VALUES
 (1, 1, '01/03/2014', 8),
 (1, 1, '01/04/2014', 2),
 (1, 3, '01/03/2014', 3),
 (1, 4, '01/05/2014', 4),
 (2, 1, '01/06/2014', 5),
 (2, 2, '01/05/2014', 8),
 (2, 5, '01/07/2014', 9),
 (2, 6, '01/08/2014', 12),
 (3, 1, '01/09/2014', 12),
 (3, 9, '01/03/2014', 88),
 (3, 12, '01/06/2014', 1),
 (3, 5, '01/05/2014', 2),
 (4, 1, '01/09/2014', 3),
 (4, 1, '01/10/2014', 4),
 (4, 5, '01/10/2014', 8),
 (4, 12, '01/03/2014', 8);


 Select * from Employee
 Select * from MaterialsxStage
 Select * from Stage
 Select * from Project

Select * from Roles Where id_role = 1 --Administrador
Select * from Roles Where id_role = 2 --Albanil
Select * from Roles Where id_role = 3 --Arqui
Select * from Roles Where id_role = 4 --Ing Electrico
Select * from Roles Where id_role = 5 --Ing Civil





















Select * from Roles Where id_role = 6 --Ing Materiales

INSERT INTO Project (name, ubication, id_client, manager) VALUES
('Casita de nanito', 'San Vito', '987654321', 4)

