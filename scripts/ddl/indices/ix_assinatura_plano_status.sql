USE Academia;
GO

DROP INDEX IF EXISTS IX_Assinatura_plano_status ON Assinatura;
GO

CREATE INDEX IX_Assinatura_plano_status
    ON Assinatura (id_plano, status);
GO
