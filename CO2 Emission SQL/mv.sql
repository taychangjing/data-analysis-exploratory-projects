CREATE OR REPLACE MATERIALIZED VIEW `healthy-skill-393206.MtCO2_flat.mv_emmission` AS
SELECT
  emmission.* EXCEPT (`ISO 3166-1 alpha-3`,`Per Capita`),
  emmission.`ISO 3166-1 alpha-3` AS Country_code,
  emmission.`Per Capita` AS Per_Capita,
  country_region.`string_field_2` AS Sub_Region,
  country_region.`string_field_0` AS Region
FROM
  `healthy-skill-393206.MtCO2_flat.emmission` emmission
LEFT JOIN
  `healthy-skill-393206.MtCO2_flat.country_region` country_region
ON
  emmission.`Country` = country_region.`string_field_1`
WHERE Total > 0.0 AND string_field_2 != 'null' AND Year >= 1921

CREATE OR REPLACE MATERIALIZED VIEW `healthy-skill-393206.MtCO2_flat.mv_transposed_emmission` AS
SELECT
  emmission.* EXCEPT (`ISO 3166-1 alpha-3`, `Total`),
FROM
  `healthy-skill-393206.MtCO2_flat.emmission` 
  UNPIVOT (
  metrics FOR type IN (Coal, Oil, Gas, Cement, Flaring, Other)
) emmission
WHERE Total > 0.0 AND Year >= 1921