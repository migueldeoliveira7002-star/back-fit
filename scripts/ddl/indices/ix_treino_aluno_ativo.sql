USE Academia;
GO

DROP INDEX IF EXISTS IX_Treino_aluno_ativo ON Treino;
GO

CREATE INDEX IX_Treino_aluno_ativo
    ON Treino (id_aluno, ativo) INCLUDE (nome);
GO
