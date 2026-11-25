USE Academia;
GO

CREATE TABLE Pagamento (
    id_pagamento     INT IDENTITY(1,1) NOT NULL,
    id_assinatura    INT          NOT NULL,
    data_pagamento   DATE         NOT NULL,
    valor            DECIMAL(7,2) NOT NULL,
    metodo_pagamento VARCHAR(8)   NOT NULL,
    status           VARCHAR(10)  NOT NULL CONSTRAINT DF_Pagamento_status DEFAULT 'Pendente',
    referencia       VARCHAR(20)  NULL,
    CONSTRAINT PK_Pagamento PRIMARY KEY (id_pagamento),
    CONSTRAINT FK_Pagamento_Assinatura FOREIGN KEY (id_assinatura) REFERENCES Assinatura(id_assinatura),
    CONSTRAINT CK_Pagamento_valor  CHECK (valor > 0),
    CONSTRAINT CK_Pagamento_metodo CHECK (metodo_pagamento IN ('Pix','Credito','Debito','Boleto','Dinheiro')),
    CONSTRAINT CK_Pagamento_status CHECK (status IN ('Pago','Pendente','Atrasado','Estornado'))
);
GO
