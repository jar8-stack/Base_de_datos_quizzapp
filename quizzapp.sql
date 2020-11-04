
-- Diseñar la estructura de la base de datos 
-- Diseñar los escenarios
-- Ejecutamos los querys de los cuales extraeremos la base de datos

--tabla de  preguntas
-- tabla de temas 
-- tabla de configuración 
-- tabla de juego 


-- TEMAS DE PREGUNTAS
-- 
DROP TABLE IF EXISTS [question_answers];
DROP TABLE IF EXISTS [questions];
DROP TABLE IF EXISTS [themes];
DROP TABLE IF EXISTS [configurations]; 

CREATE TABLE [configurations](
  [id_configuration] INTEGER PRIMARY KEY,
  [number_min_question] INTEGER NOT NULL,
  [number_max_question] INTEGER NOT NULL, 
  [dificulty] TEXT NOT NULL,
  [number_min_track] INTEGER NOT NULL,
  [number_max_track] INTEGER NOT NULL,
  [tracks_enabled] BOOLEAN NOT NULL);

CREATE TABLE [configuration_themes](
  [id_configuration] INTEGER REFERENCES [configurations](id_configuration), 
   [id_theme] INTEGER REFERENCES [themes](id_theme));

CREATE TABLE [themes](
  [id] INTEGER PRIMARY KEY AUTOINCREMENT, 
  [description] TEXT UNIQUE NOT NULL
);

CREATE TABLE [questions](
   [id] INTEGER PRIMARY KEY, 
   [theme_id] INTEGER REFERENCES [themes]([id]),
   [text] TEXT UNIQUE NOT NULL   
);

CREATE TABLE [question_answers](
   [id] INTEGER REFERENCES [questions] ([id]), 
   [text] TEXT NOT NULL, 
   [correct_answer] INTEGER NOT NULL
);

INSERT INTO [themes](description) VALUES('Arte');
INSERT INTO [themes](description) VALUES('Historia');
INSERT INTO [themes](description) VALUES('Ciencia');
INSERT INTO [themes](description) VALUES('Programacion');
INSERT INTO [themes](description) VALUES('Cine');
INSERT INTO [themes](description) VALUES('Cultura');

INSERT INTO questions(theme_id, text) VALUES(2, '¿En que año se publico supermario bros?');

INSERT INTO question_answers(id, text, correct_answer) VALUES(1, '1985', 1);
INSERT INTO question_answers(id, text, correct_answer) VALUES(1, '1983', 0);
INSERT INTO question_answers(id, text, correct_answer) VALUES(1, '1989', 0);
INSERT INTO question_answers(id, text, correct_answer) VALUES(1, '1981', 0);

INSERT INTO questions(theme_id, text) VALUES(2, '¿Quien creo minecraft');

INSERT INTO question_answers(id, text, correct_answer) VALUES(2, 'Notch', 1);
INSERT INTO question_answers(id, text, correct_answer) VALUES(2, 'Cory barlock', 0);
INSERT INTO question_answers(id, text, correct_answer) VALUES(2, 'El inge bolio', 0);
INSERT INTO question_answers(id, text, correct_answer) VALUES(2, 'yo', 0);

-- Consultas generales del juego 

--Mostrar temas del juego 
SELECT * FROM themes; 

--Mostrar respuestas de una pregunta el 1 es el id de la pregunta 
SELECT text, correct_answer FROM question_answers WHERE id=1


--Mostrar la respuesta correcta
SELECT text, correct_answer FROM question_answers WHERE id=1 and correct_answer=1 


--Mostrar preguntas por tema 
SELECT * FROM questions WHERE theme_id=4;

