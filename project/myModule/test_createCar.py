import createCar as cc
import nose

focus = cc.Car("ford", "i4", "manual", "black")

def tearDown():
    focus.make = 'ford'
    focus.engine = 'i4'
    focus.transmission = 'manual'
    focus.color = 'black'
    focus.engineRunning = 0

def testGetMakeReturnFord():
    assert focus.getMake() == 'ford'

def testGetEngineRunningReturnZero():
    assert focus.getEngineRunning() == 0

def testGetEngineRunningReturnOne():
    focus.engineRunning = 1
    assert focus.getEngineRunning() == 1

def testGetEngineReturni4():
    assert focus.getEngine() == 'i4'

result = nose.run()
