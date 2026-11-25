USE Academia;
GO

CREATE TABLE Item_Treino (
    id_item_treino INT IDENTITY(1,1) NOT NULL,
    id_treino      INT          NOT NULL,
    id_exercicio   SMALLINT     NOT NULL,
    series         TINYINT      NOT NULL,
    repeticoes     TINYINT      NOT NULL,
    carga          DECIMAL(5,2) NULL,
    CONSTRAINT PK_Item_Treino PRIMARY KEY (id_item_treino),
    CONSTRAINT FK_Item_Treino_Treino    FOREIGN KEY (id_treino)    REFERENCES Treino(id_treino),
    CONSTRAINT FK_Item_Treino_Exercicio FOREIGN KEY (id_exercicio) REFERENCES Exercicio(id_exercicio),
    CONSTRAINT UQ_Item_Treino UNIQUE (id_treino, id_exercicio),
    CONSTRAINT CK_Item_series     CHECK (series > 0),
    CONSTRAINT CK_Item_repeticoes CHECK (repeticoes > 0),
    CONSTRAINT CK_Item_carga      CHECK (carga IS NULL OR carga >= 0)
);
GO
