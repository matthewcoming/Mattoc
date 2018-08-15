from myModule import createCar


Focus = createCar.Car("Ford", "i4", "Recaro", "manual", "Black")

Focus.start()
print('The {0.company} Focus has {0.interior} seats and an {0.engine} engine'.format(Focus))
Focus.stop()
print('The {} Focus has {} seats and an {} engine'.format(Focus.getCompany(),
    Focus.getInterior(), Focus.getEngine()))

