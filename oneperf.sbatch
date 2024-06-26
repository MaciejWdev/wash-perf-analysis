#!/bin/bash
#
#SBATCH --partition=cpu-batch  # Partition you wish to use (see above for list)
#SBATCH --cpus-per-task=40     # Number of CPU threads used by your job, set this upto 40 as required.
#SBATCH --mem=32000            # 60GB RAM
#SBATCH --exclusive=mcs        # Exclusive mode, only this job will run
#SBATCH --time=1-00:00:00      # Job time limit set to 2 days (48 hours)
#
#SBATCH --job-name=washperformance # Job name for tracking
#SBATCH --output=out/slurms/slurm-%j.out # Standard out from your job
#SBATCH --error=out/slurm_errs/slurm-%j.err  # Standard error from your job

program=$1
n_particles=$2
timestep=$3
numthreads=$4

timenow=$(date +"%N")

export OMP_NUM_THREADS=$numthreads

module load cs402-mpi
module load CUDA/12.2
# Check sphexa in string
# timenow=$(date +"%Y-%m-%d-%H-%M-%S")
# outpath="./out/sphexa/dumps/$timenow/"
if [[ $program == *"sphexa"* ]]
then
    # a=$(mkdir -p $outpath)
    # a=$(cd $outpath)
    # Make program be 4 back
    # program="../../../../../sph-exa-build/main/src/sphexa/sphexa"
    time_output=$(time -p ($program --init sedov --prop std -w 0 -o ./out/sphexa/dumps/$timenow.h5 -n $n_particles -s $timestep) 2>&1)
    # a=$(cd -)
else 
    time_output=$(time -p ($program $n_particles $timestep) 2>&1)
fi

real_time=$(echo "$time_output" | grep "real" | awk '{print $2}')
printf "%s\n\n" "$real_time"

printf "Params:"
printf "Program: %s\n" "$program"
printf "Particles: %s\n" "$n_particles"
printf "Timestep: %s\n" "$timestep"
printf "Numthreads: %s\n" "$numthreads"

printf "%s\n" "$time_output"

x=$(rm -rf ./out/sphexa/dumps/$timenow.h5)