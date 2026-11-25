USE Academia;
GO

CREATE TABLE Treino (
    id_treino    INT IDENTITY(1,1) NOT NULL,
    id_aluno     INT         NOT NULL,
    id_instrutor SMALLINT    NOT NULL,
    nome         VARCHAR(60) NOT NULL,
    objetivo     VARCHAR(60) NULL,
    data_criacao DATE        NOT NULL CONSTRAINT DF_Treino_data  DEFAULT (CAST(GETDATE() AS DATE)),
    ativo        BIT         NOT NULL CONSTRAINT DF_Treino_ativo DEFAULT 1,
    CONSTRAINT PK_Treino PRIMARY KEY (id_treino),
    CONSTRAINT FK_Treino_Aluno     FOREIGN KEY (id_aluno)     REFERENCES Aluno(id_aluno),
    CONSTRAINT FK_Treino_Instrutor FOREIGN KEY (id_instrutor) REFERENCES Instrutor(id_instrutor)
);
GO
