
# 3 repeats
# Each of 4 versions
# 3 different timesteps

for version in "sedov_cstone" "sphexa"
do
    for timestep in 100
    do
        for numthreads in 4 8 16 32 40
        do
            ./perftest.sh $version 30 $timestep $numthreads
            sleep 0.2
        done
    done
done
