USE Academia;
GO

DROP INDEX IF EXISTS IX_Assinatura_aluno ON Assinatura;
GO

CREATE INDEX IX_Assinatura_aluno
    ON Assinatura (id_aluno) INCLUDE (status, data_fim);
GO
