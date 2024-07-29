CREATE OR REPLACE MATERIALIZED VIEW `healthy-skill-393206.MtCO2_flat.mv_emmission` AS
SELECT *
FROM `healthy-skill-393206.MtCO2_flat.emmission`
WHERE Total != 0.0

DROP MATERIALIZED VIEW IF EXISTS `healthy-skill-393206.MtCO2_flat.mv_emmission`