DATA=$1
RUN=$2
SEED=$3
PRIOR_IDX=$4

# get rid of " in prior_idx
sed -e 's/^"//' -e 's/"$//' <<<"$PRIOR_IDX"

# run simulation 1, morfine as prior information
rm simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5
asreview simulate simulations/data/output/${DATA}.csv -s simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5 --prior_idx $PRIOR_IDX -m logistic --seed $SEED
python scripts/flatten_state.py simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5 simulations/output/${DATA}/simulation/run_${DATA}_${RUN}_flat.csv
rm simulations/output/${DATA}/simulation/run_${DATA}_${RUN}.h5

# run simulation two, morfine as prior info with morfine removed
rm simulations/output/${DATA}_morfine_removed/simulation/run_${DATA}_${RUN}.h5
asreview simulate simulations/data/output/${DATA}_morfine_removed.csv -s simulations/output/${DATA}_morfine_removed/simulation/run_${DATA}_morfine_removed_${RUN}.h5 --prior_idx $PRIOR_IDX -m logistic --seed $SEED
python scripts/flatten_state.py simulations/output/${DATA}_morfine_removed/simulation/run_${DATA}_morfine_removed_${RUN}.h5 simulations/output/${DATA}_morfine_removed/simulation/run_${DATA}_morfine_removed_${RUN}_flat.csv
rm simulations/output/${DATA}_morfine_removed/simulation/run_${DATA}_morfine_removed_${RUN}.h5


# AGAIN with 150 recoded as exclusion
# run simulation 1, morfine as prior information
rm simulations/output/${DATA}_no150/simulation/run_${DATA}_no150_${RUN}.h5
asreview simulate simulations/data/output/${DATA}_no150.csv -s simulations/output/${DATA}_no150/simulation/run_${DATA}_no150_${RUN}.h5 --prior_idx $PRIOR_IDX -m logistic --seed $SEED
python scripts/flatten_state.py simulations/output/${DATA}_no150/simulation/run_${DATA}_no150_${RUN}.h5 simulations/output/${DATA}_no150/simulation/run_${DATA}_no150_${RUN}_flat.csv
rm simulations/output/${DATA}_no150/simulation/run_${DATA}_no150_${RUN}.h5

# run simulation two, morfine as prior info with morfine removed
rm simulations/output/${DATA}_morfine_removed_no150/simulation/run_${DATA}_${RUN}.h5
asreview simulate simulations/data/output/${DATA}_morfine_removed_no150.csv -s simulations/output/${DATA}_morfine_removed_no150/simulation/run_${DATA}_morfine_removed_no150_${RUN}.h5 --prior_idx $PRIOR_IDX -m logistic --seed $SEED
python scripts/flatten_state.py simulations/output/${DATA}_morfine_removed_no150/simulation/run_${DATA}_morfine_removed_no150_${RUN}.h5 simulations/output/${DATA}_morfine_removed_no150/simulation/run_${DATA}_morfine_removed_no150_${RUN}_flat.csv
rm simulations/output/${DATA}_morfine_removed_no150/simulation/run_${DATA}_morfine_removed_no150_${RUN}.h5
