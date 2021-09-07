"""Stage data.

Split data into 2 datasets, one for tiab and one for final.

Example
-------

python scripts/stage_data.py data/Nagtegaal_2019.csv output/Nagtegaal_2019/data

authors: Ferdinands, G and De Bruin, J
"""

import argparse
from pathlib import Path

import pandas as pd


def rename_label(df, keep):
    """Function to rename label col.
    """

    return df[["title", "abstract", keep]].rename({keep: "label"}, axis=1)




def etl(fp_source, fp_export):
    """Read, transform and save datasets.
    """

    # get the dataset name
    dataset_name = Path(args.s).stem

    # read file
    df = pd.read_csv(fp_source)

    # remove records with missing abstracts
    df = df.dropna(subset=['abstract'])

    # renames labels
    df_final = rename_label(df, "label_included")
    df_tiab = rename_label(df, "label_abstract_screening")

    # export
    Path(fp_export).mkdir(parents=True, exist_ok=True)
    df.to_csv(Path(fp_export, f"{dataset_name}.csv"), index=False)
    df_final.to_csv(Path(fp_export, f"{dataset_name}_final.csv"), index=False)
    df_tiab.to_csv(Path(fp_export, f"{dataset_name}_tiab.csv"), index=False)


if __name__ == '__main__':

    parser = argparse.ArgumentParser(
        description='Stage data'
    )
    parser.add_argument(
        's',
        type=str,
        help='Dataset location')
    parser.add_argument(
        'o',
        type=str,
        help='Dataset export folder')
    args = parser.parse_args()

    etl(args.s, args.o)
