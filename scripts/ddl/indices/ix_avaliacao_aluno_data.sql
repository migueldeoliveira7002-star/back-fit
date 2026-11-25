USE Academia;
GO

DROP INDEX IF EXISTS IX_Avaliacao_aluno_data ON Avaliacao_Fisica;
GO

CREATE INDEX IX_Avaliacao_aluno_data
    ON Avaliacao_Fisica (id_aluno, data_avaliacao) INCLUDE (peso, altura, percentual_gordura);
GO
