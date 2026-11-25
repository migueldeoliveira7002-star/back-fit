USE Academia;
GO

DROP INDEX IF EXISTS IX_Item_Treino_exercicio ON Item_Treino;
GO

CREATE INDEX IX_Item_Treino_exercicio
    ON Item_Treino (id_exercicio);
GO
