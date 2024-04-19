
# 3 repeats
# Each of 4 versions
# 3 different timesteps
# Sedov types:
# "sedov_wone" "sedov_cstone" "sedov_west" "sedov_wisb" "sedov_wser" 
for rep in 1
do
    for nodes in 4
    do
        for size in 100
        do 
            for version in "sphexa" "sedov_wone" #"sedov_cstone" # #"sedov_wone" "sedov_cstone" "sedov_wser"
            do
                for timestep in 100
                do
                    for numthreads in 40
                    do
                        ./perftest.sh $version $size $timestep $numthreads $nodes
                        # sleep 3
                        # sleep 20
                    done
                done
            done
        done
    done
done