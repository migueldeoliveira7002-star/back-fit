USE Academia;
GO

DROP FUNCTION IF EXISTS dbo.fn_CalcularIMC;
GO

CREATE FUNCTION dbo.fn_CalcularIMC (@peso DECIMAL(5,2), @altura DECIMAL(4,2))
RETURNS DECIMAL(5,2)
AS
BEGIN
    RETURN CASE
               WHEN @altura IS NULL OR @altura <= 0 THEN NULL
               ELSE CAST(@peso / (@altura * @altura) AS DECIMAL(5,2))
           END;
END;
GO
