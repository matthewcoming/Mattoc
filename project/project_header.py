#Matthew Coming test project to learn git-flow
import time
import sys
"""making a car"""
class Car:
    """initializing the car object"""
    def __init__(self, company, engine, interior, transmission, color):
        self.company = company
        self.engine = engine
        self.interior = interior
        self.transmission = transmission
        self.color = color
        self.state = 0

    """---class methods---"""

    """starts the car"""
    def start(self): 
        if self.state == 1:
            print("Car is already on")
            return
        input("Press enter to start the engine.")
        print("Engine started")
        self.state = 1
