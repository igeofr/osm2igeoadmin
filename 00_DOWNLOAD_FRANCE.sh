cd "/home/osm2igeoadmin/data_in"
################################################################################
#FRANCE
rm -r FRANCE
mkdir FRANCE
curl https://download.geofabrik.de/europe/france'-latest.osm.pbf' > "./FRANCE/FRANCE.pbf"
