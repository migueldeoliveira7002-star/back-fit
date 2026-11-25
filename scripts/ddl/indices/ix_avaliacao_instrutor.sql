USE Academia;
GO

DROP INDEX IF EXISTS IX_Avaliacao_instrutor ON Avaliacao_Fisica;
GO

CREATE INDEX IX_Avaliacao_instrutor
    ON Avaliacao_Fisica (id_instrutor);
GO
