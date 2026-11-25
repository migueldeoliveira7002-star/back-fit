USE Academia;
GO

CREATE TABLE Assinatura (
    id_assinatura INT IDENTITY(1,1) NOT NULL,
    id_aluno      INT          NOT NULL,
    id_plano      TINYINT      NOT NULL,
    data_inicio   DATE         NOT NULL,
    data_fim      DATE         NOT NULL,
    status        VARCHAR(10)  NOT NULL CONSTRAINT DF_Assinatura_status DEFAULT 'Ativa',
    valor_mensal  DECIMAL(7,2) NOT NULL,
    CONSTRAINT PK_Assinatura PRIMARY KEY (id_assinatura),
    CONSTRAINT FK_Assinatura_Aluno FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    CONSTRAINT FK_Assinatura_Plano FOREIGN KEY (id_plano) REFERENCES Plano(id_plano),
    CONSTRAINT CK_Assinatura_status CHECK (status IN ('Ativa','Suspensa','Vencida','Cancelada')),
    CONSTRAINT CK_Assinatura_datas  CHECK (data_fim >= data_inicio),
    CONSTRAINT CK_Assinatura_valor  CHECK (valor_mensal > 0)
);
GO
