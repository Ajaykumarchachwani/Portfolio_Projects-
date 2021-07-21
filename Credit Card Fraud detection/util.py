import numpy as np
import pandas as pd
from collections import Counter
from sklearn.utils import shuffle
from sklearn.model_selection import train_test_split

from variables import*
np.random.seed(seed)

def get_data():
    df = pd.read_csv(data_path)
    df_cols = df.columns.values[1:]

    Y = df[df_cols[-1]].astype(np.int32).values
    X = df[df_cols[:-2]].values

    return X, Y

def load_data():
    X, Y = get_data()
    positive_idxs = (Y == 1) # Fraud transactions
    negative_idxs = (Y == 0)
    
    Xpositive = X[positive_idxs]
    Ypositive = Y[positive_idxs]
    
    Xnegative = X[negative_idxs]
    Ynegative = Y[negative_idxs]

    Nnegative = int(len(Xpositive) * negative_to_positive_ratio)

    random_idxs = np.random.choice(len(Xnegative), Nnegative, replace=False)
    Xnegative = Xnegative[random_idxs]
    Ynegative = Ynegative[random_idxs]

    X = np.concatenate((Xnegative, Xpositive), axis=0)
    Y = np.concatenate((Ynegative, Ypositive))

    X, Y = shuffle(X, Y)

    X, Xtest, Y, Ytest = train_test_split(
                                        X, Y, 
                                        test_size = test_split, 
                                        random_state = seed
                                        )

    return X, Xtest, Y, Ytest