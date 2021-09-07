"""Render files for simulation based on prior knowledge.
Usage:
python render_simulation_batches.py INPUT.csv my_project_name OUTPUT.csv
authors: Ferdinands, G and De Bruin, J
"""

import argparse
from pathlib import Path

import numpy as np
import pandas as pd

def render_batch(df_prior, filename, n_jobs, seed):
    """Sample prior knowledge.
    Arguments
    ---------
    df_prior: pandas.DataFrame
        Input prior knowledge
    filename: str
        Name of file and folder
    Returns
    -------
    list
        Random value.
    """
    np.random.seed(seed=seed)

    priors = df_prior['priors'].to_numpy()
    runs = list(range(0, n_jobs))

    for run in runs:
        yield f"sh run_simulation_{filename}.sh {filename} {run} {np.random.randint(0, 10000)} \"{' '.join([str(p) for p in priors])}\""


if __name__ == '__main__':

    parser = argparse.ArgumentParser(
        description='Create random prior combinations.'
    )
    parser.add_argument(
        'f_prior',
        type=str,
        help='Prior file location')
    parser.add_argument(
        'project_name',
        type=str,
        help='Project name')
    parser.add_argument(
        'job_file',
        type=str,
        help='Job file location')
    parser.add_argument(
        'n_jobs',
        type=int,
        help='Number of runs')
    parser.add_argument(
        'seed',
        type=int,
        help='Seed value')
    args = parser.parse_args()

    df_prior = pd.read_csv(args.f_prior)

    jobs = render_batch(df_prior, args.project_name, args.n_jobs, args.seed)

    # store result in output folder
    Path(args.job_file).parent.mkdir(parents=True, exist_ok=True)
    with open(args.job_file, "w") as f:
        for job in jobs:
            print(job)
            f.write(job + "\n")
