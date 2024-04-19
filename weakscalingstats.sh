
# 3 repeats
# Each of 4 versions
# 3 different timesteps

# Weak Scaling:
# Threads: 1 ,2 , 4, 8,16,32,40
# Sizes:   10,13,16,20,25,32,34


# Sedov types:
# "sedov_wone" "sedov_cstone" "sedov_west" "sedov_wisb" "sedov_wser" 
if [ $1 == "b" ]
then
    echo "Running test case b"
    for version in "sphexa" # "sedov_wone" "sedov_cstone" # "sedov_wser" "sedov_west" "sedov_wser"
    do
        # ./perftest.sh $version $size $timestep $numthreads
        ./perftest.sh $version 68 100 40
        # sleep 20
        ./perftest.sh $version 63 100 32
        # sleep 30
        ./perftest.sh $version 50 100 16
        # sleep 30
        ./perftest.sh $version 40 100 8
        # sleep 30
        ./perftest.sh $version 32 100 4
        # sleep 60
        ./perftest.sh $version 25 100 2
        # sleep 60
        ./perftest.sh $version 20 100 1
        # sleep 30
    done
elif [ $1 == "a" ]
then
    for version in "sphexa" # "sedov_wone" "sedov_cstone" # "sedov_wser" "sedov_west" "sedov_wser"
    do
        # ./perftest.sh $version $size $timestep $numthreads
        ./perftest.sh $version 34 100 40
        # sleep 20
        ./perftest.sh $version 32 100 32
        # sleep 30
        ./perftest.sh $version 25 100 16
        # sleep 30
        ./perftest.sh $version 20 100 8
        # sleep 30
        ./perftest.sh $version 16 100 4
        # sleep 60
        ./perftest.sh $version 13 100 2
        # sleep 60
        ./perftest.sh $version 10 100 1
        # sleep 30
    done
fi


