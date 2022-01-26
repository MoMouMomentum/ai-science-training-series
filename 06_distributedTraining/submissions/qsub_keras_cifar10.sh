#!/bin/bash
#COBALT -n 1
#COBALT -t 15 -q full-node
#COBALT -A ALCFAITP -O results/$jobid.keras_cifar10

#submisstion script for running tensorflow_mnist with horovod

echo "Running Cobalt Job $COBALT_JOBID."

#Loading modules
. /etc/profile.d/z00_lmod.sh
module load conda
conda activate

COBALT_JOBSIZE=$(cat $COBALT_NODEFILE | wc -l)
for n in 1 2 4 8
do
    mpirun -np $n python tensorflow2_keras_cifar10.py --device gpu --epochs 32 >& results/tensorflow2_keras_cifar10.out.$n
done


