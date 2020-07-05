#!/bin/bash

echo "Debut > DEPARTEMENT"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS/$OUT_EPSG'/OSM2IGEOADMIN.gpkg' -nln DEPARTEMENT -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ DEPARTEMENT -----------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
-----------------------------------------
coalesce('r'||osm_id,'w'||osm_way_id)  AS "ID",
-----------------------------------------
ST_Buffer(GEOMETRY,0) AS "GEOMETRY",
-----------------------------------------
upper(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
replace(
name,
'â','A'),
'à','A'),
'é','E'),
'è','E'),
'ê','E'),
'ë','E'),
'ï','I'),
'î','I'),
'ô','O'),
'ö','O'),
'ü','U'),
'û','U'),
'ç','C')) AS "NOM_DEP_M",
-----------------------------------------
name AS "NOM_DEP",
-----------------------------------------
ref_insee AS "INSEE_DEP",
-----------------------------------------
CASE
  WHEN SUBSTR(ref_insee,1,2)='01' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='02' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='03' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='04' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='05' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='06' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='07' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='08' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='09' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='10' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='11' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='12' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='13' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='14' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='15' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='16' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='17' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='18' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='19' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='21' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='22' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='23' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='24' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='25' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='26' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='27' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='28' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='29' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='2A' THEN 94
  WHEN SUBSTR(ref_insee,1,2)='2B' THEN 94
  WHEN SUBSTR(ref_insee,1,2)='30' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='31' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='32' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='33' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='34' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='35' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='36' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='37' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='38' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='39' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='40' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='41' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='42' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='43' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='44' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='45' THEN 24
  WHEN SUBSTR(ref_insee,1,2)='46' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='47' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='48' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='49' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='50' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='51' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='52' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='53' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='54' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='55' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='56' THEN 53
  WHEN SUBSTR(ref_insee,1,2)='57' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='58' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='59' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='60' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='61' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='62' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='63' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='64' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='65' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='66' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='67' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='68' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='69' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='70' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='71' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='72' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='73' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='74' THEN 84
  WHEN SUBSTR(ref_insee,1,2)='75' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='76' THEN 28
  WHEN SUBSTR(ref_insee,1,2)='77' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='78' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='79' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='80' THEN 32
  WHEN SUBSTR(ref_insee,1,2)='81' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='82' THEN 76
  WHEN SUBSTR(ref_insee,1,2)='83' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='84' THEN 93
  WHEN SUBSTR(ref_insee,1,2)='85' THEN 52
  WHEN SUBSTR(ref_insee,1,2)='86' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='87' THEN 75
  WHEN SUBSTR(ref_insee,1,2)='88' THEN 44
  WHEN SUBSTR(ref_insee,1,2)='89' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='90' THEN 27
  WHEN SUBSTR(ref_insee,1,2)='91' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='92' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='93' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='94' THEN 11
  WHEN SUBSTR(ref_insee,1,2)='95' THEN 11
  ELSE ''
END AS "INSEE_REG",
-----------------------------------------
coalesce(source,source_geometry,source_name,source_ref,source_addr,'OpenStreetMap') AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE boundary='administrative' AND admin_level='6' AND (SUBSTR(ref_insee,1,2)='01' OR SUBSTR(ref_insee,1,2)='02' OR SUBSTR(ref_insee,1,2)='03' OR SUBSTR(ref_insee,1,2)='04' OR SUBSTR(ref_insee,1,2)='05' OR SUBSTR(ref_insee,1,2)='06' OR SUBSTR(ref_insee,1,2)='07' OR SUBSTR(ref_insee,1,2)='08' OR SUBSTR(ref_insee,1,2)='09' OR SUBSTR(ref_insee,1,2)='10' OR SUBSTR(ref_insee,1,2)='11' OR SUBSTR(ref_insee,1,2)='12' OR SUBSTR(ref_insee,1,2)='13' OR SUBSTR(ref_insee,1,2)='14' OR SUBSTR(ref_insee,1,2)='15' OR SUBSTR(ref_insee,1,2)='16' OR SUBSTR(ref_insee,1,2)='17' OR SUBSTR(ref_insee,1,2)='18' OR SUBSTR(ref_insee,1,2)='19' OR SUBSTR(ref_insee,1,2)='2A' OR SUBSTR(ref_insee,1,2)='2B' OR SUBSTR(ref_insee,1,2)='21' OR SUBSTR(ref_insee,1,2)='22' OR SUBSTR(ref_insee,1,2)='23' OR SUBSTR(ref_insee,1,2)='24' OR SUBSTR(ref_insee,1,2)='25' OR SUBSTR(ref_insee,1,2)='26' OR SUBSTR(ref_insee,1,2)='27' OR SUBSTR(ref_insee,1,2)='28' OR SUBSTR(ref_insee,1,2)='29' OR SUBSTR(ref_insee,1,2)='30' OR SUBSTR(ref_insee,1,2)='31' OR SUBSTR(ref_insee,1,2)='32' OR SUBSTR(ref_insee,1,2)='33' OR SUBSTR(ref_insee,1,2)='34' OR SUBSTR(ref_insee,1,2)='35' OR SUBSTR(ref_insee,1,2)='36' OR SUBSTR(ref_insee,1,2)='37' OR SUBSTR(ref_insee,1,2)='38' OR SUBSTR(ref_insee,1,2)='39' OR SUBSTR(ref_insee,1,2)='40' OR SUBSTR(ref_insee,1,2)='41' OR SUBSTR(ref_insee,1,2)='42' OR SUBSTR(ref_insee,1,2)='43' OR SUBSTR(ref_insee,1,2)='44' OR SUBSTR(ref_insee,1,2)='45' OR SUBSTR(ref_insee,1,2)='46' OR SUBSTR(ref_insee,1,2)='47' OR SUBSTR(ref_insee,1,2)='48' OR SUBSTR(ref_insee,1,2)='49' OR SUBSTR(ref_insee,1,2)='50' OR SUBSTR(ref_insee,1,2)='51' OR SUBSTR(ref_insee,1,2)='52' OR SUBSTR(ref_insee,1,2)='53' OR SUBSTR(ref_insee,1,2)='54' OR SUBSTR(ref_insee,1,2)='55' OR SUBSTR(ref_insee,1,2)='56' OR SUBSTR(ref_insee,1,2)='57' OR SUBSTR(ref_insee,1,2)='58' OR SUBSTR(ref_insee,1,2)='59' OR SUBSTR(ref_insee,1,2)='60' OR SUBSTR(ref_insee,1,2)='61' OR SUBSTR(ref_insee,1,2)='62' OR SUBSTR(ref_insee,1,2)='63' OR SUBSTR(ref_insee,1,2)='64' OR SUBSTR(ref_insee,1,2)='65' OR SUBSTR(ref_insee,1,2)='66' OR SUBSTR(ref_insee,1,2)='67' OR SUBSTR(ref_insee,1,2)='68' OR SUBSTR(ref_insee,1,2)='69' OR SUBSTR(ref_insee,1,2)='70' OR SUBSTR(ref_insee,1,2)='71' OR SUBSTR(ref_insee,1,2)='72' OR SUBSTR(ref_insee,1,2)='73' OR SUBSTR(ref_insee,1,2)='74' OR SUBSTR(ref_insee,1,2)='75' OR SUBSTR(ref_insee,1,2)='76' OR SUBSTR(ref_insee,1,2)='77' OR SUBSTR(ref_insee,1,2)='78' OR SUBSTR(ref_insee,1,2)='79' OR SUBSTR(ref_insee,1,2)='80' OR SUBSTR(ref_insee,1,2)='81' OR SUBSTR(ref_insee,1,2)='82' OR SUBSTR(ref_insee,1,2)='83' OR SUBSTR(ref_insee,1,2)='84' OR SUBSTR(ref_insee,1,2)='85' OR SUBSTR(ref_insee,1,2)='86' OR SUBSTR(ref_insee,1,2)='87' OR SUBSTR(ref_insee,1,2)='88' OR SUBSTR(ref_insee,1,2)='89' OR SUBSTR(ref_insee,1,2)='90' OR SUBSTR(ref_insee,1,2)='91' OR SUBSTR(ref_insee,1,2)='92' OR SUBSTR(ref_insee,1,2)='93' OR SUBSTR(ref_insee,1,2)='94' OR SUBSTR(ref_insee,1,2)='95') AND ST_IsValid(ST_Buffer(GEOMETRY,0))
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'tmp/' --config OSM_CONFIG_FILE 'scripts/DEPARTEMENT_FRANCE_osmconf.ini'
echo "Fin > DEPARTEMENT"
