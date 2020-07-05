cd /home/osm2igeoadmin/
sh 01_OSM2IGEOADMIN_SHP.sh FRANCE 2154 > /home/osm2igeoadmin/log/$(date '+%Y%m')'_FRANCE_2154.txt';
sh 01_OSM2IGEOADMIN_SHP.sh FRANCE 4326 > /home/osm2igeoadmin/log/$(date '+%Y%m')'_FRANCE_4326.txt';
#sh 01_OSM2IGEOADMIN_GPKG.sh FRANCE 2154 > /home/osm2igeoadmin/log/$(date '+%Y%m')'_FRANCE_2154.txt';
#sh 01_OSM2IGEOADMIN_GPKG.sh FRANCE 4326 > /home/osm2igeoadmin/log/$(date '+%Y%m')'_FRANCE_4326.txt';
