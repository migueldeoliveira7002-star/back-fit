USE Academia;
GO

CREATE TABLE Instrutor (
    id_instrutor  SMALLINT IDENTITY(1,1) NOT NULL,
    nome          VARCHAR(100) NOT NULL,
    cpf           CHAR(11)     NOT NULL,
    email         VARCHAR(100) NOT NULL,
    especialidade VARCHAR(40)  NULL,
    telefone      VARCHAR(11)  NULL,
    ativo         BIT          NOT NULL CONSTRAINT DF_Instrutor_ativo DEFAULT 1,
    CONSTRAINT PK_Instrutor PRIMARY KEY (id_instrutor),
    CONSTRAINT UQ_Instrutor_cpf   UNIQUE (cpf),
    CONSTRAINT UQ_Instrutor_email UNIQUE (email),
    CONSTRAINT CK_Instrutor_cpf      CHECK (cpf NOT LIKE '%[^0-9]%'),
    CONSTRAINT CK_Instrutor_email    CHECK (email LIKE '%_@_%._%'),
    CONSTRAINT CK_Instrutor_telefone CHECK (telefone IS NULL OR telefone NOT LIKE '%[^0-9]%')
);
GO
