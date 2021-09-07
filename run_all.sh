N_JOBS=20

#pip install scripts/requirements.txt

# research question 1
python scripts/select_prior_knowledge.py simulations/data/output/clopidogrel.csv simulations/output/clopidogrel/prior_knowledge.csv ${N_JOBS} --seed 89435
python scripts/render_simulation_batches.py simulations/output/clopidogrel/prior_knowledge.csv clopidogrel simulations/output/clopidogrel/jobs_simulation.sh 32948
sh simulations/output/clopidogrel/jobs_simulation.sh

python scripts/select_prior_knowledge.py simulations/data/output/morfine.csv simulations/output/morfine/prior_knowledge.csv ${N_JOBS} --seed 89435
python scripts/render_simulation_batches.py simulations/output/morfine/prior_knowledge.csv morfine simulations/output/morfine/jobs_simulation.sh 39930
sh simulations/output/morfine/jobs_simulation.sh

python scripts/select_prior_knowledge.py simulations/data/output/fentanyl.csv simulations/output/fentanyl/prior_knowledge.csv ${N_JOBS} --seed 89435
python scripts/render_simulation_batches.py simulations/output/fentanyl/prior_knowledge.csv fentanyl simulations/output/Fentanyl/jobs_simulation.sh 39237
sh simulations/output/fentanyl/jobs_simulation.sh

# extra morfine with 1 inclusion turned exclusion (with prior knowledge from morfine)
python scripts/render_simulation_batches.py simulations/output/morfine/prior_knowledge.csv morfine_1turns0 simulations/output/morfine_1turns0/jobs_simulation.sh 39930
sh simulations/output/morfine_1turns0/jobs_simulation.sh

# extra morfine with 1 inclusion removed
python scripts/select_prior_knowledge.py simulations/data/output/morfine_minus1.csv simulations/output/morfine_minus1/prior_knowledge.csv ${N_JOBS} --seed 89435
python scripts/render_simulation_batches.py simulations/output/morfine_minus1/prior_knowledge.csv morfine_minus1 simulations/output/morfine_minus1/jobs_simulation.sh 39930
sh simulations/output/morfine_minus1/jobs_simulation.sh

# research question 2 ##########################################################
#simulation 1: update search (only prior knowledge = Claassens)
python scripts/select_prior_knowledge_update_search_sim1.py simulations/data/output/asreview_result_clopidogrel-search2-recoded.csv simulations/output/clopidogrel_update_sim1/prior_knowledge.csv ${N_JOBS} --seed 89435
python scripts/render_simulation_batches_update_search.py simulations/output/clopidogrel_update_sim1/prior_knowledge.csv clopidogrel_update_sim1 simulations/output/clopidogrel_update_sim1/jobs_simulation.sh ${N_JOBS} 49646
sh simulations/output/clopidogrel_update_sim1/jobs_simulation.sh
#
# # simulation 2: prior knowledge = Claassens + inclusions search 1
python scripts/select_prior_knowledge_update_search_sim2.py simulations/data/output/clopidogrel_sim2.csv simulations/output/clopidogrel_update_sim2/prior_knowledge.csv ${N_JOBS} --seed 89435
python scripts/render_simulation_batches_update_search.py simulations/output/clopidogrel_update_sim2/prior_knowledge.csv clopidogrel_update_sim2 simulations/output/clopidogrel_update_sim2/jobs_simulation.sh ${N_JOBS} 49646
sh simulations/output/clopidogrel_update_sim2/jobs_simulation.sh

# # simulation 3: prior knowledge = Claassens + inclusions & exclusions search 1
python scripts/select_prior_knowledge_update_search_sim3.py simulations/data/output/clopidogrel.csv simulations/output/clopidogrel_update_sim3/prior_knowledge.csv ${N_JOBS} --seed 89435
python scripts/render_simulation_batches_update_search.py simulations/output/clopidogrel_update_sim3/prior_knowledge.csv clopidogrel_update_sim3 simulations/output/clopidogrel_update_sim3/jobs_simulation.sh ${N_JOBS} 49646
sh simulations/output/clopidogrel_update_sim3/jobs_simulation.sh

# # # research question 3 ##########################################################
# # # simulation 1: fentanyl with morfine as prior knowledge
python scripts/select_prior_knowledge_rq3.py simulations/data/output/morfine_fentanyl.csv simulations/output/morfine_fentanyl/prior_knowledge.csv ${N_JOBS} --seed 89435
python scripts/render_simulation_batches_update_search.py simulations/output/morfine_fentanyl/prior_knowledge.csv morfine_fentanyl simulations/output/morfine_fentanyl/jobs_simulation.sh ${N_JOBS} 69275

# # research question 3 part 2 - remove id 150 #################################
# # simulation 1: fentanyl with morfine as prior knowledge, use same prior knowledge (only different dataset)
# necessary scripts are `in run_simulation_morfine_fentanyl.sh`

sh simulations/output/morfine_fentanyl/jobs_simulation.sh

