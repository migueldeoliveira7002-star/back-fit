USE Academia;
GO

DROP INDEX IF EXISTS IX_Presenca_aluno ON Presenca;
GO

CREATE INDEX IX_Presenca_aluno
    ON Presenca (id_aluno) INCLUDE (presente);
GO
