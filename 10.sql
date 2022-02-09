SELECT `nombre`
FROM `maquinas`
WHERE `m#` IN(
    SELECT `m#`
    FROM `trabajos`
    WHERE `p#` = 'P3'
)