#!/bin/bash
#SBATCH -p normal
#SBATCH --reservation=geo_course_cpu
#SBATCH -J pyjeo_extract_parcels.sh
#SBATCH -N 1 -c 4 -n 1
#SBATCH -t 1:00:00
#SBATCH -o /home/geocourse-teacher03/stdout/pyjeo_extract_parcels.sh.%J.out
#SBATCH -e /home/geocourse-teacher03/stderr/pyjeo_extract_parcels.sh.%J.err
#SBATCH --mem=500

mkdir -p $HOME/Data

module load Python/3.9.6-GCCcore-11.2.0
module load LibTIFF/4.3.0-GCCcore-11.2.0
module load libgeotiff/1.7.0-GCCcore-11.2.0
module load uthash/2.3.0-foss-2021b
module load shapelib/1.6.0-foss-2021b
module load GSL/2.7-GCC-11.2.0
module load GDAL/3.3.2-foss-2021b
module load jsoncpp/1.9.5-foss-2021b
module load fann/2.2.0-foss-2021b
module load SWIG/4.2.1-foss-2021b

export PYTHONPATH=""
source $HOME/pyjeo-venv/bin/activate

python3 $HOME/scripts/pyjeo_extract_parcels.py -raster /project/geocourse/Data/pyjeo/s2_crop.tif -vector /project/geocourse/Data/pyjeo/parcels_3035.shp