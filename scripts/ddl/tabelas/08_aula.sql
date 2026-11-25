USE Academia;
GO

CREATE TABLE Aula (
    id_aula       INT IDENTITY(1,1) NOT NULL,
    id_modalidade TINYINT   NOT NULL,
    id_instrutor  SMALLINT  NOT NULL,
    data_aula     DATE      NOT NULL,
    horario       TIME(0)   NOT NULL,
    duracao       TINYINT   NOT NULL,
    capacidade    TINYINT   NOT NULL,
    CONSTRAINT PK_Aula PRIMARY KEY (id_aula),
    CONSTRAINT FK_Aula_Modalidade FOREIGN KEY (id_modalidade) REFERENCES Modalidade(id_modalidade),
    CONSTRAINT FK_Aula_Instrutor  FOREIGN KEY (id_instrutor)  REFERENCES Instrutor(id_instrutor),
    CONSTRAINT CK_Aula_duracao    CHECK (duracao > 0),
    CONSTRAINT CK_Aula_capacidade CHECK (capacidade > 0)
);
GO
