DATA=$1
RUN=$2
PRIOR_INCL=$3
PRIOR_EXCL=$4
SEED=$5

# run simulation 1, final inclusions
rm simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5
asreview simulate simulations/data/output/${DATA}.csv -s simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5 --prior_idx $PRIOR_INCL $PRIOR_EXCL -m logistic --seed $SEED
python scripts/flatten_state.py simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5 simulations/output/${DATA}/simulation/run_${DATA}_${RUN}_flat.csv
rm simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5
