import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# a pandas dataframe created with a dict
dictFrame = pd.DataFrame({
        'AAA': pd.Series(1, index=list(range(4)), dtype='int32'),
        'BBB': np.array([3] * 4, dtype='int32'),
        'CCC': pd.Categorical(['this', 'is', 'a', 'categorical']),
        'DDD': [1, 2, 3, 4],
        'EEE': np.random.rand(4).tolist()},  # nparray to list
        ['first', 'second', 'third', 'fourth'])

print(dictFrame.to_string())

spacedNum = np.linspace(0.0, 2*np.pi, num=100, endpoint=True)
spacedOne = np.linspace(-1.0, 1.0, num=100, endpoint=True)


sineDict = {'sin': pd.Series(np.sin(spacedNum), index=spacedNum),
            'cos': pd.Series(np.cos(spacedNum), index=spacedNum),
            'arcsin': pd.Series(np.arcsin(spacedOne), index=spacedOne),
            'arccos': pd.Series(np.arccos(spacedOne), index=spacedOne)
            }

df = pd.DataFrame(sineDict)

tickMarks = pd.Series([0, np.pi/2, np.pi, 3*np.pi/2, 2*np.pi])

df.plot(subplots=True, xticks=tickMarks, sharex=True)

plt.show()

TupleDict = pd.DataFrame({
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

print(TupleDict)
