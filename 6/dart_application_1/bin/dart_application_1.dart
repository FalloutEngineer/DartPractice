import 'dart:ffi';

class Vehicle {
  String _manufacturer;
  double _fuelCapacity;
  double _fuelRemaining;
  String driver = 'Anonymous';

  Vehicle(this._manufacturer, this._fuelCapacity, this._fuelRemaining) {
    if (_fuelRemaining > _fuelCapacity) _fuelRemaining = _fuelCapacity;
  }

  factory Vehicle.fromString(String vehicleString) {
    var vehicleArray = vehicleString.split(' ');

    return Vehicle(vehicleArray[0], double.parse(vehicleArray[1]),
        double.parse(vehicleArray[2]));
  }

  @override
  String toString() =>
      '$_manufacturer, $_fuelRemaining/$_fuelCapacity ... $driver';

  double get halfOfFuel => _fuelCapacity / 2;
  double get criticalFuelLevel => _fuelRemaining * 0.1;

  double get fuelCapacity => _fuelCapacity;
  double get fuelRemaining => _fuelRemaining;

  set fuelCapacity(double newCapacity) {
    if (newCapacity >= 0) {
      _fuelCapacity = newCapacity;
      if (_fuelRemaining > _fuelCapacity) {
        _fuelRemaining = _fuelCapacity;
      }
    } else {
      _fuelCapacity = _fuelRemaining = 0;
    }
  }

  set fuelRemaining(double newFuel) {
    if (newFuel > _fuelCapacity) {
      _fuelRemaining = _fuelCapacity;
    } else {
      _fuelRemaining = newFuel;
    }
  }
}

void main(List<String> arguments) {
  var car = Vehicle("BMW", 90, 95)..driver = "MAX";

  var car2 = Vehicle.fromString("Lada 1 1")..driver = "Kolyan";

  print(car.toString());

  car.fuelCapacity = 100;

  car.fuelRemaining = 99;

  car.fuelCapacity = 50;

  // car.fuelCapacity = -5;

  print(car.fuelRemaining);
  print(car2.toString());
}
