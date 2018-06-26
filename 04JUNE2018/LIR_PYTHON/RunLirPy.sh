#!/bin/bash

echo "This script is used to run lir_csv_python example"


iteration_array=(1 1000 5000 10000)
row_stop_array=(100 2000 4000 6000 8000 10000)
thr=(4 8 12 16 20)

#iteration_array=(1 1000)
#row_stop_array=(100 1000)
#thr=(1 2)
for th in "${thr[@]}"
    do
    for it in "${iteration_array[@]}"
        do
        for rs in "${row_stop_array[@]}"
            do		
            echo "doing ${th}_${it}_${rs}_thitrs"	
            export OMP_NUM_THREADS=${th}
            echo $OMP_NUM_THREADS   
            python3 lir_csv_python.py $it 0 $rs 0 $rs >> lirpy_${th}th_itrscs_${it}_${rs}
            echo "done ${th}_${it}_${rs}"	
	    done
        done
    done



