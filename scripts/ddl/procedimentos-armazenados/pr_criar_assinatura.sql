USE Academia;
GO

DROP PROCEDURE IF EXISTS pr_criar_assinatura;
GO

CREATE PROCEDURE pr_criar_assinatura
    @id_aluno         INT,
    @id_plano         TINYINT,
    @metodo_pagamento VARCHAR(8) = 'Pix',
    @data_inicio      DATE       = NULL,
    @id_assinatura    INT        OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @valor DECIMAL(7,2), @duracao TINYINT;

    SET @data_inicio = ISNULL(@data_inicio, CAST(GETDATE() AS DATE));

    IF NOT EXISTS (SELECT 1 FROM Aluno WHERE id_aluno = @id_aluno AND ativo = 1)
        THROW 50101, 'Aluno inexistente ou inativo.', 1;

    SELECT @valor = valor, @duracao = duracao_meses
    FROM Plano
    WHERE id_plano = @id_plano AND ativo = 1;

    IF @valor IS NULL
        THROW 50102, 'Plano inexistente ou inativo.', 1;

    IF EXISTS (SELECT 1 FROM Assinatura
               WHERE id_aluno = @id_aluno
                 AND status IN ('Ativa', 'Suspensa')
                 AND data_fim >= @data_inicio)
        THROW 50103, 'O aluno ja possui uma assinatura ativa ou suspensa.', 1;

    BEGIN TRANSACTION;

        INSERT INTO Assinatura (id_aluno, id_plano, data_inicio, data_fim, status, valor_mensal)
        VALUES (@id_aluno, @id_plano, @data_inicio,
                DATEADD(MONTH, @duracao, @data_inicio), 'Ativa', @valor);

        SET @id_assinatura = SCOPE_IDENTITY();

        INSERT INTO Pagamento (id_assinatura, data_pagamento, valor, metodo_pagamento, status, referencia)
        VALUES (@id_assinatura, @data_inicio, @valor, @metodo_pagamento, 'Pendente',
                CONCAT('ASS-', @id_assinatura, '-01'));

    COMMIT TRANSACTION;
END;
GO
