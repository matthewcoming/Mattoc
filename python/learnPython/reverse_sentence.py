"""
This is a docstring.
The ability of this program is to take input through the console and
return the words in reverse order.
"""

SENTENCE = input('Enter a sentence\n')
print('\nThis is your sentence backwards:')
WORDS = SENTENCE.split()
WORDS.reverse()
print(' '.join(WORDS))
