
-- questão 1
CREATE LOGIN User_A WITH PASSWORD = '123456789';
CREATE LOGIN User_B WITH PASSWORD = '123456';
CREATE LOGIN User_C WITH PASSWORD = '123456';
CREATE LOGIN User_D WITH PASSWORD = '123456';
CREATE LOGIN User_E WITH PASSWORD = '123456';

USE university;

CREATE USER User_A FOR LOGIN User_A;
CREATE USER User_B FOR LOGIN User_B;
CREATE USER User_C FOR LOGIN User_C;
CREATE USER User_D FOR LOGIN User_D;
CREATE USER User_E FOR LOGIN User_E;

-- questão 2

DECLARE @sql NVARCHAR(MAX) = '';
SELECT @sql += '
GRANT SELECT, INSERT, UPDATE, DELETE ON ' + QUOTENAME(name) + ' TO User_A WITH GRANT OPTION;'
FROM sys.tables
WHERE name <> 'classroom';

EXEC sp_executesql @sql;

-- questão3

SELECT 
    grantee_principal.name AS Usuario,
    permission_name AS Permissao,
    class_desc AS Tipo,
    OBJECT_NAME(major_id) AS Objeto,
    state_desc AS TipoPermissao
FROM sys.database_permissions dp
JOIN sys.database_principals grantee_principal
    ON dp.grantee_principal_id = grantee_principal.principal_id
WHERE grantee_principal.name = 'User_A';
