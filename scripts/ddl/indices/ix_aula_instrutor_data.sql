USE Academia;
GO

DROP INDEX IF EXISTS IX_Aula_instrutor_data ON Aula;
GO

CREATE INDEX IX_Aula_instrutor_data
    ON Aula (id_instrutor, data_aula) INCLUDE (horario, id_modalidade, duracao);
GO
