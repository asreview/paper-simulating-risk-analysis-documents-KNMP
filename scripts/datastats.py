import asreview
from asreviewcontrib.visualization.plot import Plot
from asreviewcontrib.statistics import DataStatistics
import os
import pandas as pd

data_dir = "data/output"
data_names = os.listdir(data_dir)
data_files = [os.path.join(data_dir, data_file) for data_file in data_names if data_file.endswith('.xlsx')]
dnames = ['Fentanyl', 'Morfine']

# loop over all datasets
dat_list = [DataStatistics.from_file(ds) for ds in data_files]

for dat in dat_list:
        print("Statistics on", dnames[dat_list.index(dat)], "\n")
        print(DataStatistics.format_summary(dat))
