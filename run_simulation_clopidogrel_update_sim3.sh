DATA=$1
RUN=$2
SEED=$3
PRIOR_IDX=$4

# get rid of " in prior_idx
sed -e 's/^"//' -e 's/"$//' <<<"$PRIOR_IDX"

#update search with all prior knowledge
rm simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5
asreview simulate simulations/data/output/clopidogrel.csv -s simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5 --prior_idx $PRIOR_IDX -m logistic --seed $SEED
python scripts/flatten_state.py simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5 simulations/output/${DATA}/simulation/run_${DATA}_${RUN}_flat.csv
rm simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5
