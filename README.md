# Scripts for simulation report on risk analyses of the KNMP.
This repository contains scripts to run and analyze simulations to evaluate the performance of ASReview to perform systematic reviews concerning risk analyses of the Medication Information center (Geneesmiddel Informatie Centrum, GIC in Dutch). This research conducted was commissioned by and in cooperation with the Royal Dutch Pharmacists Association (Koninklijke Nederlandse Maatschappij ter bevordering der Pharmacie, KNMP in Dutch).

The [raw datasets](https://osf.io/f7mev/) have been preprocessed into different versions to answer three different research questions.

1. How much time can be saved by using ASReview on different risk analyses of the GIC?
2. Is it useful to include the relevant papers from the previous studies as prior information in ASReview when updating an existing risk analysis?
3. Is it useful to include relevant papers from a previous risk analysis within a certain group of medication as prior information in ASReview for a different risk analysis from the same group?

## Installation

The scripts in this repository require Python 3.6+. Install the extra dependencies with (in the command line):

```
pip install -r requirements.txt
```

## Datasets

The raw and pre-processed data can be obtained via the Open Science Framework [OSF](https://osf.io/f7mev/) and contains 3 existing risk analyses from the KNMP. The following files should be obtained from OSF and put in a folder using the following construction `simulations/data/output` :

```
asreview_result_clopidogrel-search1-recoded.csv
asreview_result_clopidogrel-search2-recoded.csv
clopidogrel.csv
clopidogrel_sim2.csv
fentanyl.csv
morfine.csv
morfine_1turns0.csv
morfine_fentanyl.csv
morfine_fentanyl_morfine_removed.csv
morfine_fentanyl_morfine_removed_no150.csv
morfine_fentanyl_no150.csv
morfine_minus1.csv
```

Most important columns within each file:

```
title
abstract
final_included
```

Information about the pre-processing of these datasets can be found on the OSF page.

## Descriptive statistics

Descriptive statistics on the three original datasets are automatically obtained when generating the report.

## Simulation

The simulation was conducted for each dataset with 20 iterations, using 1 randomly chosen relevant and one randomly chosen irrelevant records.
After obtaining the pre-processed data and running `pip install requirements.txt`, one can obtain the result of the simulations by running:

```
sh run_all.sh
```

The results will be stored in a folder `simulations/ouput`. You can find the output of the simulations on this OSF-page [XX] as well.

## Licence

The content in this repository is published under the MIT license.

## Contact

For any questions or remarks, please send an email to asreview@uu.nl.
