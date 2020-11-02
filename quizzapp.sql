
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

INSERT INTO [themes](description) VALUES('cine');
INSERT INTO [themes](description) VALUES('fisica');
INSERT INTO [themes](description) VALUES('Historia');
INSERT INTO [themes](description) VALUES('Matematicas');
INSERT INTO [themes](description) VALUES('Videojuegos');

INSERT INTO [themes](description) VALUES('Arte');

INSERT INTO questions(theme_id, text) VALUES(4, '¿En que año se publico supermario bros?');

INSERT INTO question_answers(id, text, correct_answer) VALUES(1, '1985', 1);
INSERT INTO question_answers(id, text, correct_answer) VALUES(1, '1983', 0);
INSERT INTO question_answers(id, text, correct_answer) VALUES(1, '1989', 0);
INSERT INTO question_answers(id, text, correct_answer) VALUES(1, '1981', 0);
