USE Academia;
GO

CREATE TABLE Modalidade (
    id_modalidade TINYINT IDENTITY(1,1) NOT NULL,
    nome          VARCHAR(40)  NOT NULL,
    descricao     VARCHAR(100) NULL,
    CONSTRAINT PK_Modalidade PRIMARY KEY (id_modalidade),
    CONSTRAINT UQ_Modalidade_nome UNIQUE (nome)
);
GO
