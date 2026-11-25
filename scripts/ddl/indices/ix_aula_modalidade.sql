USE Academia;
GO

DROP INDEX IF EXISTS IX_Aula_modalidade ON Aula;
GO

CREATE INDEX IX_Aula_modalidade
    ON Aula (id_modalidade);
GO
