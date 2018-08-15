def drawcube(n):
    try:
        int(n)
    except ValueError:
        print('input must be an integer')
    if n % 2 == 1:
        raise ValueError('User input was an odd number.')

    # defines the most commonly used, same sized
    frontLine = ''.join(['-' for _ in range(n*2)])
    frontSpace = ''.join([' ' for _ in range(n*2)])

    print('+{0}+'.format(frontLine))

    for i in range(n/2):
        tempSpace = ''.join([' ' for _ in range(i)])
        print('|{0}\\{1}\\'.format(tempSpace, frontSpace))

    tempSpace += ' '

    print('|{0}+{1}+'.format(tempSpace, frontLine))

    for i in range((n/2) - 1):
        print('|{0}|{1}|'.format(tempSpace, frontSpace))

    print('+{0}|{1}|'.format(tempSpace, frontSpace))

    startSpace = ' '
    endSpace = ''.join([' ' for _ in range((n/2) - 1)])

    for i in range(n/2):
        print('{0}\\{1}|{2}|'.format(startSpace, endSpace, frontSpace))

        startSpace += ' '

        if endSpace:
            endSpace = endSpace[0:-1]

        frontSpace = frontSpace[0:-1]
        frontSpace += ' '

    print('{0}+{1}+'.format(startSpace, frontLine))


drawcube(16)
