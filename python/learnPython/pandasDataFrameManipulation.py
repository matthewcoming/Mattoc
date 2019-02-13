import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# a pandas dataframe created with a dict
DICTFRAME = pd.DataFrame({
        'AAA': pd.Series(1, index=list(range(4)), dtype='int32'),
        'BBB': np.array([3] * 4, dtype='int32'),
        'CCC': pd.Categorical(['this', 'is', 'a', 'categorical']),
        'DDD': [1, 2, 3, 4],
        'EEE': np.random.rand(4).tolist()},  # nparray to list
        ['first', 'second', 'third', 'fourth'])

print(DICTFRAME.to_string())

SPACEDNUM = np.linspace(0.0, 2*np.pi, num=100, endpoint=True)
SPACEDONE = np.linspace(-1.0, 1.0, num=100, endpoint=True)


sineDict = {'sin': pd.Series(np.sin(SPACEDNUM), index=SPACEDNUM),
            'cos': pd.Series(np.cos(SPACEDNUM), index=SPACEDNUM),
            'arcsin': pd.Series(np.arcsin(SPACEDONE), index=SPACEDONE),
            'arccos': pd.Series(np.arccos(SPACEDONE), index=SPACEDONE)
            }

DF = pd.DataFrame(sineDict)

TICKMARKS = pd.Series([0, np.pi/2, np.pi, 3*np.pi/2, 2*np.pi])

DF.plot(subplots=True, xticks=TICKMARKS, sharex=True)

plt.show()

TUPLEDICT = pd.DataFrame({
            ('Andrew', 'Profit'): {
                ('First Yr', 'Personal'):   100,
                ('First Yr', 'Company'):    200,
                ('Second Yr', 'Personal'):  300,
                ('Second Yr', 'Company'):   300
                },

            ('Andrew', 'Expend'): {
                ('First Yr', 'Personal'):   101,
                ('First Yr', 'Company'):    201,
                ('Second Yr', 'Personal'):  301,
                ('Second Yr', 'Company'):   301}})

print(TUPLEDICT)
