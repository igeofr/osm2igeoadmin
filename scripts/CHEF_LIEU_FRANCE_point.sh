#!/bin/bash

echo "Debut > CHEF_LIEU_point.shp"
$LINK_OGR -progress -s_srs EPSG:4326 -t_srs EPSG:$OUT_EPSG -f 'ESRI Shapefile' 'data_temp/'$PAYS/$OUT_EPSG'/CHEF_LIEU_point.shp' -dialect SQLITE -sql "SELECT * FROM (
------------------------------------------------------------------------------------------------------------
------------------------------------ CHEF LIEU point -------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT
geometry,
osm_id,
place,
name,
alt_name,
addr_postcode,
postal_code,
ref_FR_SIREN,
osm_timestamp
-----------------------------------------
FROM points AS p WHERE (p.place='city' OR p.place='town' OR p.place='village') AND IsValid(p.GEOMETRY)=1
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
)" $DATA_IN -lco ENCODING=$ENCODAGE -lco SPATIAL_INDEX=YES --debug ON -skipfailures --config CPL_TMPDIR 'tmp/' --config OSM_MAX_TMPFILE_SIZE 4096 --config OSM_CONFIG_FILE 'scripts/CHEF_LIEU_FRANCE_osmconf.ini'
echo "Fin > CHEF_LIEU_point.shp"
