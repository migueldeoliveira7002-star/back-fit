USE Academia;
GO

CREATE TABLE Presenca (
    id_presenca INT IDENTITY(1,1) NOT NULL,
    id_aluno    INT NOT NULL,
    id_aula     INT NOT NULL,
    presente    BIT NOT NULL CONSTRAINT DF_Presenca_presente DEFAULT 1,
    CONSTRAINT PK_Presenca PRIMARY KEY (id_presenca),
    CONSTRAINT FK_Presenca_Aluno FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    CONSTRAINT FK_Presenca_Aula  FOREIGN KEY (id_aula)  REFERENCES Aula(id_aula),
    CONSTRAINT UQ_Presenca_aluno_aula UNIQUE (id_aluno, id_aula)
);
GO
