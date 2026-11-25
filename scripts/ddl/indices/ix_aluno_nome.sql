USE Academia;
GO

DROP INDEX IF EXISTS IX_Aluno_nome ON Aluno;
GO

CREATE INDEX IX_Aluno_nome
    ON Aluno (nome);
GO
