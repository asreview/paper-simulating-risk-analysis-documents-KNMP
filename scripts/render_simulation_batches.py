"""Render files for simulation based on prior knowledge.
Usage:
python render_simulation_batches.py INPUT.csv my_project_name OUTPUT.csv
authors: Ferdinands, G and De Bruin, J
"""

import argparse
from pathlib import Path

import numpy as np
import pandas as pd


def render_batch(df_prior, filename, seed):
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

    for row in df_prior.itertuples():
        yield f"sh run_simulation.sh {filename} {row.Index} {row.inclusion} {row.exclusion} {np.random.randint(0, 10000)}"


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
        'seed',
        type=int,
        help='Seed value')
    args = parser.parse_args()

    df_prior = pd.read_csv(args.f_prior)

    jobs = render_batch(df_prior, args.project_name, args.seed)

    # store result in output folder
    Path(args.job_file).parent.mkdir(parents=True, exist_ok=True)
    with open(args.job_file, "w") as f:
        for job in jobs:
            print(job)
            f.write(job + "\n")
