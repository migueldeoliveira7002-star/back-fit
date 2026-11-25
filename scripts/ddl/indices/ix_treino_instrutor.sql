USE Academia;
GO

DROP INDEX IF EXISTS IX_Treino_instrutor ON Treino;
GO

CREATE INDEX IX_Treino_instrutor
    ON Treino (id_instrutor);
GO
