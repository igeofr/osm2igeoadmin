#!/bin/bash

echo "Debut > EPCI"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS/$OUT_EPSG'/OSM2IGEOADMIN.gpkg' -nln EPCI -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ EPCI ------------------------------------------------------------------
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
'ç','C')) AS "NOM_M",
-----------------------------------------
name AS "NOM",
-----------------------------------------
CASE local_authority_FR
  WHEN 'CC' THEN 'Communauté de communes '
  WHEN 'CA' THEN 'Communauté d''agglomération'
  WHEN 'CU' THEN 'Communauté urbaine'
  WHEN 'SAN' THEN 'Syndicat d''agglomération nouvelle'
  WHEN 'metropole' THEN 'Métropole'
  ELSE 'NC'
END AS "TYPE_EPCI",
-----------------------------------------
ref_FR_SIREN AS "CODE_EPCI",
-----------------------------------------
coalesce(source,source_geometry,source_name,source_ref,source_addr,'OpenStreetMap') AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE type='boundary' AND boundary='local_authority' AND ref_FR_SIREN IS NOT NULL AND ST_IsValid(ST_Buffer(GEOMETRY,0))
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'tmp/' --config OSM_CONFIG_FILE 'scripts/EPCI_FRANCE_osmconf.ini'
echo "Fin > EPCI"
