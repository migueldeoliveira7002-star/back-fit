USE Academia;
GO

DROP INDEX IF EXISTS IX_Pagamento_assinatura ON Pagamento;
GO

CREATE INDEX IX_Pagamento_assinatura
    ON Pagamento (id_assinatura);
GO
