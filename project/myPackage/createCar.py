#Matthew Coming test code to learn git-flow, RST, PEP257(docstrings), and creation of
#python modules
"""Make a car.

Module level docstrings appear as the first "statement" in a module. This first
docstring provides an overview of the module.

This module allows you to make a car, then start and stop the car.

"""
class Car:
    
    """define the Car class.

    First, note that all docstrings begine with a one line summary that ends in
    a period and uses the imperative mood.

    Second, note that the Class level opening and closing quotes are preceded
    and followed by a blank line, respectively. No other docstring should be
    preceded or followed by anything other than code. 

    This class 
    """
    
    def __init__(self, company, engine, interior, transmission, color):
        """initialize car object.
        
        Method level docstring to explain how the __init__ method works.
       
       """
        self.company = company
        self.engine = engine
        self.interior = interior
        self.transmission = transmission
        self.color = color
        self.engineRunning = 0

    def getCompany(self):
        """Return the manufactuer name.
        """
        return self.company

    def getEngine(self):
        """Return the type of engine.
        """
        return self.engine

    def getTransmission(self):
        """Return the type of transmission
        """
        return self.transmission

    def getColor(self):
        """Return color.
        """
        return self.color

    def getEngineRunning(self):
        """Return state of engine.
        """
        return self.engineRunning
    
    def getInterior(self):
        """Return interior spec.
        """
        return self.interior
    def start(self):
        """Start the car.

        car.start() first evaluates if the bool variable `engineRunning` is true. If
        true, print a warning and return. If false, request user input and
        display that the car has started.

        """
        if self.engineRunning == 1:
            print("Car is already on")
            return
        input("Press enter to start the engine.")
        print("Engine started")
        self.engineRunning = 1

    def stop(self):
        if self.engineRunning == 0:
            print("Car is already on")
            return
        input("Press enter to stop the engine")
        print("Engine stopped")
        self.engineRunning = 0
