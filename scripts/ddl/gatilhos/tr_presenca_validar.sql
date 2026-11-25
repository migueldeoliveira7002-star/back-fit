USE Academia;
GO

DROP TRIGGER IF EXISTS tr_presenca_validar;
GO

CREATE TRIGGER tr_presenca_validar ON Presenca
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM inserted)
        RETURN;

    IF EXISTS (SELECT 1
               FROM inserted i
               JOIN Aluno a ON a.id_aluno = i.id_aluno
               WHERE a.ativo = 0)
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50001, 'Nao e possivel registrar presenca para aluno inativo.', 1;
    END;

    IF EXISTS (SELECT 1
               FROM Aula au
               WHERE au.id_aula IN (SELECT id_aula FROM inserted)
                 AND (SELECT COUNT(*) FROM Presenca p WHERE p.id_aula = au.id_aula) > au.capacidade)
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50002, 'A aula ja atingiu a capacidade maxima.', 1;
    END;
END;
GO
