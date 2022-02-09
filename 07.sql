SELECT `nombre`
FROM `conductores`
WHERE `c#` IN(
    SELECT `c#`
    FROM `trabajos`
    WHERE `m#` = 'M2'
)

SELECT nombre
FROM conductores, trabajos
WHERE conductores.c# = trabajos.c# AND m# = 'M2';