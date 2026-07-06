#!/bin/bash

# Force complete hardware parallelization maps 
export BLIS_NUM_THREADS=$(nproc)
export BLIS_JC_NT=$(nproc)
export OMP_NUM_THREADS=$(nproc)

echo "Compiling code natively mapped for your i7 architecture..."
gcc tu.c -O3 -march=native -I/usr/local/include -L/usr/local/lib -lblis -lm -o benchmark

# Wipe out past records clean
rm -f blis_benchmark_results.csv

# Initialize Master Column Headers
echo "Run,MatrixSize,Threads,TimeSeconds,FLOPs,GFLOPS" > blis_benchmark_results.csv

# Arrays scaling out all spreadsheet data points up to 20k
sizes=(2000 4000 6000 8000 10000 12000 14000 16000 18000 20000)

for N in "${sizes[@]}"
do
    echo "------------------------------------------------"
    echo "Running dimension: ${N}x${N} on All Threads"
    echo "------------------------------------------------"
    
    # Executing 5 standard trial runs per size to calculate precise averages
    for run in {1..10}
    do
        echo " -> Loop Calculation Trial #$run"
        ./benchmark $N $run
    done
done

echo ""
echo "Execution processing finished safely."
echo "Your tracking records are ready in: blis_benchmark_results.csv"