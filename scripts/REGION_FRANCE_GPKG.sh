#!/bin/bash

echo "Debut > REGION"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'GPKG' -update -append 'data_temp/'$PAYS/$OUT_EPSG'/OSM2IGEOADMIN.gpkg' -nln REGION -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ REGION ----------------------------------------------------------------
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
'ç','C')) AS "NOM_REG_M",
-----------------------------------------
name AS "NOM_REG",
-----------------------------------------
ref_insee AS "INSEE_REG",
-----------------------------------------
coalesce(source,source_geometry,source_name,source_ref,source_addr,'OpenStreetMap') AS "SOURCE",
-----------------------------------------
SUBSTR(osm_timestamp, 1, 10) AS "DATE_MAJ"
-----------------------------------------
FROM multipolygons WHERE boundary='administrative' AND admin_level='4' AND (ref_insee='11' OR ref_insee='24' OR ref_insee='27' OR ref_insee='28' OR ref_insee='32' OR ref_insee='44' OR ref_insee='52' OR ref_insee='53' OR ref_insee='75' OR ref_insee='76' OR ref_insee='84' OR ref_insee='93' OR ref_insee='94') AND ST_IsValid(ST_Buffer(GEOMETRY,0))
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'tmp/' --config OSM_CONFIG_FILE 'scripts/REGION_FRANCE_osmconf.ini'
echo "Fin > REGION"
