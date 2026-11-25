USE Academia;
GO

CREATE TABLE Exercicio (
    id_exercicio   SMALLINT IDENTITY(1,1) NOT NULL,
    nome           VARCHAR(50)  NOT NULL,
    grupo_muscular VARCHAR(30)  NOT NULL,
    descricao      VARCHAR(100) NULL,
    CONSTRAINT PK_Exercicio PRIMARY KEY (id_exercicio),
    CONSTRAINT UQ_Exercicio_nome UNIQUE (nome)
);
GO
