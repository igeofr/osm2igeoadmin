start=$(date '+%s')

if [ "$#" -ge 1 ]; then
  if [ "$1" = "FRANCE" ];
  then
    a_pays=$1
  else
  IFS= read -p "PAYS : " p_pays
  if [ "$p_pays" = "FRANCE" ];
  then
    export a_pays=$p_pays
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
else
  IFS= read -p "PAYS : " p_pays
  if [ "$p_pays" = "FRANCE" ];
  then
    export a_pays=$p_pays
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
#-------------------------------------------------------------------------------
if [ "$#" -ge 2 ]; then
  if [ "$2" = "2154" ] || [ "$2" = "4326" ];
  then
    c_epsg=$2
  else
  IFS= read -p "EPSG : " p_epsg
  if [ "$p_epsg" = "2154" ] || [ "$p_epsg" = "4326" ];
  then
    export c_epsg=$p_epsg
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi
else
  IFS= read -p "EPSG : " p_epsg
  if [ "$p_epsg" = "2154" ] || [ "$p_epsg" = "4326" ];
  then
    export c_epsg=$p_epsg
  else
    echo "Erreur de paramètre"
    exit 0
  fi
fi

#-------------------------------------------------------------------------------
#Variables
export REPER=/home/osm2igeoadmin
export PAYS=$a_pays

cd $REPER/data_in/$PAYS/

for file in $a_pays.pbf

do
    #Variables
    export OUT_EPSG=$c_epsg
    export LINK_OGR=ogr2ogr
    export DATA_IN=data_in/$PAYS/${file}
    export ENCODAGE=UTF-8
    export DATE_T=$(date '+%Y%m')
    export DATE_OLD=$(date -d "-1 month" +%Y%m)
    #-------------------------------------------------------------------------------
    #EPSG
    if [ "$c_epsg" = "4326" ]
    then
      export EMPRISE='-180 -90 180 90'
      export NZ='_WGS84_4326'
    fi
    if [ "$c_epsg" = "2154" ]
    then
      export EMPRISE='-9.62 41.18 10.30 51.54'
      export NZ='_L93_2154'
    fi

    cd $REPER
    mkdir data_temp/$PAYS
    mkdir data_temp/$PAYS/$OUT_EPSG
    cd data_temp/$PAYS/$OUT_EPSG
    rm -rfv *
    cd $REPER

    #----------------------------------------------------------------------------------
    #ADMIN
    sh scripts/ARRONDISSEMENT_FRANCE_SHP.sh | tee data_temp/$PAYS/$OUT_EPSG/ARRONDISSEMENT.txt
    sh scripts/DEPARTEMENT_FRANCE_SHP.sh | tee data_temp/$PAYS/$OUT_EPSG/DEPARTEMENT.txt
    sh scripts/REGION_FRANCE_SHP.sh | tee data_temp/$PAYS/$OUT_EPSG/REGION.txt
    sh scripts/EPCI_FRANCE_SHP.sh | tee data_temp/$PAYS/$OUT_EPSG/EPCI.txt

    cp scripts/CHEF_LIEU_FRANCE_SELECT.vrt data_temp/$PAYS/$OUT_EPSG'/CHEF_LIEU_SELECT.vrt'
    sh scripts/CHEF_LIEU_FRANCE_boundary.sh | tee data_temp/$PAYS/$OUT_EPSG/CHEF_LIEU_boundary.txt
    sh scripts/CHEF_LIEU_FRANCE_point.sh | tee data_temp/$PAYS/$OUT_EPSG/CHEF_LIEU_point.txt
    sh scripts/CHEF_LIEU_FRANCE_SHP.sh | tee data_temp/$PAYS/$OUT_EPSG/CHEF_LIEU.txt
    rm data_temp/$PAYS/$OUT_EPSG/CHEF_LIEU_boundary.*
    rm data_temp/$PAYS/$OUT_EPSG/CHEF_LIEU_point.*
    rm data_temp/$PAYS/$OUT_EPSG'/CHEF_LIEU_SELECT.vrt'

    sh scripts/COMMUNE_FRANCE_SHP.sh | tee data_temp/$PAYS/$OUT_EPSG/COMMUNE.txt
    #----------------------------------------------------------------------------------
    #SORTIE SHP
    rm -r data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ -v
    mkdir data_out/$PAYS -v

    mkdir data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ -v
    cp -r data_temp/$PAYS/$OUT_EPSG/* data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/

    rm -r data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/*.txt
    #----------------------------------------------------------------------------------
    cp attachement/Z_PROJET_OSM2IGEOADMIN_SHP.qgs data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
    cp attachement/Z_Licence.txt data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_Licence.txt
    #----------------------------------------------------------------------------------
    #SORTIE MODIFICATION DU PROJET SHP
    if [ "$c_epsg" = "4326" ]
    then
      sed -i -e "s/<proj4>+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs<\/proj4>/<proj4>+proj=longlat +datum=WGS84 +no_defs<\/proj4>/g" data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
      sed -i -e "s/<srsid>145<\/srsid>/<srsid>3452<\/srsid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
      sed -i -e "s/<srid>2154<\/srid>/<srid>4326<\/srid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
      sed -i -e "s/<authid>EPSG:2154<\/authid>/<authid>EPSG:4326<\/authid>/g" data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
      sed -i -e "s/<description>RGF93 \/ Lambert-93<\/description>/<description>WGS 84<\/description>/g" data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
      sed -i -e "s/<projectionacronym>lcc<\/projectionacronym>/<projectionacronym>longlat<\/projectionacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
      sed -i -e "s/<ellipsoidacronym>GRS80<\/ellipsoidacronym>/<ellipsoidacronym>WGS84<\/ellipsoidacronym>/g" data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
      sed -i -e "s/<geographicflag>false<\/geographicflag>/<geographicflag>true<\/geographicflag>/g" data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ/Z_PROJET_OSM2IGEOADMIN.qgs
    fi
    #----------------------------------------------------------------------------------
    #ZIP
    cd $REPER/data_out/$PAYS
    zip -r $DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ.zip $DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ
    rm -r $DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ

    curl -s -T $REPER/data_out/$PAYS/$DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ.zip ftp://ftp-xxxxxxx/$PAYS/ --user "IDENTIFIANT:PASSWORD"
    curl -s -u "IDENTIFIANT:PASSWORD" "ftp://ftp-xxxxxxx/$PAYS/" -Q "-DELE $DATE_OLD'_OSM2IGEOADMIN_'${file%%.*}_SHP$NZ.zip"

    rm -r $DATE_T'_OSM2IGEOADMIN_'${file%%.*}'_SHP'$NZ.zip

done
#----------------------------------------------------------------------------------
#Suppression des fichiers temporaires
cd $REPER
cd data_temp/$PAYS/$OUT_EPSG/
rm -rfv *

#----------------------------------------------------------------------------------
end=$(date '+%s')
echo "DUREE: $((($end-$start) / 3600))hrs $(((($end-$start) / 60) % 60))min $((($end-$start) % 60))sec"
