#!/bin/bash
echo "This script is used to run lir_csv_phylanx example"

iteration_array=(1 100 1000 5000 10000)
row_stop_array=(100 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000)
thr=(1 2 4 6 8 10 12 14 16 18 20)

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
            export OMP_NUM_THREADS=1
            ./lir_csv -t${th} --data_csv=/phylanx-data/CSV/10kx10k.csv  --hpx:bind=balanced --hpx:numa-sensitive --n=${it} --row_stop=${rs} --col_stop=${rs} --hpx:print-counter=/threads{locality#*/total}/idle-rate >> lirphx_${th}th_itrscs_${it}_${rs}
            echo "done ${th}_${it}_${rs}"
       	    done
    	done
   done



