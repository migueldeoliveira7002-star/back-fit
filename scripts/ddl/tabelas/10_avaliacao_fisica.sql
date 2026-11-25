USE Academia;
GO

CREATE TABLE Avaliacao_Fisica (
    id_avaliacao       INT IDENTITY(1,1) NOT NULL,
    id_aluno           INT          NOT NULL,
    id_instrutor       SMALLINT     NOT NULL,
    data_avaliacao     DATE         NOT NULL,
    peso               DECIMAL(5,2) NOT NULL,
    altura             DECIMAL(4,2) NOT NULL,
    percentual_gordura DECIMAL(5,2) NULL,
    observacoes        VARCHAR(300) NULL,
    CONSTRAINT PK_Avaliacao_Fisica PRIMARY KEY (id_avaliacao),
    CONSTRAINT FK_Avaliacao_Aluno     FOREIGN KEY (id_aluno)     REFERENCES Aluno(id_aluno),
    CONSTRAINT FK_Avaliacao_Instrutor FOREIGN KEY (id_instrutor) REFERENCES Instrutor(id_instrutor),
    CONSTRAINT CK_Avaliacao_peso    CHECK (peso BETWEEN 20 AND 400),
    CONSTRAINT CK_Avaliacao_altura  CHECK (altura BETWEEN 0.50 AND 2.50),
    CONSTRAINT CK_Avaliacao_gordura CHECK (percentual_gordura IS NULL OR percentual_gordura BETWEEN 0 AND 100)
);
GO
