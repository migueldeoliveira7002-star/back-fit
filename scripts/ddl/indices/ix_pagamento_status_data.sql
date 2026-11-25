USE Academia;
GO

DROP INDEX IF EXISTS IX_Pagamento_status_data ON Pagamento;
GO

CREATE INDEX IX_Pagamento_status_data
    ON Pagamento (status, data_pagamento) INCLUDE (valor, id_assinatura);
GO
