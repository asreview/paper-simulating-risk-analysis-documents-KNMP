"""Script to select prior knowledge.

Usage:

python select_prior_knowledge.py INPUT.csv OUTPUT.csv 20 --seed 89435
python scripts/select_prior_knowledge.py data/Nagtegaal_2019.csv output/Nagtegaal_2019/prior_knowledge.csv 20 --seed 89435


authors: Ferdinands, G and De Bruin, J
"""

import argparse
from pathlib import Path

import pandas as pd
import numpy as np


def sample_prior_knowledge(df, n, seed=None):
    """Sample prior knowledge.

    Arguments
    ---------

    df: pandas.DataFrame
        Input datafile
    n: int
        Number of samples
    seed: int
        Seed value

    Returns
    -------

    list
        Random value.

    """

    np.random.seed(seed)

    #df_incl = df[((df["search"] == "search 1") & (df["final_included"] == 1))]
    #df_excl = df[((df["search"] == "search 1") & (df["final_included"] == 0))]

    # Claassens article
    claassens = df[(df["title"] == "A Genotype-Guided Strategy for Oral P2Y(12) Inhibitors in Primary PCI")]

    result = pd.DataFrame({
         "priors" : (claassens.index)
     })

    result.index.name = "simulation"
    return result


if __name__ == '__main__':

    parser = argparse.ArgumentParser(
        description='Create random prior combinations.'
    )
    parser.add_argument(
        's',
        type=str,
        help='Data file location')
    parser.add_argument(
        'o',
        type=str,
        help='Output file location')
    parser.add_argument(
        'n',
        type=int,
        help='Number of draws')
    parser.add_argument(
        '--seed',
        type=int,
        help='Seed')
    args = parser.parse_args()

    df = pd.read_csv(args.s)  # , index_col="record_id")

    result = sample_prior_knowledge(df, args.n, seed=args.seed)
    print(result)

    # store result in output folder
    Path(args.o).parent.mkdir(parents=True, exist_ok=True)
    result.to_csv(Path(args.o))
