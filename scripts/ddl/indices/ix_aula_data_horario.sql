USE Academia;
GO

DROP INDEX IF EXISTS IX_Aula_data_horario ON Aula;
GO

CREATE INDEX IX_Aula_data_horario
    ON Aula (data_aula, horario) INCLUDE (id_modalidade, id_instrutor, capacidade);
GO
