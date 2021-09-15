# Scripts for simulation report on risk analysis documents of the KNMP.
This repository contains scripts to run and analyze simulation studies to evaluate the performance of ASReview to conduct systematic reviews for the Royal Dutch Pharmacists Association (Koninklijke Nederlandse Maatschappij ter bevordering der Pharmacie, KNMP in Dutch). Here, systematic reviews are conducted for the development of risk analysis documents for the Medicine Information Centre (Geneesmiddel Informatie Centrum, GIC in Dutch). This study was conducted as commissioned by and in cooperation with the KNMP.

The [raw datasets](https://osf.io/f7mev/) have been preprocessed into different versions to answer three different research questions.

1. How much time can be saved by using ASReview on different risk analysis documents of the GIC?
2. Is it useful to include the relevant papers from the previous studies as prior information in ASReview when updating an existing risk analysis document?
3. Is it useful to include relevant papers from a previous risk analysis document within a certain group of medication as prior information in ASReview for a different risk analysis document from the same group?

## Installation

The scripts in this repository require Python 3.6+. Install the extra dependencies with (in the command line):

```
pip install -r requirements.txt
```

## Datasets

The raw and pre-processed data can be obtained via the Open Science Framework ([OSF](https://osf.io/f7mev)) and contains 3 existing risk analysis documents from the KNMP. The following files should be obtained from OSF and put in a folder using the following construction `simulations/data/output` :

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

The results will be stored in a folder `simulations/ouput`. Simulating a systematic review produces files that are very large in size. GitHub does not allow for repositories of this size, therefore the raw datafiles of the simulation are stored on [OSF in another project](https://osf.io/kcqhz/), instead.

## Licence

The content in this repository is published under the MIT license.

## Contact

For any questions or remarks, please send an email to asreview@uu.nl.
