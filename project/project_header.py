#Matthew Coming test project to learn git-flow
import sys

"""making a car"""
class Car(object):

    """initializing the car object"""
    def _init_(self, company, engine, interior, transmission, color):
        self.company = company
        self.engine = engine
        self.interior = interior
        self.transmission = transmission
        self.color = color

    """---class methods---"""

    """starts the car"""
    def start(self):
        sys.stdout.write("Starting engine")
        for i in range(2):
            time.sleep(.500)
            sys.stdout.write(".")
        print("Engine started")
