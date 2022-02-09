SELECT `nombre`
FROM `conductores`
WHERE `categ` < ANY(
    SELECT `categ`
    FROM `conductores`
    WHERE `localidad` = 'ARGANDA'
) AND localidad <> 'ARGANDA'