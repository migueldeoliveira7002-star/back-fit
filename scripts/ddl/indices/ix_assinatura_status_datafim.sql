USE Academia;
GO

DROP INDEX IF EXISTS IX_Assinatura_status_datafim ON Assinatura;
GO

CREATE INDEX IX_Assinatura_status_datafim
    ON Assinatura (status, data_fim) INCLUDE (id_aluno, id_plano);
GO
