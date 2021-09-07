"""Script to flatten state file.

Usage:

python flatten_state.py my_sim_run.json my_sim_run_flat.csv

authors: Ferdinands, G and De Bruin, J
"""

import argparse
from pathlib import Path

import pandas as pd

from asreview import open_state
from asreview.analysis.statistics import _get_labeled_order
from asreview.analysis.statistics import _find_inclusions


def flatten_state_file(state):
    """Function to flatten a state file.

    Arguments
    ---------

    state: asreview.state
        An ASReview state file.

    Returns
    -------

    pandas.DataFrame
        Falt dataframe with x and y axis of the recall curve.

    """
    order, n_initial = _get_labeled_order(state)
    labels = state.get("labels")
    incl, _, _ = _find_inclusions(state, labels, remove_initial=False)
    print(incl)
    df = pd.DataFrame({
        "record_id": order,
        "n_inclusions": incl
    })

    df_labels = pd.DataFrame({
        "record_id": range(len(labels)),
        "label": labels,
    })
    df = df.merge(df_labels, how="left", on="record_id")
    df.index.name = "iteration"
    return df


if __name__ == '__main__':

    parser = argparse.ArgumentParser(
        description='Convert ASReview state file to CSV'
    )
    parser.add_argument(
        's',
        type=str,
        help='State file location')
    parser.add_argument(
        'o',
        type=str,
        help='RIS file location')
    args = parser.parse_args()

    with open_state(args.s) as state:
        result = flatten_state_file(state)

    # convert to pandas dataframe for export
    print("Number of inclusions found:", result["n_inclusions"].max())

    # store result in output folder
    Path(args.o).parent.mkdir(parents=True, exist_ok=True)
    result.to_csv(Path(args.o))
