USE Academia;
GO

DROP INDEX IF EXISTS IX_Presenca_aula ON Presenca;
GO

CREATE INDEX IX_Presenca_aula
    ON Presenca (id_aula) INCLUDE (presente);
GO
