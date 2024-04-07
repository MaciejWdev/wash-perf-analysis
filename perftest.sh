# Usage:    ./perftest.sh <version> <n_particles> <timestep> <numthreads>
# Example:  ./perftest.sh sedov_cstone 20 0.5 16 
#           ./perftest.sh sphexa 20 0.5 16      

version=$1
n_particles=$2
timestep=$3
numthreads=$4

# if version is sphexa
if [ $version == "sphexa" ]
then
    sourcedir="../sph-exa-build/main/src/sphexa"
else
    sourcedir="../wash/build"
fi

# sbatch save output to var
# echo "sbatch oneperf.sbatch --job-name=$1 --output=out/$1/$1_$2_$3_$i_%j.out $sourcedir/$1 $n_particles $timestep'"
# jobname=$(sbatch oneperf.sbatch --job-name=$1 --output=out/$1/$1_$2_$3_$i_%j.out $sourcedir/$1 $n_particles $timestep)    
jobname=$(sbatch oneperf.sbatch $sourcedir/$1 $n_particles $timestep $numthreads)
jobname=$(echo $jobname | grep -oP '(?<=\s)\d+')
mkdir -p out/$1
echo "slurm-$jobname.out" >> out/$1/$2-$3-$4-jobs.txt
echo $jobname