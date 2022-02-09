SELECT `c#`
FROM `conductores`
WHERE `localidad` = 'ARGANDA'

UNION

SELECT `c#`
FROM `conductores`
WHERE `c#` IN(
    SELECT `c#`
    FROM `trabajos`
    WHERE `p#` = 'P4'
)